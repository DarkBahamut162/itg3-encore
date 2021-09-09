--[[ Screen Filter ]]
local numPlayers = GAMESTATE:GetNumPlayersEnabled()
local center1P = getenv("RotationSoloP1") or getenv("RotationSoloP2");

local padding = 8 -- 4px on each side
local arrowWidth = 64 -- until noteskin metrics are implemented...

local filterColor = color("0.135,0.135,0.135,1")
local filterAlphas = {
	PlayerNumber_P1 = 1,
	PlayerNumber_P2 = 1,
	Default = 0,
}

local t = Def.ActorFrame{};

local style = GAMESTATE:GetCurrentStyle()
local cols = style:ColumnsPerPlayer()
local styleType = ToEnumShortString(style:GetStyleType())
local filterWidth = (arrowWidth * cols) + padding

if numPlayers == 1 then
	local player = GAMESTATE:GetMasterPlayerNumber()
	local pNum = (player == PLAYER_1) and 1 or 2
	local filterAlpha = tonumber(getenv("ScreenFilterP"..pNum));
	if getenv("EffectVibrateP"..pNum) then
		filterWidth = filterWidth + 30
	end

	local pos;
	-- [ScreenGameplay] PlayerP#Player*Side(s)X
	local metricName = string.format("PlayerP%i%sX",pNum,styleType)
	pos = THEME:GetMetric("ScreenGameplay",metricName)
	t[#t+1] = Def.Quad{
		Name="SinglePlayerFilter";
		InitCommand=function(self) self:x(pos):CenterY():zoomto(filterWidth,SCREEN_HEIGHT*3):diffusecolor(filterColor):diffusealpha(filterAlpha) end;
		OnCommand=function(self)
			--Rotation
			if getenv("RotationLeftP"..pNum) then 
				self:rotationz(90)
			elseif getenv("RotationRightP"..pNum) then
				self:rotationz(90)
			end
			if getenv("RotationUpsideDownP"..pNum) then self:addy(20) end
			if getenv("RotationSoloP"..pNum) then
				if pNum == 1 then
					self:addx(SCREEN_WIDTH/4)
				elseif pNum == 2 then
					self:addx(-SCREEN_WIDTH/4)
				end
			end
			
			--Effect
			if getenv("EffectSpinP"..pNum) then 
				self:spin() 
				self:effectclock('beat') 
				self:effectmagnitude(0,0,45)
			end
			if getenv("EffectSpinReverseP"..pNum) then 
				self:spin() 
				self:effectclock('beat') 
				self:effectmagnitude(0,0,-45)
			end
			if getenv("EffectBounceP"..pNum) then
				self:bob()
				self:effectclock('beat') 
				self:effectmagnitude(30,30,30)
			end
			if getenv("EffectPulseP"..pNum) then
				self:pulse()
				self:effectclock('beat')
			end
			if getenv("EffectWagP"..pNum) then 
				self:wag()
				self:effectclock('beat')
			end
		end;
	};
else
	-- two players... a bit more complex.
	if styleType == "TwoPlayersSharedSides" then
		-- routine, just use one in the center.
		local player = GAMESTATE:GetMasterPlayerNumber()
		local pNum = player == PLAYER_1 and 1 or 2
		local metricName = "PlayerP".. pNum .."TwoPlayersSharedSidesX"
		filterAlphas[player] = tonumber(getenv("ScreenFilterP"..pNum))
		t[#t+1] = Def.Quad{
			Name="RoutineFilter";
			InitCommand=function(self) self:x(THEME:GetMetric("ScreenGameplay",metricName)):CenterY():zoomto(filterWidth,SCREEN_HEIGHT*3):diffusecolor(filterColor):diffusealpha(filterAlphas[player]) end;
		};
	else
		-- otherwise we need two separate ones. to the pairsmobile!
		for i, player in ipairs(PlayerNumber) do
			local pNum = (player == PLAYER_1) and 1 or 2
			filterAlphas[player] = tonumber(getenv("ScreenFilterP"..pNum));
			local metricName = string.format("PlayerP%i%sX",pNum,styleType)
			local pos = THEME:GetMetric("ScreenGameplay",metricName)
			t[#t+1] = Def.Quad{
				Name="Player"..pNum.."Filter";
				InitCommand=function(self) self:x(pos):CenterY():zoomto(filterWidth,SCREEN_HEIGHT*3):diffusecolor(filterColor):diffusealpha(filterAlphas[player] or 0.5) end;
				OnCommand=function(self)
					--Rotation
					if getenv("RotationLeftP"..pNum) then 
						self:rotationz(90)
					elseif getenv("RotationRightP"..pNum) then
						self:rotationz(90)
					end
					if getenv("RotationUpsideDownP"..pNum) then self:addy(20) end
					
					--Effect
					if getenv("EffectSpinP"..pNum) then 
						self:spin() 
						self:effectclock('beat') 
						self:effectmagnitude(0,0,45)
					end
					if getenv("EffectSpinReverseP"..pNum) then 
						self:spin() 
						self:effectclock('beat') 
						self:effectmagnitude(0,0,-45)
					end
					if getenv("EffectBounceP"..pNum) then
						self:bob()
						self:effectclock('beat') 
						self:effectmagnitude(30,30,30)
					end
					if getenv("EffectPulseP"..pNum) then
						self:pulse()
						self:effectclock('beat')
					end
					if getenv("EffectWagP"..pNum) then 
						self:wag()
						self:effectclock('beat')
					end
				end;
			};
		end
	end
end

return t;
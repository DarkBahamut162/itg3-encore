local player = ...
assert(player,"[Graphics/_pane steps] player required")

local topedge = {
	{1,		1,		1},
	{0,		1,		0},
	{0.75,	1,		0},
	{1,		1,		0},
	{1,		0.53,	0},
	{1,		0.4,	0},
	{0,		0.75,	1},
	{0.66,	0,		1},
	{1,		0,		0},
	{0.99,	0.29,	1}
}

local bottomedge = {
	{0.89,	0.89,	0.89},
	{0.35,	1,		0.35},
	{0.84,	1,		0.33},
	{1,		1,		0.38},
	{1,		0.65,	0.25},
	{1,		0.58,	0.30},
	{0.38,	0.85,	1},
	{0.76,	0.31,	1},
	{1,		0.33,	0.33},
	{1,		1,		1}
}

local steps = {0,250,375,600,625,750,875,1000,1200}

for key,value in pairs(topedge) do
    topedge[key][1] = string.format("%x", topedge[key][1] * 255)
    topedge[key][2] = string.format("%x", topedge[key][2] * 255)
    topedge[key][3] = string.format("%x", topedge[key][3] * 255)
end

for key,value in pairs(bottomedge) do
    bottomedge[key][1] = string.format("%x", bottomedge[key][1] * 255)
    bottomedge[key][2] = string.format("%x", bottomedge[key][2] * 255)
    bottomedge[key][3] = string.format("%x", bottomedge[key][3] * 255)
end


return Def.ActorFrame{
	InitCommand=function(self) self:y(-1) if IsUsingWideScreen() and hasAvatar(player) then self:x(player == PLAYER_1 and 48 or -48) end end,
	LoadFont("_z 36px shadowx")..{
		Name="StepCount",
		InitCommand=function(self) self:x(-67):y(120+4):zoom(0.35):diffusealpha(0) end,
		OnCommand=function(self) self:sleep(0.4):linear(0.2):diffusealpha(1):shadowlength(2) end,
		OffCommand=function(self) self:accelerate(0.2):diffusealpha(0) end,
		SetCommand=function(self)
			local val = 0
			local add = ""
			local SongOrCourse = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse() or GAMESTATE:GetCurrentSong()
			local StepOrTrails = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(player) or GAMESTATE:GetCurrentSteps(player)
			local numSongs

			if SongOrCourse and StepOrTrails and (not GAMESTATE:IsCourseMode() or (GAMESTATE:IsCourseMode() and not IsCourseSecret())) then
				numSongs = GAMESTATE:IsCourseMode() and TrailUtil.GetNumSongs(StepOrTrails) or 1
				val = StepOrTrails:GetRadarValues(player):GetValue('RadarCategory_TapsAndHolds')
				if StepOrTrails:GetRadarValues(player):GetValue('RadarCategory_Fakes') > 0 then add = "?" end
				if not GAMESTATE:IsCourseMode() or (GAMESTATE:IsCourseMode() and not IsCourseSecret()) then
					if val == 0 then
						self:diffusetopedge(color("#"..topedge[1][1]..topedge[1][2]..topedge[1][3]))
						self:diffusebottomedge(color("#"..bottomedge[1][1]..bottomedge[1][2]..bottomedge[1][3]))
					elseif val <= 249 * numSongs then
						self:diffusetopedge(color("#"..topedge[2][1]..topedge[2][2]..topedge[2][3]))
						self:diffusebottomedge(color("#"..bottomedge[2][1]..bottomedge[2][2]..bottomedge[2][3]))
					elseif val <= 374 * numSongs then
						self:diffusetopedge(color("#"..topedge[3][1]..topedge[3][2]..topedge[3][3]))
						self:diffusebottomedge(color("#"..bottomedge[3][1]..bottomedge[3][2]..bottomedge[3][3]))
					elseif val <= 499 * numSongs then
						self:diffusetopedge(color("#"..topedge[4][1]..topedge[4][2]..topedge[4][3]))
						self:diffusebottomedge(color("#"..bottomedge[4][1]..bottomedge[4][2]..bottomedge[4][3]))
					elseif val <= 624 * numSongs then
						self:diffusetopedge(color("#"..topedge[5][1]..topedge[5][2]..topedge[5][3]))
						self:diffusebottomedge(color("#"..bottomedge[5][1]..bottomedge[5][2]..bottomedge[5][3]))
					elseif val <= 749 * numSongs then
						self:diffusetopedge(color("#"..topedge[6][1]..topedge[6][2]..topedge[6][3]))
						self:diffusebottomedge(color("#"..bottomedge[6][1]..bottomedge[6][2]..bottomedge[6][3]))
					elseif val <= 874 * numSongs then
						self:diffusetopedge(color("#"..topedge[7][1]..topedge[7][2]..topedge[7][3]))
						self:diffusebottomedge(color("#"..bottomedge[7][1]..bottomedge[7][2]..bottomedge[7][3]))
					elseif val <= 999 * numSongs then
						self:diffusetopedge(color("#"..topedge[8][1]..topedge[8][2]..topedge[8][3]))
						self:diffusebottomedge(color("#"..bottomedge[8][1]..bottomedge[8][2]..bottomedge[8][3]))
					elseif val <= 1199 * numSongs then
						self:diffusetopedge(color("#"..topedge[9][1]..topedge[9][2]..topedge[9][3]))
						self:diffusebottomedge(color("#"..bottomedge[9][1]..bottomedge[9][2]..bottomedge[9][3]))
					else
						self:diffusetopedge(color("#"..topedge[10][1]..topedge[10][2]..topedge[10][3]))
						self:diffusebottomedge(color("#"..bottomedge[10][1]..bottomedge[10][2]..bottomedge[10][3]))
					end
				end
			else
				self:diffusetopedge(color("#ffffff"))
				self:diffusebottomedge(color("#ffffff"))
				val = "?"
			end
			self:settext(val..add)
			self:maxwidth(150)
		end,
		CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
		["CurrentSteps".. pname(player) .."ChangedMessageCommand"]=function(self) self:playcommand("Set") end,
		["CurrentTrail".. pname(player) .."ChangedMessageCommand"]=function(self) self:playcommand("Set") end
	},
	LoadFont("_v 26px bold white")..{
		Name="Label",
		InitCommand=function(self) self:x(-67):y(120+17):settext("STEPS"):shadowlength(2):zoomx(0.45):zoomy(0.4):diffusealpha(0) end,
		OnCommand=function(self) self:sleep(0.85):linear(0.2):diffusebottomedge(color("#8F8F8F")):diffusealpha(1) end,
		OffCommand=function(self) self:accelerate(0.2):diffusealpha(0) end
	}
}
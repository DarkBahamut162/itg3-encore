local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:diffuse(color("#000000")):stretchto(SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM) end,
		OnCommand=function(self) self:diffusealpha(0):linear(0.5):diffusealpha(1):sleep(0.5) end
	},
	LoadActor("updatecoin") .. {
		InitCommand=function(self) self:Center():blend("BlendMode_Add") end,
		OnCommand=function(self) self:zoom(0):diffusealpha(0):rotationz(-20):linear(0.5):zoom(18):diffusealpha(1):rotationz(150) end
	},
	LoadActor("updatecoin") .. {
		InitCommand=function(self) self:Center():blend("BlendMode_Add") end,
		OnCommand=function(self) self:zoom(0):diffusealpha(0):rotationz(20):linear(0.5):zoom(18):diffusealpha(1):rotationz(-70) end
	}
}

if GAMESTATE:GetCoinMode() ~= 'CoinMode_Pay' then
	t[#t+1] = LoadActor(THEME:GetPathS("Common","coin")) .. {
		StartTransitioningCommand=function(self) self:play() end
	}
end

return t
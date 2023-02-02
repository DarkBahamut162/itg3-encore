return Def.ActorFrame{
	LoadActor("inthegroove")..{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y-80):zoom(0.7) end
	},
	LoadActor(isOutFox() and "outfox" or (isITGmania() and "itgmania" or "stepmania"))..{
		InitCommand=function(self) self:x(SCREEN_LEFT+SCREEN_WIDTH/4):y(SCREEN_CENTER_Y+80):zoom(0.65) end
	},
	LoadActor("bxrx")..{
		InitCommand=function(self) self:x(SCREEN_RIGHT-SCREEN_WIDTH/4):y(SCREEN_CENTER_Y+80):zoom(0.6) end
	},
	Def.Quad{
		InitCommand=function(self) self:FullScreen():diffusealpha(1) end,
		OnCommand=function(self) self:sleep(0.1):accelerate(0.5):diffusealpha(0) end
	},
	LoadActor(THEME:GetPathB("ScreenAttract","overlay"))
}
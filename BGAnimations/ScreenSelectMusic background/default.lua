return Def.ActorFrame{
	LoadActor(isFinal() and "CJ126 Final" or "CJ126 Normal")..{
		InitCommand=function(self) self:Center():zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_WIDTH/4*3) end,
		OnCommand=function(self) self:linear(1.5):diffusealpha(1) end
	}
}
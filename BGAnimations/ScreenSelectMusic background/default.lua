return Def.ActorFrame{
	LoadActor("_fallback")..{ InitCommand=function(self) self:Center() end; };
	LoadActor("_CJ126_")..{
		InitCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_WIDTH/4*3);
		OnCommand=function(self) self:linear(1.5):diffusealpha(1) end;
	};
}

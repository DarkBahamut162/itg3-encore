return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/back"))..{
		OnCommand=function(self) self:playcommand("DoOn") end;
	};
	LoadActor(THEME:GetPathB("_shared","underlay arrows"))..{
		OnCommand=function(self) self:playcommand("DoOn") end;
	};

	LoadActor("explanation frame")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-55-34;y,SCREEN_CENTER_Y+120;diffusealpha,0;);
		OnCommand=function(self) self:linear(0.5):diffusealpha(1.0) end;
		MadeChoiceP1MessageCommand=function(self) self:playcommand("GoOff") end;
		MadeChoiceP2MessageCommand=function(self) self:playcommand("GoOff") end;
		GoOffCommand=function(self) self:linear(0.5):diffusealpha(0) end;
	};

	LoadActor(THEME:GetPathB("ScreenWithMenuElements","underlay/fore"))..{
		OnCommand=function(self) self:playcommand("DoOn") end;
	};
};
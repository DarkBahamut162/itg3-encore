-- trickery!
InitOptions()

return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenEndingNormal","overlay/p1gradient"))..{
		InitCommand=function(self) self:x(SCREEN_RIGHT):y(SCREEN_TOP+63):halign(1):valign(0):zoomtoheight(420):addx(150) end;
		OnCommand=function(self) self:sleep(0.8):decelerate(0.2):addx(-150) end;
	};
	LoadActor(THEME:GetPathB("ScreenEndingNormal","overlay/p1gradient"))..{
		InitCommand=function(self) self:x(SCREEN_RIGHT):y(SCREEN_TOP+63):halign(1):valign(0):zoomtoheight(420):addx(150) end;
		OnCommand=function(self) self:sleep(0.8):decelerate(0.2):addx(-150) end;
	};
};
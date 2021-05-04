-- ScreenSelectPlayMode Icon Choice1
return Def.ActorFrame{
	LoadFont("_r bold glow 30px")..{
		Text="Good clean dancing fun\nfor all players";
		InitCommand=cmd(x,SCREEN_CENTER_X-55-34;y,SCREEN_CENTER_Y+125;zoomx,.8;zoomy,.7;maxwidth,300;horizalign,center;shadowlength,0);
		GainFocusCommand=function(self) self:visible(true):finishtweening():cropright(1):linear(0.5):cropright(0) end;
		LoseFocusCommand=function(self) self:visible(false) end;
		OffCommand=function(self) self:linear(0.3):diffusealpha(0) end;
	};
	Def.ActorFrame{
		InitCommand=cmd(y,SCREEN_CENTER_Y+155-270;horizalign,right);
		LoadActor(THEME:GetPathG("_join","icons/title1"))..{
			OnCommand=cmd(x,SCREEN_RIGHT-136;y,-3;zoomto,155,80);
			GainFocusCommand=cmd(accelerate,0.1;diffuse,color("#FFFFFF");x,SCREEN_RIGHT-136);
			LoseFocusCommand=function(self) self:finishtweening():decelerate(0.1):diffuse(color("#636363")):x(SCREEN_RIGHT-116) end;
			OffFocusCommand=function(self) self:accelerate(0.4):addx(-SCREEN_WIDTH*.5) end;
		};
		LoadActor(THEME:GetPathG("_join","icons/dance_icon"))..{
			GainFocusCommand=cmd(accelerate,0.1;diffuse,color("#FFFFFF");x,SCREEN_RIGHT-130);
			LoseFocusCommand=function(self) self:finishtweening():decelerate(0.1):diffuse(color("#636363")):x(SCREEN_RIGHT-110) end;
			OffFocusCommand=function(self) self:accelerate(0.4):addx(-SCREEN_WIDTH*.5) end;
		};
		LoadActor(THEME:GetPathG("_join","icons/gameglow"))..{
			InitCommand=function(self) self:blend(Blend.Add) end;
			GainFocusCommand=cmd(accelerate,0.1;diffusealpha,1;x,SCREEN_RIGHT-130;sleep,.07;linear,.2;diffusealpha,0);
			LoseFocusCommand=function(self) self:finishtweening():decelerate(0.1):x(SCREEN_RIGHT-110):diffusealpha(0) end;
			OffFocusCommand=function(self) self:accelerate(0.4):addx(-SCREEN_WIDTH*.5) end;
		};
	};
};
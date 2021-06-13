return Def.ActorFrame{
	LoadActor("_triangle")..{
		InitCommand=function(self) self:blend(Blend.Add):x(-38):diffuseblink():effectcolor1(color("0.6,0.6,0.6,1")):effectperiod(1):effectoffset(0):effectclock("beat") end;
		ExitSelectedP1Command=function(self) self:stoptweening():linear(.15):rotationz(-90) end;
		ExitUnselectedP1Command=function(self) self:stoptweening():linear(.15):rotationz(0) end;
	};
	LoadActor("_triangle")..{
		InitCommand=function(self) self:blend(Blend.Add):x(38):diffuseblink():effectcolor1(color("0.6,0.6,0.6,1")):effectperiod(1):effectoffset(0):effectclock("beat") end;
		ExitSelectedP2Command=function(self) self:stoptweening():linear(.15):rotationz(90) end;
		ExitUnselectedP2Command=function(self) self:stoptweening():linear(.15):rotationz(0) end;
	};
	LoadActor("moreexit")..{
		InitCommand=function(self) self:y(-19):croptop(.57):cropbottom(.1) end;
		GainFocusCommand=function(self) self:stoptweening():linear(.15):y(-16):croptop(.57):cropbottom(.1) end;
		LoseFocusCommand=function(self) self:stoptweening():linear(.15):y(16):croptop(.07):cropbottom(.6) end;
	};

	Def.ActorFrame{
		InitCommand=function(self) self:x(-228+40) end;
		BeginCommand=function(self) self:visible(GAMESTATE:IsPlayerEnabled(PLAYER_1)) end;
		LoadActor("1")..{
			InitCommand=function(self) self:y(42):diffusealpha(0) end;
			ExitSelectedP1Command=function(self) self:stoptweening():decelerate(.2):y(52):diffusealpha(1) end;
			ExitUnselectedP1Command=function(self) self:stoptweening():accelerate(.2):y(42):diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():accelerate(.1):y(42):diffusealpha(0) end;
		};

		LoadActor("_ready")..{
			InitCommand=function(self) self:y(51):zoom(0) end;
			ExitSelectedP1Command=function(self) self:stoptweening():zoom(0):bounceend(.2):zoom(1) end;
			ExitUnselectedP1Command=function(self) self:stoptweening():bouncebegin(.2):zoom(0) end;
			OffCommand=function(self) self:stoptweening():bouncebegin(.1):zoom(0) end;
		};
		LoadActor("_textglow")..{
			InitCommand=function(self) self:y(51):diffusealpha(0) end;
			ExitSelectedP1Command=function(self) self:stoptweening():sleep(.1):diffusealpha(1):cropleft(-0.3):cropright(1):faderight(.1):fadeleft(.1):sleep(0.3):linear(1):cropleft(1):cropright(-0.3) end;
			ExitUnselectedP1Command=function(self) self:finishtweening():diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():linear(.1):diffusealpha(0) end;
		};
		LoadActor(THEME:GetPathG("","blueflare.png"))..{
			InitCommand=function(self) self:y(52):diffusealpha(0):zoomx(5):blend(Blend.Add) end;
			ExitSelectedP1Command=function(self) self:stoptweening():zoomy(3):linear(.1):diffusealpha(1):decelerate(.3):zoomy(0):diffusealpha(0) end;
			ExitUnselectedP1Command=function(self) self:stoptweening():diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():linear(0.3):diffusealpha(0) end;
		};

		LoadActor("2")..{
			InitCommand=function(self) self:y(62):diffusealpha(0) end;
			ExitSelectedP1Command=function(self) self:stoptweening():decelerate(.2):y(52):diffusealpha(1) end;
			ExitUnselectedP1Command=function(self) self:stoptweening():accelerate(.2):y(62):diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():accelerate(.1):y(62):diffusealpha(0) end;
		};
	};
	Def.ActorFrame{
		InitCommand=function(self) self:x(228-40) end;
		BeginCommand=function(self) self:visible(GAMESTATE:IsPlayerEnabled(PLAYER_2)) end;
		LoadActor("3")..{
			InitCommand=function(self) self:y(42):diffusealpha(0) end;
			ExitSelectedP2Command=function(self) self:stoptweening():decelerate(.2):y(52):diffusealpha(1) end;
			ExitUnselectedP2Command=function(self) self:stoptweening():accelerate(.2):y(42):diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():accelerate(.1):y(42):diffusealpha(0) end;
		};

		LoadActor("_ready")..{
			InitCommand=function(self) self:y(51):zoom(0) end;
			ExitSelectedP2Command=function(self) self:stoptweening():zoom(0):bounceend(.2):zoom(1) end;
			ExitUnselectedP2Command=function(self) self:stoptweening():bouncebegin(.2):zoom(0) end;
			OffCommand=function(self) self:stoptweening():bouncebegin(.1):zoom(0) end;
		};
		LoadActor("_textglow")..{
			InitCommand=function(self) self:y(51):diffusealpha(0) end;
			ExitSelectedP2Command=function(self) self:stoptweening():sleep(.1):diffusealpha(1):cropleft(-0.3):cropright(1):faderight(.1):fadeleft(.1):sleep(0.3):linear(1):cropleft(1):cropright(-0.3) end;
			ExitUnselectedP2Command=function(self) self:finishtweening():diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():linear(.1):diffusealpha(0) end;
		};
		LoadActor(THEME:GetPathG("","blueflare.png"))..{
			InitCommand=function(self) self:y(52):diffusealpha(0):zoomx(5):blend(Blend.Add) end;
			ExitSelectedP2Command=function(self) self:stoptweening():zoomy(3):linear(.1):diffusealpha(1):decelerate(.3):zoomy(0):diffusealpha(0) end;
			ExitUnselectedP2Command=function(self) self:stoptweening():diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():linear(0.3):diffusealpha(0) end;
		};

		LoadActor("4")..{
			InitCommand=function(self) self:y(62):diffusealpha(0) end;
			ExitSelectedP2Command=function(self) self:stoptweening():decelerate(.2):y(52):diffusealpha(1) end;
			ExitUnselectedP2Command=function(self) self:stoptweening():accelerate(.2):y(62):diffusealpha(0) end;
			OffCommand=function(self) self:stoptweening():accelerate(.1):y(62):diffusealpha(0) end;
		};
	};
};
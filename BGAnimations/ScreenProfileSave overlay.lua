return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+158):diffuse(color("#000000FF")):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT/2) end;
	};
	Def.Quad{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y-158):diffuse(color("#000000FF")):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT/2) end;
	};
	LoadActor("lolhi")..{
		Condition=not GAMESTATE:IsAnyHumanPlayerUsingMemoryCard();
		InitCommand=function(self) self:Center():zoomx(SCREEN_WIDTH):zoomy(0.68) end;
	};
	LoadActor("profile")..{
		Condition=GAMESTATE:IsAnyHumanPlayerUsingMemoryCard();
		InitCommand=function(self) self:Center():zoomx(SCREEN_WIDTH):zoomy(0.68) end;
	};
	LoadFont("_z 36px shadowx")..{
		Condition=not GAMESTATE:IsAnyHumanPlayerUsingMemoryCard();
		Text="SAVING PROFILES...";
		InitCommand=function(self) self:x(SCREEN_CENTER_X+42):CenterY():zoom(0.75) end;
		OnCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToSave() then
				self:sleep(1)
				self:linear(0.25)
				self:diffusealpha(0)
			end
		end;
	};
	LoadFont("_z 36px shadowx")..{
		Condition=GAMESTATE:IsAnyHumanPlayerUsingMemoryCard();
		Text="SAVING MACHINE STATS...";
		InitCommand=function(self) self:x(SCREEN_CENTER_X+42):CenterY():zoom(0.7):diffusealpha(0) end;
		OnCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToSave() then
				self:sleep(1)
				self:linear(0.25)
				self:diffusealpha(1)
			end
		end;
	};
	LoadActor("_disk")..{
		InitCommand=function(self) self:x(SCREEN_CENTER_X-120):CenterY() end;
		OnCommand=function(self) self:spin():decelerate(0.2):addx(-56):zoom(0):rotationz(360) end;
	};

	Def.Actor{
		BeginCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(1.5); end;
			self:queuecommand("Load");
		end;
		LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
	};
};
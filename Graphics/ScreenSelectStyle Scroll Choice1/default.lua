return Def.ActorFrame{
	MadeChoiceP1MessageCommand=function(self) self:playcommand("GoOff") end;
	MadeChoiceP2MessageCommand=function(self) self:playcommand("GoOff") end;
	GoOffCommand=function(self)
		self:linear(0.5)
		local bHasFocus=math.abs(self:GetZoomZ()-1.1)<0.01;
		if bHasFocus then
			self:x(0):y(0)
			self:diffuse(color("1,1,1,1"))
			self:zoom(1)
			self:glowblink()
			self:sleep(0.5)
			self:linear(0.5)
			self:zoom(0)
		else
			self:x(0):y(0):z(0):zoom(0)
		end
		self:sleep(5)
	end;
	GainFocusCommand=function(self) self:zoom(1) end;
	LoseFocusCommand=function(self) self:zoom(0.6) end;
	Def.ActorFrame{
		InitCommand=function(self) self:x(60):y(-50):zoom(1.4) end;
		GainFocusCommand=function(self) self:wag():effectmagnitude(0,10,0) end;
		LoseFocusCommand=function(self) self:stopeffect() end;
		LoadActor(THEME:GetPathG("_platform","home single"))..{
			InitCommand=function(self) self:rotationx(30) end;
		};
	};
	LoadActor("title")..{
		InitCommand=function(self) self:x(60):y(-116):shadowlength(4) end;
		EnabledCommand=function(self) self:stopeffect() end;
		DisabledCommand=function(self) self:diffuseshift():effectcolor1(color("0,0,0,1")):effectcolor2(color("0,0,0,1")) end;
	};
	LoadActor(THEME:GetPathG("","blueflare.png"))..{
		InitCommand=function(self) self:x(60):y(-116):blend(Blend.Add):diffusealpha(0) end;
		GainFocusCommand=function(self) self:finishtweening():zoom(0):diffusealpha(0):zoomx(7):zoomy(4):diffusealpha(1):linear(0.2):zoomy(0):diffusealpha(0) end;
		LoseFocusCommand=function(self) self:diffusealpha(0) end;
		OffCommand=function(self) self:diffusealpha(0) end;
	};
	LoadActor(THEME:GetPathG("","blueflare.png"))..{
		InitCommand=function(self) self:x(60):y(-116):blend(Blend.Add):diffusealpha(0) end;
		GainFocusCommand=function(self) self:finishtweening():zoom(0):diffusealpha(0):zoomx(7):zoomy(4):diffusealpha(1):linear(0.4):zoomy(0):diffusealpha(0) end;
		LoseFocusCommand=function(self) self:diffusealpha(0) end;
		OffCommand=function(self) self:diffusealpha(0) end;
	};
};
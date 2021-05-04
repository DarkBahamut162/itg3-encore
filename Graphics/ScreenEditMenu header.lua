local t = Def.ActorFrame{
	LoadFont("_z bold gray 36px")..{
		Text="EDIT MANAGER";
		InitCommand=function(self) self:x(SCREEN_RIGHT-20):y(SCREEN_TOP+28):shadowlength(2):halign(1):zoom(.5):cropright(1.3):faderight(0.1) end;
		OnCommand=function(self) self:sleep(.2):linear(0.8):cropright(-0.3) end;
	};
};

return t;
return Def.ActorFrame{
	LoadFont("_eurostile normal")..{
		Text="Easy";
		InitCommand=cmd(x,4;zoom,.5;shadowlength,2;diffuse,ContrastingDifficultyColor("Easy");diffusealpha,0);
		OnCommand=function(self) self:sleep(0.1):linear(0.3):diffusealpha(1) end;
		OffCommand=function(self) self:linear(0.3):diffusealpha(0) end;
	};
};
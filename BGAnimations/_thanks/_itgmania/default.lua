return Def.ActorFrame{
	LoadActor("logo")..{
		InitCommand=function(self) self:x(4):y(5):zoomto(18,18) end,
		OnCommand=function(self) self:wag():effectclock("beat"):effectperiod(0.83*2):effectmagnitude(4,0,4) end
	},
	LoadActor("text")..{
		InitCommand=function(self) self:x(16):y(5):halign(0):zoomto(92,22):diffusealpha(0.75) end
	}
}
return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:FullScreen():diffuse(color("0,0,0,1")) end,
		OnCommand=function(self) self:linear(0.2):diffusealpha(0) end
	},
	Def.ActorFrame{
		Condition=GAMESTATE:IsAnyHumanPlayerUsingMemoryCard(),
		LoadActor("profile")..{
			InitCommand=function(self) self:Center():zoomx(SCREEN_WIDTH):zoomy(0.68*WideScreenDiff()) end,
			OnCommand=function(self) self:linear(0.2):zoomy(0.0) end
		},
		LoadFont("_z 36px shadowx")..{
			Text="LOADING PROFILES...",
			InitCommand=function(self) self:x(SCREEN_CENTER_X+42*WideScreenDiff()):CenterY():zoom(0.7*WideScreenDiff()) end,
			OnCommand=function(self) self:linear(0.2):diffuse(color("0,0,0,0")) end
		}
	},
	Def.ActorFrame{
		Condition=not GAMESTATE:IsAnyHumanPlayerUsingMemoryCard(),
		LoadActor("lolhi")..{
			InitCommand=function(self) self:Center():zoomx(SCREEN_WIDTH):zoomy(0.68*WideScreenDiff()) end,
			OnCommand=function(self) self:linear(0.2):zoomy(0.0) end
		},
		LoadFont("_z 36px shadowx")..{
			Text="LOADING...",
			InitCommand=function(self) self:x(SCREEN_CENTER_X+42*WideScreenDiff()):CenterY():zoom(0.7*WideScreenDiff()) end,
			OnCommand=function(self) self:linear(0.2):diffuse(color("0,0,0,0")) end
		}
	}
}

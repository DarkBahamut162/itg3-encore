return Def.ActorFrame{
    Def.ActorFrame{
		LoadActor("frame "..(isFinal() and "final" or "normal")),
		LoadFont("_r bold 30px")..{
			Text="Harvey Kung",
			OnCommand=function(self) self:y(10):x(42):diffuse(color("#FFFFFF")) end
		},
		LoadFont("_r normal")..{
			Text="Theme, Coding",
			OnCommand=function(self) self:y(-29):x(38):zoomx(0.57):zoomy(0.6):shadowlength(0):diffuse(color("#FFFFFF")) end
		},
		LoadActor("_people")..{
			OnCommand=function(self) self:animate(0):setstate(0):x(-114) end
		}
	}
}
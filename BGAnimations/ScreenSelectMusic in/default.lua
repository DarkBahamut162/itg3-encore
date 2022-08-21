return Def.ActorFrame{
	LoadActor(THEME:GetPathB("_selectmusic","menu in add"));
	Def.Actor{
		OnCommand=function(self) self:sleep(0.8) end;
	};
	LoadActor(THEME:GetPathB("_statsout","musicwheel"))..{
		Condition=GAMESTATE:IsAnyHumanPlayerUsingMemoryCard();
	};
	LoadActor("open.ogg")..{
		OnCommand=function(self) self:play() end;
	};
};
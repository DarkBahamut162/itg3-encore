local t = Def.ActorFrame{
	Def.StepsDisplayList{
		Name="StepsDisplayList";
		SetCommand=function(self)
			self:visible(GAMESTATE:GetCurrentSong() ~= nil)
		end;
		CurrentSongChangedMessageCommand=function(self) self:queuecommand("Set") end;

		CursorP1=LoadActor(THEME:GetPathG('DifficultyList', 'cursor p1'))..{
			Name='CursorP1';
			InitCommand=function(self) self:player(PLAYER_1) end;
		};
		CursorP1Frame=Def.ActorFrame{
			Name='CursorP1Frame';
			ChangeCommand=function(self) self:finishtweening():decelerate(0.15) end;
		};
		CursorP2=LoadActor(THEME:GetPathG('DifficultyList', 'cursor p2'))..{
			Name='CursorP2';
			InitCommand=function(self) self:player(PLAYER_2) end;
		};
		CursorP2Frame=Def.ActorFrame {
			Name='CursorP2Frame';
			ChangeCommand=function(self) self:finishtweening():decelerate(0.15) end;
		};
	};
};

return t;

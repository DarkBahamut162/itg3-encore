return Def.ActorFrame{
	Def.Sprite{
		InitCommand=function(self) self:LoadFromSongBackground(GAMESTATE:GetCurrentSong()) end,
		OnCommand=function(self) self:scale_or_crop_background():sleep(0.3):linear(0.3):diffusealpha(0) end
	}
}
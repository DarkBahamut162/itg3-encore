local player = ...
assert(player,"[Graphics/_pane icons] player required")

return Def.ActorFrame{
	Condition=IsUsingWideScreen() and hasAvatar(player),
	InitCommand=function(self) self:y((ThemePrefs.Get("ShowStepCounter") and isOutFox()) and 3 or -1) end,
	OnCommand=function(self) self:addx(player == PLAYER_1 and -SCREEN_CENTER_X or SCREEN_CENTER_X):sleep(0.4):decelerate(0.3):addx(player == PLAYER_1 and SCREEN_CENTER_X or -SCREEN_CENTER_X) end,
	OffCommand=function(self) self:accelerate(0.2):diffusealpha(0) end,
	Def.Sprite{
		InitCommand=function(self) self:xy(player == PLAYER_1 and -96 or 96,110):CropTo(58,58):Load(LoadModule("Options.GetProfileData.lua")(player)["Image"]) end
	},
	Def.ActorFrame{
		Def.Sprite {
			Texture = "border "..(isFinal() and "final" or "normal"),
			InitCommand=function(self) self:xy(player == PLAYER_1 and -96 or 96,110):shadowlength(1):zoom(0.8) end
		}
	}
}
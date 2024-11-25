return Def.ActorFrame{
	loadfile(THEME:GetPathB("ScreenWithMenuElements","underlay/_normaltop"))(),
	Def.Sprite {
		Texture = "flare",
		InitCommand=function(self) self:blend(Blend.Add):x(SCREEN_LEFT-128*WideScreenDiff()):y(SCREEN_TOP+40*WideScreenDiff()):zoom(WideScreenDiff()) end,
		OnCommand=function(self) self:queuecommand("Animate") end,
		AnimateCommand=function(self) self:sleep(0.6):rotationz(0):linear(1):x(SCREEN_RIGHT+128*WideScreenDiff()):rotationz(360) end
	},
	Def.Sprite {
		Texture = "flare",
		InitCommand=function(self) self:blend(Blend.Add):x(SCREEN_RIGHT+128*WideScreenDiff()):y(SCREEN_BOTTOM-40*WideScreenDiff()):zoom(WideScreenDiff()) end,
		OnCommand=function(self) self:queuecommand("Animate") end,
		AnimateCommand=function(self) self:sleep(0.6):rotationz(0):linear(1):x(SCREEN_LEFT-128*WideScreenDiff()):rotationz(360) end
	}
}
return Def.ActorFrame{
	LoadActor("_base")..{
		Condition=not isRave(),
		OnCommand=function(self) self:x(SCREEN_CENTER_X-200*WideScreenDiff()):y(SCREEN_CENTER_Y+154*WideScreenDiff()):zoom(WideScreenDiff()):addx(-EvalTweenDistance()):sleep(3):decelerate(0.3):addx(EvalTweenDistance()) end,
		OffCommand=function(self) self:accelerate(0.3):addx(-EvalTweenDistance()) end
	},
	LoadActor("_maskp1")..{
		Condition=not isRave(),
		InitCommand=function(self) self:zbuffer(1):blend(Blend.NoEffect) end,
		OnCommand=function(self) self:x(SCREEN_CENTER_X-138*WideScreenDiff()):y(SCREEN_CENTER_Y+188*WideScreenDiff()):zoom(WideScreenDiff()):addx(-EvalTweenDistance()):sleep(3):decelerate(0.3):addx(EvalTweenDistance()) end,
		OffCommand=function(self) self:accelerate(0.3):addx(-EvalTweenDistance()) end
	}
}
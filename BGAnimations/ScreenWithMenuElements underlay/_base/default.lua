return Def.ActorFrame{
	LoadActor("_lside")..{
		Condition=not isFinal(),
		InitCommand=function(self) self:x(SCREEN_LEFT):y(SCREEN_BOTTOM+97):horizalign(left):vertalign(bottom) end,
		OnCommand=function(self) self:decelerate(0.6):y(SCREEN_BOTTOM) end,
		OffCommand=function(self) self:accelerate(0.5):addy(100) end
	},
	LoadActor("_rside")..{
		Condition=not isFinal(),
		InitCommand=function(self) self:x(SCREEN_RIGHT):y(SCREEN_BOTTOM+97):horizalign(right):vertalign(bottom) end,
		OnCommand=function(self) self:decelerate(0.6):y(SCREEN_BOTTOM) end,
		OffCommand=function(self) self:accelerate(0.5):addy(100) end
	},
	LoadActor("width")..{
		Condition=not isFinal(),
		InitCommand=function(self) self:x(SCREEN_LEFT+48):y(SCREEN_BOTTOM+97):horizalign(left):vertalign(bottom):zoomtowidth(SCREEN_WIDTH/2) end,
		OnCommand=function(self) self:decelerate(0.6):y(SCREEN_BOTTOM) end,
		OffCommand=function(self) self:accelerate(0.5):addy(100) end
	},
	LoadActor("width")..{
		Condition=not isFinal(),
		InitCommand=function(self) self:x(SCREEN_RIGHT-48):y(SCREEN_BOTTOM+97):horizalign(right):vertalign(bottom):zoomtowidth(SCREEN_WIDTH/2) end,
		OnCommand=function(self) self:decelerate(0.6):y(SCREEN_BOTTOM) end,
		OffCommand=function(self) self:accelerate(0.5):addy(100) end
	},
	LoadActor("base "..(isFinal() and "final" or "normal"))..{
		InitCommand=function(self) self:CenterX():y(SCREEN_BOTTOM+97):valign(1) end,
		OnCommand=function(self) self:decelerate(0.6):y(SCREEN_BOTTOM) end,
		OffCommand=function(self) self:accelerate(0.5):addy(100) end
	}
}
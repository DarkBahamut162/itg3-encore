return Def.ActorFrame{
    Def.ActorFrame{
        OnCommand=function(self) self:x(SCREEN_LEFT+60*WideScreenDiff()*WideScreenDiff()):CenterY() end,
        loadfile(THEME:GetPathB("ScreenEndingPerfect","overlay/_ITG credits text-perfect"))()
    },
    Def.Sprite {
        Texture = "_r",
        OnCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y-SCREEN_HEIGHT/8):zoom(WideScreenSemiDiff()):diffusealpha(0):sleep(91.5):linear(0.8):diffusealpha(1) end
    },
    Def.Sprite {
        Texture = "_b",
        OnCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+SCREEN_HEIGHT/8):zoom(WideScreenSemiDiff()):diffusealpha(0):sleep(91.5):linear(0.8):diffusealpha(1) end
    },
    Def.BitmapText {
        File = "_v credit",
        Text="Released 2009 - Dedicated to the game that never was.",
        OnCommand=function(self) self:CenterX():y(SCREEN_BOTTOM-100):zoom(0.6*WideScreenSemiDiff()):diffusealpha(0):sleep(91.5):linear(0.8):diffusealpha(1) end
    },
    loadfile(THEME:GetPathG('ScreenEnding', 'card p1'))()..{
        Condition=HumanAndProfile(PLAYER_1),
        InitCommand=function(self) self:x(SCREEN_CENTER_X-248*WideScreenDiff()):y(SCREEN_CENTER_Y+162*WideScreenDiff()):zoom(WideScreenDiff()) end
    },
    loadfile(THEME:GetPathG('ScreenEnding', 'card p2'))()..{
        Condition=HumanAndProfile(PLAYER_2),
        InitCommand=function(self) self:x(SCREEN_CENTER_X+248*WideScreenDiff()):y(SCREEN_CENTER_Y+162*WideScreenDiff()):zoom(WideScreenDiff()) end
    }
}
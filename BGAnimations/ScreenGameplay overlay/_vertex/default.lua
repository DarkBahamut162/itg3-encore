local TitleSongFade = isOutFox() and LoadModule("Text.FadeSlide.lua"){
	Width = 579, Font = "_r bold 30px", Height = 40, SleepBeforeStart = 0, SideFade = 0, OverflowSpacing = 0
} or Def.ActorFrame{ Create = function(this) return Def.ActorFrame{} end }

local vertexOn = false
local vertexColor = color("0,0,0,0")
local song = GAMESTATE:GetCurrentSong()
local title = song:GetDisplayFullTitle()

if title == "VerTex" then vertexOn = true vertexColor = color("0,1,0,1") end
if title == "VerTex²" or title == "VerTex^2" or title == "VerTex2" or title == "VV" then vertexOn = true vertexColor = color("1,0,0,1") end
if title == "VerTex³" or title == "VerTex^3" or title == "VerTex3" or title == "VVV" then vertexOn = true vertexColor = color("1,0,1,1") end

return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=function(self) self:CenterX():y(SCREEN_TOP+22):zoom(WideScreenDiff()):addy(-100) end,
		OnCommand=function(self) self:sleep(0.5):queuecommand("TweenOn") end,
		OffCommand=function(self) self:queuecommand("TweenOff") end,
		ShowGameplayTopFrameMessageCommand=function(self) self:playcommand("TweenOn") end,
		HideGameplayTopFrameMessageCommand=function(self) self:playcommand("TweenOff") end,
		TweenOnCommand=function(self) self:decelerate(0.8):addy(100) end,
		TweenOffCommand=function(self) if AnyPlayerFullComboed() then self:sleep(1) end self:accelerate(0.8):addy(-100) end,
		LoadActor("_base shade")
	},
	Def.ActorFrame{
		InitCommand=function(self) self:CenterX():y(SCREEN_TOP-2+27):zoom(WideScreenDiff()):addy(-100) end,
		OnCommand=function(self) self:sleep(0.5):queuecommand("TweenOn") end,
		OffCommand=function(self) self:queuecommand("TweenOff") end,
		TweenOnCommand=function(self) self:decelerate(0.8):addy(100) end,
		TweenOffCommand=function(self) if AnyPlayerFullComboed() then self:sleep(1) end self:accelerate(0.8):addy(-100) end,
		Def.SongMeterDisplay{
			InitCommand=function(self) self:SetStreamWidth(292) if vertexOn then self:diffusecolor(vertexColor) end end,
			Stream=LoadActor("meter stream"),
			Tip=LoadActor("tip")..{
				OnCommand=function(self) self:zoom(0):sleep(1.8):zoom(1):diffuseshift():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0.5")):effectclock("beat"):effectperiod(4) end
			}
		}
	},
	Def.ActorFrame{
		OnCommand=function(self) self:visible(not isRave()) end,
		StandardDecorationFromFile("BPMDisplay","BPMDisplay")
	},
	Def.ActorFrame{
		OnCommand=function(self) self:addy(-100):sleep(0.5):queuecommand("TweenOn") end,
		OffCommand=function(self) self:queuecommand("TweenOff") end,
		TweenOnCommand=function(self) self:decelerate(0.8):addy(100) end,
		TweenOffCommand=function(self) if AnyPlayerFullComboed() then self:sleep(1) end self:accelerate(0.8):addy(-100) end,
		LoadActor("_uplight top")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+22*WideScreenDiff()):zoom(WideScreenDiff()):diffusealpha(0) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#007892")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("_uplight top")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+22*WideScreenDiff()):zoom(WideScreenDiff()):diffusealpha(0):blend(Blend.Add) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#FFFFFF00")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("_uplight bottom")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+39*WideScreenDiff()):zoom(WideScreenDiff()):diffusealpha(0):visible(not isRave()) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#007892")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("_uplight bottom")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+39*WideScreenDiff()):zoom(WideScreenDiff()):diffusealpha(0):blend(Blend.Add):visible(not isRave()) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#FFFFFF00")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("width")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X-190*WideScreenDiff()):y(SCREEN_TOP+22*WideScreenDiff()):halign(1):zoomtowidth(3*WideScreenDiff()) if vertexOn then self:diffusecolor(vertexColor) end end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):zoomtowidth(SCREEN_WIDTH/2-200*WideScreenDiff()) end
		},
		LoadActor("width")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X+190*WideScreenDiff()):y(SCREEN_TOP+22*WideScreenDiff()):halign(0):zoomtowidth(3*WideScreenDiff()) if vertexOn then self:diffusecolor(vertexColor) end end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):zoomtowidth(SCREEN_WIDTH/2-200*WideScreenDiff()) end
		},
		LoadActor("left")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X-193*WideScreenDiff()):y(SCREEN_TOP+22*WideScreenDiff()):zoom(WideScreenDiff()):halign(1) if vertexOn then self:diffusecolor(vertexColor) end end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):x(SCREEN_LEFT+16*WideScreenDiff()) end
		},
		LoadActor("left")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X+193*WideScreenDiff()):y(SCREEN_TOP+22*WideScreenDiff()):zoom(WideScreenDiff()):halign(1):zoomx(-1*WideScreenDiff()) if vertexOn then self:diffusecolor(vertexColor) end end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):x(SCREEN_RIGHT-16*WideScreenDiff()) end
		},
		LoadActor("_base normal")..{ InitCommand=function(self) self:CenterX():y(SCREEN_TOP+22*WideScreenDiff()):zoom(WideScreenDiff()) if vertexOn then self:diffusecolor(vertexColor) end end },
		LoadActor("_base bpm")..{ InitCommand=function(self) self:CenterX():y(SCREEN_TOP+59*WideScreenDiff()):zoom(WideScreenDiff()):visible(not isRave()) if vertexOn then self:diffusecolor(vertexColor) end end },
		LoadActor("_neons top")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+22*WideScreenDiff()):zoom(WideScreenDiff()):blend(Blend.Add) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#007892")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("_neons top")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+22*WideScreenDiff()):zoom(WideScreenDiff()) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#FFFFFF00")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("_neons bottom")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+38*WideScreenDiff()):zoom(WideScreenDiff()):blend(Blend.Add):visible(not isRave()) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#007892")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("_neons bottom")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+38*WideScreenDiff()):zoom(WideScreenDiff()):visible(not isRave()) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#FFFFFF00")):effectcolor2(color("#00EAFF")):effectperiod(0.5):effect_hold_at_full(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		Def.ActorFrame{
			TitleSongFade:Create()..{
				InitCommand=function(self) self:CenterX():y(SCREEN_TOP+24*WideScreenDiff()):zoom(0.5*WideScreenDiff()) end,
				OnCommand=function(self) self:zoom(0.5*WideScreenDiff()):shadowlength(2*WideScreenDiff()):zoomy(0):sleep(2):decelerate(0.3):zoomy(0.45*WideScreenDiff()) end,
			}
		},
		LoadFont("_r bold 30px")..{
			InitCommand=function(self) self:visible(not isOutFox()):CenterX():y(SCREEN_TOP+24*WideScreenDiff()):maxwidth(573):diffusebottomedge(color("#dedede")) end,
			OnCommand=function(self) self:zoom(0.5*WideScreenDiff()):shadowlength(2*WideScreenDiff()):zoomy(0):sleep(2):decelerate(0.3):zoomy(0.45*WideScreenDiff()):animate(0):playcommand("Update") end,
			CurrentSongChangedMessageCommand=function(self) self:playcommand("Update") end,
			UpdateCommand=function(self)
				local text = ""
				local song = GAMESTATE:GetCurrentSong()
				if song then text = song:GetDisplayFullTitle() end
				if isOutFox() then TitleSongFade:SetText( text.."                                                                " ) end
				self:settext(text)
			end
		}
	},
	Def.ActorFrame{
		OnCommand=function(self) self:draworder(1):sleep(0.5):queuecommand("TweenOn") end,
		OffCommand=function(self) self:queuecommand("Hide") end,
		ShowGameplayTopFrameMessageCommand=function(self) self:playcommand("TweenOn") end,
		HideGameplayTopFrameMessageCommand=function(self) self:queuecommand("Hide") end,
		HideCommand=function(self)
			if AnyPlayerFullComboed() then self:sleep(1) end
			self:queuecommand('TweenOff')
		end,
		Def.ActorFrame{
			Condition=GAMESTATE:IsPlayerEnabled(PLAYER_1) or isRave(),
			Name="Player1",
			OnCommand=function(self) self:x(SCREEN_CENTER_X-240*WideScreenDiff()):y(SCREEN_TOP+27*WideScreenDiff()):zoom(WideScreenDiff()):addx(-SCREEN_WIDTH/2) end,
			TweenOnCommand=function(self) self:sleep(1.5):decelerate(0.5):addx(SCREEN_WIDTH/2) end,
			TweenOffCommand=function(self) self:accelerate(0.8):addx(-SCREEN_WIDTH/2) end,
			LoadActor("_difficulty icons")..{
				InitCommand=function(self) self:pause():playcommand("Update") end,
				UpdateCommand=function(self)
					local StepsOrTrail = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(PLAYER_1) or GAMESTATE:GetCurrentSteps(PLAYER_1)
					if StepsOrTrail then
						self:visible(true):setstate(DifficultyToState(StepsOrTrail:GetDifficulty()))
					else
						self:visible(false)
					end
				end
			},
			LoadActor("difficulty glow")..{
				InitCommand=function(self) self:blend(Blend.Add):diffusealpha(0):draworder(110) end,
				OnCommand=function(self) self:sleep(2.4):decelerate(0.5):diffusealpha(1):sleep(0.2):decelerate(0.8):diffusealpha(0):sleep(0) end,
				OffCommand=function(self) self:stoptweening():decelerate(0.3):diffusealpha(0) end
			}
		},
		Def.ActorFrame{
			Condition=GAMESTATE:IsPlayerEnabled(PLAYER_2) or isRave(),
			Name="Player2",
			OnCommand=function(self) self:x(SCREEN_CENTER_X+240*WideScreenDiff()):y(SCREEN_TOP+27*WideScreenDiff()):zoom(WideScreenDiff()):addx(SCREEN_WIDTH/2) end,
			TweenOnCommand=function(self) self:sleep(1.5):decelerate(0.5):addx(-SCREEN_WIDTH/2) end,
			TweenOffCommand=function(self) self:accelerate(0.8):addx(SCREEN_WIDTH/2) end,
			LoadActor("_difficulty icons")..{
				InitCommand=function(self) self:pause():zoomx(-1):playcommand("Update") end,
				UpdateCommand=function(self)
					local StepsOrTrail = GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(PLAYER_2) or GAMESTATE:GetCurrentSteps(PLAYER_2)
					if StepsOrTrail then
						self:visible(true):setstate(DifficultyToState(StepsOrTrail:GetDifficulty()))
					else
						self:visible(false)
					end
				end
			},
			LoadActor("difficulty glow")..{
				InitCommand=function(self) self:zoomx(-1):blend(Blend.Add):diffusealpha(0):draworder(110) end,
				OnCommand=function(self) self:sleep(2.4):decelerate(0.5):diffusealpha(1):sleep(0.2):decelerate(0.8):diffusealpha(0):sleep(0) end,
				OffCommand=function(self) self:stoptweening():decelerate(0.3):diffusealpha(0) end
			}
		}
	}
}
return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=function(self) self:CenterX():y(SCREEN_TOP+27):addy(-100) end,
		OnCommand=function(self) self:sleep(0.5):queuecommand("TweenOn") end,
		OffCommand=function(self) self:queuecommand("TweenOff") end,
		TweenOnCommand=function(self) self:decelerate(0.8):addy(100) end,
		TweenOffCommand=function(self) if AnyPlayerFullComboed() then self:sleep(1) end self:accelerate(0.8):addy(-100) end,
		Def.SongMeterDisplay{
			InitCommand=function(self) self:SetStreamWidth(292) end,
			Stream=LoadActor("meter stream"),
			Tip=LoadActor("tip")
		}
	},
	Def.ActorFrame{
		OnCommand=function(self) self:addy(-100):sleep(0.5):queuecommand("TweenOn") end,
		OffCommand=function(self) self:queuecommand("TweenOff") end,
		TweenOnCommand=function(self) self:decelerate(0.8):addy(100) end,
		TweenOffCommand=function(self) if AnyPlayerFullComboed() then self:sleep(1) end self:accelerate(0.8):addy(-100) end,
		LoadActor("width")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X-190):y(SCREEN_TOP+23):halign(1) end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):zoomtowidth(SCREEN_WIDTH/2-200) end
		},
		LoadActor("width")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X+190):y(SCREEN_TOP+23):halign(0) end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):zoomtowidth(SCREEN_WIDTH/2-200) end
		},
		LoadActor("left")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X-193):y(SCREEN_TOP+23):halign(1) end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):x(SCREEN_LEFT+16) end
		},
		LoadActor("left")..{
			InitCommand=function(self) self:x(SCREEN_CENTER_X+193):y(SCREEN_TOP+23):halign(1):zoomx(-1) end,
			OnCommand=function(self) self:sleep(1.5):linear(0.1):x(SCREEN_RIGHT-16) end
		},
		LoadActor("_base normal")..{ InitCommand=function(self) self:CenterX():y(SCREEN_TOP+24) end },
		LoadActor("_neons")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+24):blend(Blend.Add) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#007892")):effectcolor2(color("#00EAFF")):effectperiod(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadActor("_neons")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+24) end,
			OnCommand=function(self) self:effectclock('beat'):diffuseramp():effectcolor1(color("#FFFFFF00")):effectcolor2(color("#00EAFF")):effectperiod(0.5):diffusealpha(0):linear(0.4):diffusealpha(1) end
		},
		LoadFont("_serpentine outline")..{
			InitCommand=function(self) self:CenterX():y(SCREEN_TOP+23):maxwidth(573*0.6825):diffusebottomedge(color("#dedede")) end,
			OnCommand=function(self) self:addy(3):zoom(0.5):shadowlength(2):zoomy(0):sleep(2):decelerate(0.3):zoomy(0.45):animate(0):playcommand("Update") end,
			CurrentSongChangedMessageCommand=function(self) self:playcommand("Update") end,
			UpdateCommand=function(self)
				local text = ""
				local song = GAMESTATE:GetCurrentSong()
				local course = GAMESTATE:GetCurrentCourse()
				if song then
					text = song:GetDisplayFullTitle()
				end
				if course then
					text = course:GetDisplayFullTitle() .. " - " .. text
				end
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
			OnCommand=function(self) self:x(SCREEN_CENTER_X-256):y(SCREEN_TOP+32):addx(-SCREEN_WIDTH/3) end,
			TweenOnCommand=function(self) self:sleep(1.5):decelerate(0.5):addx(SCREEN_WIDTH/3) end,
			TweenOffCommand=function(self) self:accelerate(0.8):addx(-SCREEN_WIDTH/3) end,
			LoadActor("_difficulty icons")..{
				InitCommand=function(self) self:pause():playcommand("Update") end,
				UpdateCommand=function(self)
					local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
					local course = GAMESTATE:GetCurrentTrail(PLAYER_1)
					if course then
						self:visible(true)
						self:setstate(DifficultyToState(course:GetDifficulty()))
					elseif steps then
						self:visible(true)
						self:setstate(DifficultyToState(steps:GetDifficulty()))
					else
						self:visible(false)
					end
				end
			},
			LoadActor("_difficulty names")..{
				InitCommand=function(self) self:pause():playcommand("Update") end,
				UpdateCommand=function(self)
					local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
					local course = GAMESTATE:GetCurrentTrail(PLAYER_1)
					if course then
						self:visible(true)
						self:setstate(DifficultyToState(course:GetDifficulty()))
					elseif steps then
						self:visible(true)
						self:setstate(DifficultyToState(steps:GetDifficulty()))
					else
						self:visible(false)
					end
				end
			}
		},
		Def.ActorFrame{
			Condition=GAMESTATE:IsPlayerEnabled(PLAYER_2) or isRave(),
			Name="Player2",
			OnCommand=function(self) self:x(SCREEN_CENTER_X+256):y(SCREEN_TOP+32):addx(SCREEN_WIDTH/3) end,
			TweenOnCommand=function(self) self:sleep(1.5):decelerate(0.5):addx(-SCREEN_WIDTH/3) end,
			TweenOffCommand=function(self) self:accelerate(0.8):addx(SCREEN_WIDTH/3) end,
			LoadActor("_difficulty icons")..{
				InitCommand=function(self) self:pause():zoomx(-1):playcommand("Update") end,
				UpdateCommand=function(self)
					local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
					local course = GAMESTATE:GetCurrentTrail(PLAYER_2)
					if course then
						self:visible(true)
						self:setstate(DifficultyToState(course:GetDifficulty()))
					elseif steps then
						self:visible(true)
						self:setstate(DifficultyToState(steps:GetDifficulty()))
					else
						self:visible(false)
					end
				end
			},
			LoadActor("_difficulty names")..{
				InitCommand=function(self) self:x(19):pause():playcommand("Update") end,
				UpdateCommand=function(self)
					local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
					local course = GAMESTATE:GetCurrentTrail(PLAYER_2)
					if course then
						self:visible(true)
						self:setstate(DifficultyToState(course:GetDifficulty()))
					elseif steps then
						self:visible(true)
						self:setstate(DifficultyToState(steps:GetDifficulty()))
					else
						self:visible(false)
					end
				end
			}
		}
	}
}
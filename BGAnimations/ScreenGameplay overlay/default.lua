local t = Def.ActorFrame{
	LoadActor(GetSongFrame()),
	Def.ActorFrame{
		Name="RaveNames",
		InitCommand=function(self) self:CenterX():y(SCREEN_TOP+58):visible(isRave()) end,
		OnCommand=function(self) self:addy(-100):sleep(0.5):decelerate(0.8):addy(100) end,
		OffCommand=function(self) self:accelerate(0.8):addy(-100) end,
		LoadFont("_v 26px bold black")..{
			InitCommand=function(self) self:x(-254):zoom(0.55):shadowlength(0):maxwidth(160) end,
			BeginCommand=function(self)
				if GAMESTATE:IsHumanPlayer(PLAYER_1) then
					self:settext(GetDisplayNameFromProfileOrMemoryCard(PLAYER_1))
				end
			end
		},
		LoadFont("_v 26px bold black")..{
			InitCommand=function(self) self:x(254):zoom(0.55):shadowlength(0):maxwidth(160) end,
			BeginCommand=function(self)
				if GAMESTATE:IsHumanPlayer(PLAYER_2) then
					self:settext(GetDisplayNameFromProfileOrMemoryCard(PLAYER_2))
				end
			end
		}
	},
	Def.Quad{
		InitCommand=function(self) self:FullScreen():diffuse(color("0,0,0,1")) end,
		OnCommand=function(self) self:linear(0.3):diffusealpha(0) end
	},
	Def.ActorFrame{
		Name="ScreenStageHoldovers",
		InitCommand=function(self) self:visible(not GAMESTATE:IsDemonstration() and not GAMESTATE:IsCourseMode()) end,
		LoadActor(THEME:GetPathB("ScreenStageInformation","in/bottom/bar"))..{
			InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+136):zoomtowidth(SCREEN_WIDTH):faderight(0.8):fadeleft(0.8) end,
			OnCommand=function(self) self:sleep(2.25):cropright(0):linear(0.6):cropleft(1) end
		},
		Def.ActorFrame{
			Name="InfoP1",
			InitCommand=function(self) self:visible(GAMESTATE:IsPlayerEnabled(PLAYER_1)) end,
			LoadActor(THEME:GetPathB("ScreenStageInformation","in/_left gradient"))..{
				InitCommand=function(self) self:x(SCREEN_LEFT):y(SCREEN_CENTER_Y+130):horizalign(left) end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadActor(THEME:GetPathB("ScreenStageInformation","in/_p1"))..{
				InitCommand=function(self) self:x(SCREEN_LEFT):y(SCREEN_CENTER_Y+130):horizalign(left) end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadFont("_r bold 30px")..{
				Text="Step Artist:",
				InitCommand=function(self) self:x(SCREEN_LEFT+5):y(SCREEN_CENTER_Y+152):zoom(0.6):halign(0):shadowlength(2) end,
				BeginCommand=function(self)
					local show = (isPlayMode('PlayMode_Regular') or isPlayMode('PlayMode_Rave'))
					self:visible(GAMESTATE:IsPlayerEnabled(PLAYER_1) and show)
				end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadFont("_r bold 30px")..{
				Name="AuthorText",
				InitCommand=function(self) self:x(SCREEN_LEFT+100):y(SCREEN_CENTER_Y+152):shadowlength(2):halign(0):zoom(0.6) end,
				BeginCommand=function(self)
					local song = GAMESTATE:GetCurrentSong()
					local text = ""
					if song then
						local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
						if steps then text = steps:GetAuthorCredit() end
					end
					self:settext(text)
				end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadFont("_r bold 30px")..{
				Name="PlayerName",
				InitCommand=function(self) self:x(SCREEN_LEFT+44):y(SCREEN_CENTER_Y+122):shadowlength(2):halign(0):zoom(0.8) end,
				BeginCommand=function(self)
					self:settext( PROFILEMAN:GetPlayerName(PLAYER_1) )
				end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			}
		},
		Def.ActorFrame{
			Name="InfoP2",
			InitCommand=function(self) self:visible(GAMESTATE:IsPlayerEnabled(PLAYER_2)) end,
			LoadActor(THEME:GetPathB("ScreenStageInformation","in/_right gradient"))..{
				InitCommand=function(self) self:x(SCREEN_RIGHT):y(SCREEN_CENTER_Y+130):horizalign(right) end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadActor(THEME:GetPathB("ScreenStageInformation","in/_p2"))..{
				InitCommand=function(self) self:x(SCREEN_RIGHT):y(SCREEN_CENTER_Y+130):horizalign(right) end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadFont("_r bold 30px")..{
				Text=":Step Artist",
				InitCommand=function(self) self:x(SCREEN_RIGHT-5):y(SCREEN_CENTER_Y+152):zoom(0.6):halign(1):shadowlength(2) end,
				BeginCommand=function(self)
					local show = (isPlayMode('PlayMode_Regular') or isPlayMode('PlayMode_Rave'))
					self:visible(GAMESTATE:IsPlayerEnabled(PLAYER_2) and show)
				end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadFont("_r bold 30px")..{
				Name="AuthorText",
				InitCommand=function(self) self:x(SCREEN_RIGHT-100):y(SCREEN_CENTER_Y+152):shadowlength(2):halign(1):zoom(0.6) end,
				BeginCommand=function(self)
					local song = GAMESTATE:GetCurrentSong()
					local text = ""
					if song then
						local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
						if steps then text = steps:GetAuthorCredit() end
					end
					self:settext(text)
				end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			},
			LoadFont("_r bold 30px")..{
				Name="PlayerName",
				InitCommand=function(self) self:x(SCREEN_RIGHT-44):y(SCREEN_CENTER_Y+122):shadowlength(2):halign(1):zoom(0.8) end,
				BeginCommand=function(self)
					self:settext( PROFILEMAN:GetPlayerName(PLAYER_2) )
				end,
				OnCommand=function(self) self:sleep(1):linear(1):diffusealpha(0) end
			}
		}
	},
	LoadFont("_r bold 30px")..{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+127):maxwidth(SCREEN_WIDTH/8*7):shadowlength(2):horizalign(center):zoom(0.5):diffusealpha(1) end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			local text = ""
			if song then text = song:GetDisplayFullTitle() end
			self:settext(text)
		end,
		OnCommand=function(self) self:playcommand("Set"):sleep(1.5):linear(1):diffusealpha(0) end
	},
	LoadFont("_r bold 30px")..{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+147):maxwidth(SCREEN_WIDTH/8*6.8):shadowlength(2):horizalign(center):zoom(0.4):diffusealpha(1) end,
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			local text = ""
			if song then text = song:GetDisplayArtist() end
			self:settext(text)
		end,
		OnCommand=function(self) self:playcommand("Set"):sleep(1.5):linear(1):diffusealpha(0) end
	},
	Def.ActorFrame{
		Name="DemonstrationFrame",
		BeginCommand=function(self) self:visible(GAMESTATE:IsDemonstration() and not isTopScreen('ScreenJukebox')) end,
		LoadActor(THEME:GetPathB("_metallic","streak"))..{
			InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+43):zoomtowidth(SCREEN_WIDTH) end,
			OnCommand=function(self) self:diffusealpha(0.9):fadeleft(1):faderight(1) end
		},
		LoadFont("_z 36px black")..{
			Text="DEMO",
			InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+43):zoom(0.7) end,
			OnCommand=function(self) self:pulse():effectmagnitude(1.0,0.95,0):effectclock('beat'):effectperiod(1) end
		},
		LoadActor("demonstration gradient")..{
			InitCommand=function(self) self:FullScreen():diffusealpha(0.8) end
		}
	},
	LoadActor(THEME:GetPathB("","_coins"))..{ InitCommand=function(self) self:visible(not GAMESTATE:IsDemonstration()) end }
}

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FCSplash", pn)
end

return t
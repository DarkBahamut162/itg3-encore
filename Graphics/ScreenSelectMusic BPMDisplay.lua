local BPMtype = ThemePrefs.Get("ShowBPMDisplayType")
local course = GAMESTATE:IsCourseMode()

local function getTrueBPMRange(self,bpm)
	if bpm[3] == 0.0 then
		if bpm[2] and bpm[1] ~= bpm[2] then
			self:diffuse(color("#d8f6ff"))
			return bpm[1]..' - '..bpm[2]
		else
			self:diffuse(color("#ffffff"))
			return bpm[1]
		end
	else
		if bpm[1] == bpm[2] and bpm[2] == bpm[3] then
			self:diffuse(color("#ffffff"))
			return bpm[1]
		elseif bpm[3] == bpm[1] or bpm[3] == 0 then
			if bpm[1] ~= bpm[2] then
				self:diffuse(color("#d8f6ff"))
				return bpm[1] .. " (" .. bpm[2] .. ")"
			else
				self:diffuse(color("#ffffff"))
				return bpm[1]
			end
		elseif bpm[3] < bpm[2] then
			self:diffuse(color("#d8f6ff"))
			return bpm[1] .. "-" .. bpm[3] .. " (" .. bpm[2] .. ")"
		else
			self:diffuse(color("#d8f6ff"))
			return bpm[1] .. "-" .. bpm[2]
		end
	end
end

return Def.ActorFrame{
	LoadFont("_v 26px bold white")..{
		Text="BPM:",
		InitCommand=function(self) self:shadowlength(2.5):zoom(0.5*WideScreenDiff()):y(-17.5*WideScreenDiff()):halign(1) end
	},
	Def.BPMDisplay{
		Name="BPMDisplay",
		Font="BPMDisplay bpm",
		InitCommand=function(self) self:halign(1):zoom(0.66*WideScreenDiff()):maxwidth(120):maxheight(32):vertspacing(-10) end,
		SetCommand=function(self)
			local temp = {}
			if GAMESTATE:IsCourseMode() then
				local course = GAMESTATE:GetCurrentCourse()
				if course then
					for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
						local trail = GAMESTATE:GetCurrentTrail(pn)
						if trail then
							local entries = trail:GetTrailEntries()
							local bpm,currentBPM = {},{}
							for i=1, #entries do
								bpm = getAllTheBPMs(entries[i]:GetSong(),entries[i]:GetSteps(),BPMtype)
								if i == 1 then
									currentBPM[1] = bpm[1]
									currentBPM[2] = bpm[2]
									currentBPM[3] = bpm[3]
								else
									if bpm[1] < currentBPM[1] then currentBPM[1] = bpm[1] end
									if bpm[2] > currentBPM[2] then currentBPM[2] = bpm[2] end
									if bpm[3] > currentBPM[3] then currentBPM[3] = bpm[3] end
								end
							end
							temp[pn] = getTrueBPMRange(self,currentBPM) 
						end
					end
				end
			else
				local output = ""
				local song = GAMESTATE:GetCurrentSong()
				if song then
					for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
						local step = GAMESTATE:GetCurrentSteps(pn)
						if step then temp[pn] = getTrueBPMRange(self,getAllTheBPMs(song,step,BPMtype)) end
					end
				end
			end
			if temp[PLAYER_1] and temp[PLAYER_2] then
				if temp[PLAYER_1] == temp[PLAYER_2] then
					self:settext(temp[PLAYER_1])
				else
					output = temp[PLAYER_1].."\n"..temp[PLAYER_2]
					self:settext(output):diffuse(PlayerColor(PLAYER_2)):AddAttribute(0, {
						Length = string.len(temp[PLAYER_1]),
						Diffuse = PlayerColor(PLAYER_1),
					})
				end
			elseif temp[PLAYER_1] or temp[PLAYER_2] then
				self:settext(temp[GAMESTATE:GetMasterPlayerNumber()])
			else
				self:settext("")
			end
		end,
		CurrentSongChangedMessageCommand=function(self) if not course then self:playcommand("Set") end end,
		CurrentCourseChangedMessageCommand=function(self) if course then self:playcommand("Set") end end,
		CurrentStepsP1ChangedMessageCommand=function(self) if not course then self:playcommand("Set") end end,
		CurrentStepsP2ChangedMessageCommand=function(self) if not course then self:playcommand("Set") end end,
		CurrentTrailP1ChangedMessageCommand=function(self) if course then self:playcommand("Set") end end,
		CurrentTrailP2ChangedMessageCommand=function(self) if course then self:playcommand("Set") end end
	}
}
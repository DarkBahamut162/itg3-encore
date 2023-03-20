local player = ...
local scoreType = getenv("SetScoreType"..pname(player))
return Def.ActorFrame{
	LoadFont("_r bold numbers") .. {
		Name="Score"..pname(player),
		InitCommand=function(self)
			self:diffuse(PlayerColor(player))
			if isTopScreen("ScreenEvaluationWorkout") or isTopScreen("ScreenEvaluationCourseWorkout") then
				self:x(player == PLAYER_1 and SCREEN_CENTER_X-58*WideScreenDiff() or SCREEN_CENTER_X+58*WideScreenDiff()):y(SCREEN_CENTER_Y+92*WideScreenDiff()):zoom(2/3*WideScreenDiff())
			elseif isTopScreen("ScreenEvaluationRave") then
				self:x(player == PLAYER_1 and SCREEN_CENTER_X-199*WideScreenDiff() or SCREEN_CENTER_X+199*WideScreenDiff()):y(SCREEN_CENTER_Y+175*WideScreenDiff()):zoom(WideScreenDiff())
			else
				self:x(player == PLAYER_1 and SCREEN_CENTER_X-199*WideScreenDiff() or SCREEN_CENTER_X+199*WideScreenDiff()):y(SCREEN_CENTER_Y+52*WideScreenDiff()):zoom(WideScreenDiff())
			end
			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(player)
			local output = 0
			if scoreType == 1 then
				output = pss:GetScore()
				self:settextf("%09d",output) -- SCORE
				self:ClearAttributes()
				self:AddAttribute(0, {
					Length = math.max(9-string.len(''..output), 0),
					Diffuse = PlayerColorSemi(player),
				})
				if isTopScreen("ScreenEvaluationWorkout") or isTopScreen("ScreenEvaluationCourseWorkout") then self:zoomx(1/2*WideScreenDiff()) else self:zoomx(8/9*WideScreenDiff()) end
			elseif scoreType == 2 then
				self:settext(FormatPercentScore(pss:GetPercentDancePoints())) -- PERCENT
			elseif scoreType == 3 then
				output = pss:GetActualDancePoints()
				self:settextf("%04d",output) -- EX
				self:ClearAttributes()
				self:AddAttribute(0, {
					Length = math.max(4-string.len(''..output), 0),
					Diffuse = PlayerColorSemi(player),
				})
			end
		end,
		OnCommand=function(self) self:addx(player == PLAYER_1 and -EvalTweenDistance() or EvalTweenDistance()):sleep(3):decelerate(0.3):addx(player == PLAYER_1 and EvalTweenDistance() or -EvalTweenDistance()) end,
		OffCommand=function(self) self:accelerate(0.3):addx(player == PLAYER_1 and -EvalTweenDistance() or EvalTweenDistance()) end
	}
}
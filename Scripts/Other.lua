function Get2PlayerJoinMessage()
	if not GAMESTATE:PlayersCanJoin() then return "" end
	if GAMESTATE:GetCoinMode()=='CoinMode_Free' or GAMESTATE:GetCoinMode()=='CoinMode_Home' then
		return "2 Player mode available"
	end
	local numSidesNotJoined = NUM_PLAYERS - GAMESTATE:GetNumSidesJoined()
	if GAMESTATE:GetPremium() == 'Premium_2PlayersFor1Credit' then
		numSidesNotJoined = numSidesNotJoined - 1
	end
	local coinsRequiredToJoinRest = numSidesNotJoined * PREFSMAN:GetPreference("CoinsPerCredit")
	local remaining = coinsRequiredToJoinRest - GAMESTATE:GetCoins()
	local s = "For 2 Players, insert " .. remaining .. " more coin(s)"
	if remaining > 1 then s = s.."s" end
	return s
end

function GetCreditType()
	return "INSERT COIN"
end

function GetRandomSongNames(n)
	local s = ""
	for i = 1,n do
		local song = SONGMAN:GetRandomSong()
		if song then s = s..song:GetDisplayFullTitle().."\n" end
	end
	return s
end

function GetRandomCourseNames(n)
	local s = ""
	for i = 1,n do
		local course = SONGMAN:GetRandomCourse()
		if course then s = s..course:GetDisplayFullTitle().."\n" end
	end
	return s
end

function GetStepChartFacts()
	local diffCount = {0,0,0,0,0,0}
	local diffNames = {"novice","easy","medium","hard","expert","edit"}
	local output = ""
	local songs = SONGMAN:GetAllSongs()
	local currentGroup = ""
	local currentDifficulty = ""
	local diffTranslate = {
		Difficulty_Beginner = 1,
		Difficulty_Easy = 2,
		Difficulty_Medium = 3,
		Difficulty_Hard = 4,
		Difficulty_Challenge = 5,
		Difficulty_Edit = 6
	}

	for i=1,#songs do
		if currentGroup ~= songs[i]:GetGroupName() then
			output = addToOutput(output,currentGroup..":","\n")
			for i2=1,#diffCount do
				if diffCount[i2] > 0 then
					output = addToOutput(output,"  "..diffCount[i2].." "..diffNames[i2],"\n")
				end
			end
			currentGroup = songs[i]:GetGroupName()
			diffCount = {0,0,0,0,0,0}
		end
		local steps = songs[i]:GetAllSteps()
		for i3=1,#steps do
			currentDifficulty = steps[i3]:GetDifficulty()
			if diffTranslate[currentDifficulty] then
				diffCount[diffTranslate[currentDifficulty]] = diffCount[diffTranslate[currentDifficulty]] + 1
			end
		end
	end

	return output
end

function GetRandomModifierNames(n)
	local mods = {
		"Xmod","Cmod","Mmod","Amod","CAmod","AVmod",
		"Overhead","Hallway","Distant","Incoming","Space",
		"Reverse","Split","Alternate","Cross","Centered",
		"Fail Immediate","Fail at 30 Misses","Fail Off",
		"NoteSkins",
		"Accel","Decel","Wave","Expand","Boomerang","Random",
		"BeatX","BeatY","BeatZ","Confusion","ConfusionX","ConfusionY",
		"DrunkX","DrunkZ","Flip","Invert","Tipsy",
		"AttenuateX","AttenuateY","AttenuateZ","Bounce","BounceZ","BumpyX","BumpyZ",
		"Digital","DigitalZ","ParabolaX","ParabolaY","ParabolaZ","Sawtooth","SawtoothZ",
		"Square","SquareZ","TornadoX","TornadoZ","XMode","Zigzag","ZigzagZ",
		"Dizzy","Twirl","Roll",
		"Fade Out","Fade In","Blink","Invisible","Vanish",
		"Normal Orientation","Left Orientation","Right Orientation","Upside-Down Orientation","Solo-Centered Orientation",
		"Vibrate","Spin Right","Spin Left","Bob","Pulse","Wag",
		"Simple","No Jumps","No Hands","No Quads","No Fakes",
		"No Holds","No Rolls","No Lifts","No Stretch Jumps",
		"Mirror","Backwards","Left","Right","Shuffle","Super Shuffle","Soft Shuffle",
		"Big","Quick","Skippy","Echo","Wide","Stomp","BMRize",
		"Planted","Floored","Twister","Holds To Rolls","Holds To Lift Holds",
		"Mini",
		"Allow BackGroundChanges","No BackGroundChanges","Random BackGroundChanges",
		"No Mines","Allow Mines","More Mines","Attack Mines",
		"No Attacks","Allow Attacks","Random Attacks",
		"Hide Targets","Hide Judgment","Hide Background",
		"Hide Score","Hide Combo","Hide Lifebar",
		"Under Combo","Under Tap Judgments","Under Hold Judgments",
		"Normal Score","Percent Score","EX Score",
		"Screen Filter",
		"Show Stats",
		"Pacemaker",
		"Rate"
	}
	mods = tableshuffle( mods )
	local s = ""
	for i = 1,math.min(n,table.getn(mods)) do
		s = s .. mods[i] .. "\n"
	end
	return s
end

function GetScreenNameEntryTraditionalHelpText()
	if GAMESTATE:AnyPlayerHasRankingFeats() then
		return THEME:GetString("ScreenNameEntryTraditional","HelpTextHasHighScores") .. "\n" .. THEME:GetString( "ScreenNameEntryTraditional", "HelpTextHasHighScoresSelectAvailableText" )
	end
	return THEME:GetString("ScreenNameEntryTraditional","HelpTextNoHighScores")
end

function HumanAndProfile(pn)
	return GAMESTATE:IsHumanPlayer(pn) and MEMCARDMAN:GetCardState(pn) ~= 'MemoryCardState_none'
end

function EnabledAndProfile(pn)
	return GAMESTATE:IsPlayerEnabled(pn) and MEMCARDMAN:GetCardState(pn) ~= 'MemoryCardState_none'
end

function EnabledAndProfile(pn)
	return GAMESTATE:IsPlayerEnabled(pn) and MEMCARDMAN:GetCardState(pn) ~= 'MemoryCardState_none'
end

function EnabledAndUSBReady(pn)
	return GAMESTATE:IsPlayerEnabled(pn) and MEMCARDMAN:GetCardState(pn) == 'MemoryCardState_ready'
end

function GetDisplayNameFromProfileOrMemoryCard(pn)
	if PROFILEMAN:IsPersistentProfile(pn) then return GAMESTATE:GetPlayerDisplayName(pn) end
	if MEMCARDMAN:GetCardState(pn) ~= 'MemoryCardState_none' then return MEMCARDMAN:GetName(pn) end
	return ""
end

function ScreenEndingGetDisplayName(pn)
	if MEMCARDMAN:GetCardState(pn) ~= 'MemoryCardState_none' then return MEMCARDMAN:GetName(pn) end
	return "No Card"
end

function QuadAward( pn )
	return PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(StepsTypeSingle(),'Difficulty_Challenge',1)
end

function StarAward( pn )
	return PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(StepsTypeSingle(),'Difficulty_Challenge',1)*4
		+PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(StepsTypeSingle(),'Difficulty_Challenge',2)*3
		+PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(StepsTypeSingle(),'Difficulty_Challenge',3)*2
		+PROFILEMAN:GetProfile(pn):GetTotalStepsWithTopGrade(StepsTypeSingle(),'Difficulty_Challenge',4)
end

function CalorieAward( pn )
	return PROFILEMAN:GetProfile(pn):GetCaloriesBurnedToday()
end

function PercentAward( pn )
	return (PROFILEMAN:GetProfile(pn):GetSongsActual(StepsTypeSingle(),'Difficulty_Challenge'))*100
end

function StarIcon( Actor,pn )
	local stars = StarAward( pn )
	if stars < 10 then Actor:visible(0) end
	if stars >= 10 then Actor:setstate(4) end
	if stars >= 25 then Actor:setstate(5) end
	if stars >= 50 then Actor:setstate(6) end
	if stars >= 100 then Actor:setstate(7) end
end

function QuadIcon( Actor,pn )
	local quads = QuadAward( pn )
	if quads < 10 then Actor:visible(0) end
	if quads >= 10 then Actor:setstate(8) end
	if quads >= 25 then Actor:setstate(9) end
	if quads >= 50 then Actor:setstate(10) end
	if quads >= 100 then Actor:setstate(11) end
end

function PercentIcon( Actor,pn )
	local perc = PercentAward( pn )
	if perc < 500 then Actor:visible(0) end
	if perc >= 500 then Actor:setstate(0) end
	if perc >= 2500 then Actor:setstate(1) end
	if perc >= 7500 then Actor:setstate(2) end
	if perc >= 15000 then Actor:setstate(3) end
end

function CalorieIcon( Actor,pn )
	local cals = CalorieAward( pn )
	if cals < 250 then Actor:visible(0) end
	if cals >= 250 then Actor:setstate(12) end
	if cals >= 750 then Actor:setstate(13) end
	if cals >= 1500 then Actor:setstate(14) end
	if cals >= 3000 then Actor:setstate(15) end
end

function getProfileSongs( pn )
	return "Played Songs:\n" .. PROFILEMAN:GetProfile(pn):GetTotalNumSongsPlayed()
end

function isFinal()
	return ThemePrefs.Get("EncoreThemeMode")
end

function isScreenTitle()
	return isTopScreen("ScreenTitleMenu") or isTopScreen("ScreenTitleJoin")
end

function isGamePlay()
	return isTopScreen('ScreenGameplay') or isTopScreen('ScreenCreditsGameplay') or isTopScreen('ScreenGameplayWorkout') or isTopScreen('ScreenDemonstration') or isTopScreen('ScreenJukebox')
end

function isPlayMode(mode)
	return GAMESTATE:GetPlayMode() == mode
end

function isITGmania()
	return ProductFamily() == "ITGmania"
end

function isOutFox()
	return ProductFamily() == "OutFox"
end

function hasAvatar(pn)
	if isOutFox() then
		return Basename(LoadModule("Options.GetProfileData.lua")(pn)["Image"]) ~= "UserProfile generic icon.png"
	else
		return false
	end
end

function isStepMania()
	return ProductFamily() == "StepMania"
end

function isTopScreen(screen)
	if SCREENMAN:GetTopScreen() then
		return SCREENMAN:GetTopScreen():GetName() == screen
	else
		return Var "LoadingScreen" == screen
	end
end

function addToOutput(output,add,pre)
	if string.len(output) == 0 then
		return add
	else
		return output..pre..add
	end
end

function Center1Player()
	local styleType = GAMESTATE:GetCurrentStyle():GetStyleType()
	if styleType == "StyleType_OnePlayerTwoSides" or styleType == "StyleType_TwoPlayersSharedSides" then
		return false
	elseif PREFSMAN:GetPreference("Center1Player") then
		return styleType == "StyleType_OnePlayerOneSide"
	else
		return false
	end
end

function WideScreenDiff()
	return math.min(1,GetScreenAspectRatio() / (16/10))
end

function WideScreenSemiDiff()
	return 1-(1-WideScreenDiff())*0.5
end

function GetLives(player)
	local song, steps = nil, nil
	local stepCounter, holdCounter, songInSeconds = 0, 0, 0
	local lives = 1

	if GAMESTATE:IsCourseMode() then
		songs = GAMESTATE:GetCurrentCourse()
		steps = GAMESTATE:GetCurrentTrail(player)
		for entry in ivalues(steps:GetTrailEntries()) do
			stepCounter = stepCounter + entry:GetSteps():GetRadarValues(player):GetValue('RadarCategory_TapsAndHolds')
			holdCounter = holdCounter + entry:GetSteps():GetRadarValues(player):GetValue('RadarCategory_Holds')
			songInSeconds = songInSeconds + (entry:GetSong():GetLastSecond() - entry:GetSong():GetFirstSecond())
		end
	else
		songs = GAMESTATE:GetCurrentSong()
		steps = GAMESTATE:GetCurrentSteps(player)
		stepCounter = steps:GetRadarValues(player):GetValue('RadarCategory_TapsAndHolds')
		holdCounter = steps:GetRadarValues(player):GetValue('RadarCategory_Holds')
		songInSeconds = songInSeconds + (songs:GetLastSecond() - songs:GetFirstSecond())
	end

	if not GAMESTATE:IsCourseMode() then
		if steps:GetDifficulty() == "Difficulty_Challenge" then
			lives = 70
		end
		if steps:GetDescription() == 'Nonstop' then
			lives = 5
		end
	end

	if lives < 5 then
		if holdCounter >= 15 and holdCounter < 25 then
			lives = 25
		elseif holdCounter >= 25 and holdCounter < 50 then
			lives = 20
		elseif holdCounter >= 50 and holdCounter < 100 then
			lives = 10
		elseif holdCounter >= 100 then
			lives = 5
		else
			local calc = songInSeconds / stepCounter * 100
			lives = math.ceil( calc / 5 ) * 5

			if lives < 10 then
				lives = 10
			end
			if lives > 60 then
				lives = 60
			end
		end
	end

	return lives
end

function USBCheck()
	if not getenv("USBCheck") then
		setenv("USBCheck",true)
		return false
	end
	return true
end
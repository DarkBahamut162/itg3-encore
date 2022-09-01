local numPlayers = GAMESTATE:GetNumPlayersEnabled()
local statObject = "single"

if numPlayers == 1 then
	local style = GAMESTATE:GetCurrentStyle()
	if style:GetStyleType() == 'StyleType_OnePlayerTwoSides' or
	GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and getenv("RotationRightP1") or
	GAMESTATE:GetMasterPlayerNumber() == PLAYER_2 and getenv("RotationLeftP2") then
		statObject = "double"
	else
		statObject = "single"
	end
elseif numPlayers == 2 then
	statObject = "versus"
end

return Def.ActorFrame{
	LoadActor(statObject)
}
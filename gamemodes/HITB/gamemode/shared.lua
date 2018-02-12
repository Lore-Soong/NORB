GM.Name = "Hole In the Ball"
GM.Author = "SkeletonMan, LoreSoong"

DeriveGamemode( "base" )

function GM:Initialize()
	selfe.BaseClass.Initialize( self )
end

local TEAM_SPEC, TEAM_GUN, TEAM_HELP = 1, 2, 3

team.SetUp(1, "Spectators", Color( 192, 192, 192))
team.SetUp(2, "Cannoneer", Color( 255, 0, 0))
team.SetUp(3, "PunyHumans", Color(0, 102, 255))

util.PrecacheModel(models/player/gman_high.mdl)
util.PrecacheModel(models/player/monk.mdl)
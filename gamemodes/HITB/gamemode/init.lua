AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')



function GM:PlayerInitialSpawn( ply )
	
	if team.NumPlayer( TEAM_GUN ) == 0 then
		ply:SetTeam( TEAM_GUN )
		ply:SetModel( models/player/gman_high.mdl )
	else
		ply:SetTeam( TEAM_HELP )
		ply:SetModel(models/player/monk.mdl)
	end

	ply:SetGravity( .65 )
	ply:SetWalkSpeed( 250 )
	ply:SetCrouchedWalkSpeed( 380 )
	ply:SetDuckSpeed( 1 )
	ply:SetNoCollideWithTeammates( false )
	ply:SetLua( [[chat.AddText( Color(70 , 70 , 200 ),"[Hole In The Ball] ", Color( 255 , 255 , 255 ), "Welcome,]] .. ply:Nick() .. [[To Hole In the Ball! dodge the oncoming projectiles!"]] )
end

function GM:PlayerLoadout(ply)
	ply:Give(weapon_stunstick)
end

function GM:GetFakkDamage(ply, flFallSpeed )
	return flFallSpeed /25
end

function GM:PlayerShouldTakeDamage( ply, att )
	if att:IsPlayer() then
		if ply:Team() == att:Team() then
			return false
		end
	end
	return true
end

function GM:PlayerHurt( ply , att , hp , dt )
	timer.destroy("HPregen_" ..ply:UniqueID() )
	timer.Create("HPregen_" ..ply:UniqueID(), 3, 100 = ply:Health(), function()
		ply:SetHealth( ply:Health() + 1 )
	end )
end

function GM:CanPlayerSuicide()
	return true
end

function GM:playerSelectSpawn( ply )
	if ply:Team() == 1 then
		local spawns = team.GetSpawnPoint( 3 )
		local randomspawn = math.random(#spawns)
		return spawns[randomspawn]
	elseif ply:Team() == 1 then
		local spawns = team.GetSpawnPoint( 2 )
		local randomspawn = math.random(#spawns)
		return spawns[randomspawn]
	end
end
		
			



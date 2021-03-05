/*
================
=
= P_LookForPlayers
=
= If allaround is false, only look 180 degrees in front
= returns true if a player is targeted
================
*/

function P_LookForPlayers ( actor, allaround, params)
{
	/*int 		c;
	int			pnum;
	player_t*	player;
	bool chasegoal = params? (!(params.flags & LOF_DONTCHASEGOAL)) : true;

	if (actor.TIDtoHate != 0)
	{
		if (P_LookForTID (actor, allaround, params))
		{
			return true;
		}
		if (!(actor.flags3 & MF3_HUNTPLAYERS))
		{
			return false;
		}
	}
	else if (actor.flags & MF_FRIENDLY)
	{
		bool result = P_LookForEnemies (actor, allaround, params);

#ifdef MBF_FRIENDS
		if (!result && (actor.flags & MF_FRIEND_MBF))
		{  // killough 9/9/98: friendly monsters go about players differently

			// Go back to a player, no matter whether it's visible or not
			for (int anyone=0; anyone<=1; anyone++)
			{
				for (int c=0; c<MAXPLAYERS; c++)
				{
					if (playeringame[c] && players[c].playerstate==PST_LIVE &&
						actor.IsFriend(players[c].mo) &&
						(anyone || P_IsVisible(actor, players[c].mo, allaround)))
					{
						actor.target = players[c].mo;

						// killough 12/98:
						// get out of refiring loop, to avoid hitting player accidentally

						if (actor.MissileState != null)
						{
							actor.SetState(actor.SeeState, true);
							actor.flags &= ~MF_JUSTHIT;
						}

						return true;
					}
				}
			}
		}
#endif
		// [SP] If you don't see any enemies in deathmatch, look for players (but only when friend to a specific player.)
		if (actor.FriendPlayer == 0 && (!teamplay || actor.GetTeam() == TEAM_NONE)) return result;
		if (result || !deathmatch) return true;


	}	// [SP] if false, and in deathmatch, intentional fall-through

	if (!(gameinfo.gametype & (GAME_DoomStrifeChex)) &&
		!multiplayer &&
		players[0]._health <= 0 && 
		actor.goal == null &&
		gamestate != GS_TITLELEVEL
		)
	{ // Single player game and player is dead; look for monsters
		return P_LookForMonsters (actor);
	}

	c = 0;
	if (actor.TIDtoHate != 0)
	{
		pnum = pr_look2() & (MAXPLAYERS-1);
	}
	else
	{
		pnum = actor.LastLookPlayerNumber;
	}
		
	for (;;)
	{
		// [ED850] Each and every player should only ever be checked once.
		if (c++ < MAXPLAYERS)
		{
			pnum = (pnum + 1) & (MAXPLAYERS - 1);
			if (!playeringame[pnum])
				continue;

			if (actor.TIDtoHate == 0)
			{
				actor.LastLookPlayerNumber = pnum;
			}
		}
		else
		{
			// done looking
			if (actor.target == null)
			{
				// [RH] use goal as target
				// [KS] ...unless we're ignoring goals and we don't already have one
				if (actor.goal != null && chasegoal)
				{
					actor.target = actor.goal;
					return true;
				}
				// Use last known enemy if no players sighted -- killough 2/15/98:
				if (actor.lastenemy != null && actor.lastenemy._health > 0)
				{
					if (!actor.IsFriend(actor.lastenemy))
					{
						actor.target = actor.lastenemy;
						actor.lastenemy = null;
						return true;
					}
					else
					{
						actor.lastenemy = null;
					}
				}
			}
			return actor.target == actor.goal && actor.goal != null;
		}

		player = DEcam;//&players[pnum];

		if (!(player.mo.flags & MF_SHOOTABLE))
			continue;			// not shootable (observer or dead)

		if (player.cheats & CF_NOTARGET)
			continue;			// no target

		if (player._health <= 0)
			continue;			// dead

		if (!P_IsVisible (actor, player.mo, allaround, params))
			continue;			// out of sight

		// [SP] Deathmatch fixes - if we have MF_FRIENDLY we're definitely in deathmatch
		// We're going to ignore our master, but go after his enemies.
		if ( actor.flags & MF_FRIENDLY )
		{
			if ( actor.IsFriend(player.mo) )
				continue;
		}

		// [RC] Well, let's let special monsters with this flag active be able to see
		// the player then, eh?
		if(!(actor.flags6 & MF6_SEEINVISIBLE)) 
		{
			if ((player.mo.flags & MF_SHADOW && !(i_compatflags & COMPATF_INVISIBILITY)) ||
				player.mo.flags3 & MF3_GHOST)
			{
				if ((player.mo.AproxDistance (actor) > 2*MELEERANGE)
					&& P_AproxDistance (player.mo.velx, player.mo.vely)	< 5*FRACUNIT)
				{ // Player is sneaking - can't detect
					continue;
				}
				if (pr_lookforplayers() < 225)
				{ // Player isn't sneaking, but still didn't detect
					continue;
				}
			}
		}
		
		// [RH] Need to be sure the reactiontime is 0 if the monster is
		//		leaving its goal to go after a player.
		if (actor.goal && actor.target == actor.goal)
			actor.reactiontime = 0;

		actor.target = player.mo;
		
		return true;
	}*/
	return true; //CHRIS This is fake, please remove when script is finalized
}
/*
=====================
=
= P_CheckSight
=
= Returns true if a straight line between t1 and t2 is unobstructed
= look from eyes of t1 to any part of t2
=
= killough 4/20/98: cleaned up, made to use new LOS struct
=
=====================
*/

function SightCheck(t1,t2){
	
	return collision_line(t1.x,t1.y,t2.x,t2.y,sliding_collision_obj,true,false) == noone;
	
}

function P_CheckSight ( t1, t2, flags)
{
	//SightCycles.Clock();

	var res;

	//assert (t1 != null);
	//assert (t2 != null);
	if (t1 == null || t2 == null)
	{
		return false;
	}

	s1 = t1.Sector;
	s2 = t2.Sector;
	
	var pnum = (s1 - sectors) * numsectors + (s2 - sectors);

//
// check for trivial rejection
//
	if (rejectmatrix != null &&
		(rejectmatrix[ pnum>>3 ] & (1 << (pnum & 7))))
	{
		sightcounts[0]++;
		res = false;			// can't possibly be connected
		return psdone();
	}

//
// check precisely
//
	// [RH] Andy Baker's stealth monsters:
	// Cannot see an invisible object
	if ((flags & SF_IGNOREVISIBILITY) == 0 && ((t2.renderflags & RF_INVISIBLE) || !t2.visible))
	{ // small chance of an attack being made anyway
		if ((bglobal.m_Thinking ? pr_botchecksight() : pr_checksight()) > 50)
		{
			res = false;
			return psdone();
		}
	}

	// killough 4/19/98: make fake floors and ceilings block monster view

	/*if (!(flags & SF_IGNOREWATERBOUNDARY))
	{
		if ((s1.GetHeightSec() &&
			((t1.Z() + t1.height <= s1.heightsec.floorplane.ZatPoint(t1) &&
			  t2.Z() >= s1.heightsec.floorplane.ZatPoint(t2)) ||
			 (t1.Z() >= s1.heightsec.ceilingplane.ZatPoint(t1) &&
			  t2.Z() + t1.height <= s1.heightsec.ceilingplane.ZatPoint(t2))))
			||
			(s2.GetHeightSec() &&
			 ((t2.Z() + t2.height <= s2.heightsec.floorplane.ZatPoint(t2) &&
			   t1.Z() >= s2.heightsec.floorplane.ZatPoint(t1)) ||
			  (t2.Z() >= s2.heightsec.ceilingplane.ZatPoint(t2) &&
			   t1.Z() + t2.height <= s2.heightsec.ceilingplane.ZatPoint(t1)))))
		{
			res = false;
			return psdone();
		}
	}*/

	// An unobstructed LOS is possible.
	// Now look from eyes of t1 to any part of t2.

	validcount++;
	var s = SightCheck(t1, t2, flags);
	res = s.P_SightPathTraverse (t1.X(), t1.Y(), t2.X(), t2.Y());
}
function psdone(){
	//SightCycles.Unclock();
	return res;
}
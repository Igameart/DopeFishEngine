function DE_SetMobjState( mobj, state )
{
    var	st;

    //while (!mobj.tics){
		//with mobj trace("Setting Mobj State To",state);
		if (state == statenum_t.S_NULL)
		{
		    //instance_destroy(mobj);
			trace("Mobj State Is Null");
		    return false;
		}
		
		if mobj.seqStep >= array_length( States[? state ] ){
			var st = States[? state ][ array_length( States[? state ] )-1 ];
			state = st.nextstate;
			mobj.seqStep = 0;
			mobj.sprFrameIndex = 0;
		}
		
		st = States[? state ][ mobj.seqStep ];
		if !is_array(st){
			
			mobj.state = st;
			mobj.tics = st.tics;
			mobj.oldTics = st.tics;
			mobj.sprite = st.sprite;
			mobj.sprSequence = st.frame;
			
		}
		
		mobj.stateName = state;
		//mobj.sprFrameIndex = 0;
		
		// Call action functions when the state is set
		if mobj.age>1
		if (st.action.acp1)		
			st.action.acp1(mobj);
    }
				
    return true;
//}

function DE_changeMobjState( state )
{
    var	st;

	if (state == statenum_t.S_NULL)
	{
		return false;
	}
	
	seqStep = 0;
	st = States[? state ][ seqStep ];
	
	if st!=undefined{
	
	id.state = st;
	stateName = state;
	tics = st.tics;
	sprite = st.sprite;
	sprSequence = st.frame;
	sprFrameIndex = 0;
	nextstate = st.nextstate;
	
	DEtrace("Setting Mobj State", state );
	
    return true;
	}else{
		DEtrace("Mobj State Doesn't Exist",state );
		return false;
	}
}


function A_AlertMonsters( mobj ){

	

};
function A_Burst( mobj ){

	

};
function A_CentaurDefend( mobj ){

	

};

function A_Chase(  ){
	
	//DEtrace("Chasing");
	
	var actor=argument[0];
	var fastchase = argument_count>1?argument[1]: false;
	var meleestate  = argument_count>2?argument[2]: "Melee";
	var missilestate = argument_count>3?argument[3]: "Missile";
	var playactive = argument_count>4?argument[4]: false;
	var nightmarefast = argument_count>5?argument[5]: false;
	var dontmove = argument_count>6?argument[6]: false;

	var delta;

	//Dont chase if talking
	if (actor.flags5 & MF5_INCONVERSATION)
		return;

	//Don't chase if chasing? Commented out
	if (actor.flags & MF_INCHASE)
	{
		//return;
	}
	
	actor.flags |= MF_INCHASE;
	
	//actor.reactiontime--;
	
	//if (actor.reactiontime<=0){
	//	actor.reactiontime = 8;
		
		A_FaceTarget(actor);
		
		//actor.Angle += random_range(-25,25)/8;
		
		//actor.Angle = smod( actor.Angle, 360);
		
		var oldx = actor.x;
		var oldy = actor.y;
		if P_TryMove(actor,oldx,oldy,false){
			
		}
		
	//}
	
	//set chasing flag
	actor.flags &= ~MF_INCHASE;
};

function P_TryMove( actor, X, Y, dropoff){
		
	with actor{
		
		var xx = X + lengthdir_x(Speed/8,(Angle));
		var yy = Y + lengthdir_y(Speed/8,(Angle));
		
		//if place_meeting(xx,yy,objDESlideCollider) return false;
		
		x=xx;
		y=yy;
		
		return true;
	}
}

function A_CheckForResurrection( mobj ){

	

};
function A_ClearLastHeard( mobj ){

	

};
function A_ClearSoundTarget( mobj ){

	

};
function A_ClearTarget( mobj ){

	

};
function A_DamageChildren( mobj ){

	

};
function A_DamageMaster( mobj ){

	

};
function A_DamageSelf( mobj ){

	

};
function A_DamageSiblings( mobj ){

	

};
function A_DamageTarget( mobj ){

	

};
function A_DamageTracer( mobj ){

	

};
function A_Die( mobj ){

	

};
//function A_ExtChase (deprecated)( mobj ){};
function A_FaceMaster( mobj ){

	

};
enum FAF_Flags
{
	FAF_BOTTOM = 1,
	FAF_MIDDLE = 2,
	FAF_TOP = 4,
	FAF_NODISTFACTOR = 8,	// deprecated
};

function A_Face (  )
{
	var _self = argument[0];
	var _other = argument_count > 1 ?argument[1]:0;
	var max_turn = argument_count > 2 ?argument[2]:0;
	var max_pitch = argument_count > 3 ?argument[3]:0;
	var ang_offset = argument_count > 4 ?argument[4]:0;
	var pitch_offset = argument_count > 5 ?argument[5]:0;
	var flags = argument_count > 6 ?argument[6]:0;
	var z_add = argument_count > 7 ?argument[7]:0;
	
	if (!_other)
		return;

	// [RH] Andy Baker's stealth monsters
	if (_self.flags & MF_STEALTH)
	{
		_self.visdir = 1;
	}

	_self.flags &= ~MF_AMBUSH;

	var other_angle = point_direction(_self.x,_self.y,_other.x,_other.y);

	// 0 means no limit. Also, if we turn in a single step anyways, no need to go through the algorithms.
	// It also means that there is no need to check for going past the other.
	if (max_turn && (max_turn < absangle(_self.Angle - other_angle)))
	{
		if (_self.Angle > other_angle)
		{
			if (_self.Angle - other_angle < ANGLE_180)
			{
				_self.Angle -= max_turn + ang_offset;
			}
			else
			{
				_self.Angle += max_turn + ang_offset;
			}
		}
		else
		{
			if (other_angle - _self.Angle < ANGLE_180)
			{
				_self.Angle += max_turn + ang_offset;
			}
			else
			{
				_self.Angle -= max_turn + ang_offset;
			}
		}
	}
	else
	{
		_self.Angle = other_angle + ang_offset;
	}

	// [DH] Now set pitch. In order to maintain compatibility, this can be
	// disabled and is so by default.
	if (max_pitch <= ANGLE_180)
	{
		with _self var pos = Vec2To(_other);
		var dist = [pos.x, pos.y];
		
		// Positioning ala missile spawning, 32 units above foot level
		var source_z = _self.z + 32*FRACUNIT;// + _self.GetBobOffset();
		var target_z = _other.z + 32*FRACUNIT;// + _other.GetBobOffset();

		// If the target z is above the target's head, reposition to the middle of
		// its body.		
		if (target_z >= (_other.Height + _other.z ) )
		{
			target_z = _other.z + (_other.Height / 2);
		}

		//Note there is no +32*FRACUNIT on purpose. This is for customization sake. 
		//If one doesn't want this behavior, just don't use FAF_BOTTOM.
		/*if (flags & FAF_BOTTOM)
			target_z = _other.Z() + _other.GetBobOffset(); 
		if (flags & FAF_MIDDLE)
			target_z = _other.Z() + (_other.Height / 2) + _other.GetBobOffset();
		if (flags & FAF_TOP)
			target_z = _other.Z() + (_other.Height) + _other.GetBobOffset();*/

		target_z += z_add;

		var dist_z = target_z - source_z;
		var ddist = sqrt(dist[0]*dist[0] + dist[1]*dist[1] + dist_z*dist_z);
		var other_pitch = rad2bam( arcsin(dist_z / ddist));
		
		if (max_pitch != 0)
		{
			if (_self.pitch > other_pitch)
			{
				max_pitch = min(max_pitch, (_self.pitch - other_pitch));
				_self.pitch -= max_pitch;
			}
			else
			{
				max_pitch = min(max_pitch, (other_pitch - _self.pitch));
				_self.pitch += max_pitch;
			}
		}
		else
		{
			_self.pitch = other_pitch;
		}
		_self.pitch += pitch_offset;
	}
	


	// This will never work well if the turn angle is limited.
	if (max_turn == 0 && (_self.Angle == other_angle)    )// && _other.flags & MF_SHADOW && !(_self.flags6 & MF6_SEEINVISIBLE) )
    {
		_self.Angle += mRandom2() << 21;
    }
}

function A_FaceTarget( _self )
{
	
	var _tang = point_direction(_self.x,_self.y,DEcam.x,DEcam.y);
	var _diff = angle_difference(_self.Angle,_tang);
	_self.Angle += _diff * .4;
	
	//A_Face(_self, _self.target);
}
function A_FaceTracer( mobj ){

	

};
function A_FastChase( mobj ){

	

};
function A_KillChildren( mobj ){

	

};
function A_KillMaster( mobj ){

	

};
function A_KillSiblings( mobj ){

	

};
function A_KillTarget( mobj ){

	

};
function A_KillTracer( mobj ){

	

};
function A_Look( mobj ){
	//
	// ACTION ROUTINES
	//

	//
	// A_Look
	// Stay in state until a player is sighted.
	// [RH] Will also leave state to move to goal.
	//

	var targ = DEcam;
	
	if !instance_exists(targ) return false;
	
	var this = mobj;
	
	if (this.flags5 & MF5_INCONVERSATION )
		return 0;
		
	this.target = targ;
	with this
	if distance_to_object(targ) < 75
	if ( SightCheck(this, targ))//, SF_SEEPASTBLOCKEVERYTHING)
		return seeyou(this);

	// [RH] Set goal now if appropriate
	/*if (this.special == Thing_SetGoal && this.args[0] == 0) 
	{
		var iterator = this.Level.GetActorIterator( NAME_PatrolPoint, this.args[1] );
		
		this.special = 0;
		this.goal = iterator.Next ();
		this.reactiontime = this.args[2] * TICRATE + this.Level.maptime;
		
		if (this.args[3] == 0) this.flags5 &= ~MF5_CHASEGOAL;
		else this.flags5 |= MF5_CHASEGOAL;
	}

	this.threshold = 0;		// any shot will wake up

	if (this.TIDtoHate != 0)
	{
		targ = this.target;
	}
	else
	{
		targ = (this.Level.i_compatflags & COMPATF_SOUNDTARGET || this.flags & MF_NOSECTOR)? 
		this.Sector.SoundTarget : this.LastHeard;

		// [RH] If the soundtarget is dead, don't chase it
		if (targ != null && targ._health <= 0)
		{
			targ = null;
		}

		if (targ && targ.player && ((targ.player.cheats & CF_NOTARGET) || !(targ.flags & MF_FRIENDLY)))
		{
			return 0;
		}
	}*/

	// [RH] Andy Baker's stealth monsters
	if (this.flags & MF_STEALTH)
	{
		this.visdir = -1;
	}

	if (targ && (targ.flags & MF_SHOOTABLE))
	{
		/*if ( IsFriend(this,targ))	// be a little more precise!
		{
			// If we find a valid target here, the wandering logic should *not*
			// be activated! It would cause the seestate to be set twice.
			if (P_LookForPlayers (this, this.flags4 & MF4_LOOKALLAROUND, null))
				return seeyou(this);

			// Let the this wander around aimlessly looking for a fight
			if (this.SeeState != null)
			{
				this.tics = 0;
				DE_SetMobjState(this,this.SeeState);
				//this.SetState (this.SeeState);
			}
			else
			{
				A_Wander(this);
			}
		}
		else
		{*/
			this.target = targ;

			if (this.flags & MF_AMBUSH)
			{
				if ( SightCheck(this, this.target))//, SF_SEEPASTBLOCKEVERYTHING)
					return seeyou(this);
			}
			else
				return seeyou(this);
		/*}*/
	}
	
	if (!P_LookForPlayers (this, this.flags4 & MF4_LOOKALLAROUND, null))
		return 0;
				
}
	// go into chase state
function seeyou(this){
	/*
	// [RH] Don't start chasing after a goal if it isn't time yet.
	if (this.target == this.goal)
	{
		if (this.reactiontime > this.Level.maptime)
			this.target = null;
	}
	else if (this.SeeSound)
	{
		if (this.flags2 & MF2_BOSS)
		{ // full volume
			//S_Sound (this, CHAN_VOICE, 0, this.SeeSound, 1, ATTN_NONE);
		}
		else
		{
			//S_Sound (this, CHAN_VOICE, 0, this.SeeSound, 1, ATTN_NORM);
		}
	}*/

	if (this.target)// && this.SeeState)
	{
		with this{
			trace("I see you",visible,x,y);
			DE_changeMobjState( "See" );
		}
	}
	return 0;
  }


function A_Look2( mobj ){

	

};
function A_LookEx( mobj ){

	

};
function A_RaiseChildren( mobj ){

	

};
function A_RaiseMaster( mobj ){

	

};
function A_RaiseSelf( mobj ){

	

};
function A_RaiseSiblings( mobj ){

	

};
function A_RemoveChildren( mobj ){

	

};
function A_RemoveMaster( mobj ){

	

};
function A_RemoveSiblings( mobj ){

	

};
function A_RemoveTarget( mobj ){

	

};
function A_RemoveTracer( mobj ){

	

};
function A_Remove( mobj ){

	

};
function A_SentinelBob( mobj ){

	

};
function A_Teleport( mobj ){

	

};
function A_TurretLook( mobj ){

	

};
function A_VileChase( mobj ){

	

};
function A_Wander( mobj ){

	

};


// Generic monster attacks
function A_BasicAttack( mobj ){

	

};
function A_BulletAttack( mobj ){

	

};
// A_ComboAttack (deprecated)( mobj ){};
// A_CustomMissile (deprecated)( mobj ){};
function A_CustomBulletAttack( mobj ){

	

};
function A_CustomRailgun( mobj ){

	

};
function A_CustomMeleeAttack( mobj ){

	

};
function A_CustomComboAttack( mobj ){

	

};
function A_Detonate( mobj ){

	

};
function A_Explode( mobj ){

	

};
// A_MeleeAttack (deprecated)( mobj ){};
// A_MissileAttack (deprecated)( mobj ){};
function A_MonsterRefire( mobj ){

	

};
function A_MonsterRail( mobj ){

	

};
function A_RadiusDamageSelf( mobj ){

	

};
function A_RadiusThrust( mobj ){

	

};
function A_SpawnProjectile( mobj ){

	

};
function A_ThrowGrenade( mobj ){

	

};
function A_WolfAttack( mobj ){

	

};


// Freeze death functions
function A_FreezeDeath( mobj ){

	

};
function A_GenericFreezeDeath( mobj ){

	

};
function A_FreezeDeathChunks( mobj ){

	

};
function A_IceGuyDie( mobj ){

	

};


// Sound functions
function A_StartSound( mobj ){

	

};
// A_PlaySound (deprecated)( mobj ){};
// A_PlaySoundEx (deprecated)( mobj ){};
// A_PlayWeaponSound (deprecated)( mobj ){};
function A_ActiveSound( mobj ){

	

};
function A_LoopActiveSound( mobj ){

	

};
function A_FLoopActiveSound( mobj ){

	

};
function A_StopSound( mobj ){

	

};
function A_StopSounds( mobj ){

	

};
function A_StopAllSounds( mobj ){

	

};
// A_StopSoundEx (deprecated)( mobj ){};
function A_SoundPitch( mobj ){

	

};
function A_SoundVolume( mobj ){

	

};
function A_Pain( mobj ){

	

};
function A_Scream( mobj ){

	

};
function A_XScream( mobj ){

	

};
function A_PlayerScream( mobj ){

	

};
function A_VileStart( mobj ){

	

};
function A_BrainPain( mobj ){

	

};
function A_BrainAwake( mobj ){

	

};
function A_BFGSound( mobj ){

	

};


// Print actions
function A_Print( mobj ){

	

};
function A_PrintBold( mobj ){

	

};
function A_Log( mobj ){

	

};
function A_LogFloat( mobj ){

	

};
function A_LogInt( mobj ){

	

};


// Special actions
function A_BossDeath( mobj ){

	

};
function A_KeenDie( mobj ){

	

};
function A_BrainDie( mobj ){

	

};
function A_GetHurt( mobj ){

	

};
function A_KlaxonBlare( mobj ){

	

};
function A_CheckTerrain( mobj ){

	

};
function A_SetBlend( mobj ){

	

};
function A_CheckPlayerDone( mobj ){

	

};
function A_PlayerSkinCheck( mobj ){

	

};
function A_SkullPop( mobj ){

	

};
function A_SprayDecal( mobj ){

	

};
function A_Quake( mobj ){

	

};
function A_QuakeEx( mobj ){

	

};
function A_CopySpriteFrame( mobj ){

	

};
function A_SetSpriteAngle( mobj ){

	

};
function A_SetSpriteRotation( mobj ){

	

};
function A_SpriteOffset( mobj ){

	

};


// Spawn functions
function A_TossGib( mobj ){

	

};
function A_SpawnDebris( mobj ){

	

};
function A_SpawnItem( mobj ){

	

};
function A_SpawnItemEx( mobj ){

	

};
function A_SpawnParticle( mobj ){

	

};


// State jumps
function A_CheckBlock( mobj ){

	

};
function A_CheckCeiling( mobj ){

	

};
function A_CheckFloor( mobj ){

	

};
//function A_CheckFlag (deprecated)( mobj ){};
function A_CheckLOF( mobj ){

	

};
function A_CheckProximity( mobj ){

	

};
function A_CheckRange( mobj ){

	

};
function A_CheckSight( mobj ){

	

};
function A_CheckSightOrRange( mobj ){

	

};
function A_CheckSpecies( mobj ){

	

};
function A_Jump( mobj ){

	

};
function A_JumpIf( mobj ){

	

};
function A_JumpIfArmorType( mobj ){

	

};
function A_JumpIfCloser( mobj ){

	

};
function A_JumpIfHealthLower( mobj ){

	

};
function A_JumpIfHigherOrLower( mobj ){

	

};
function A_JumpIfInventory( mobj ){

	

};
function A_JumpIfInTargetInventory( mobj ){

	

};
function A_JumpIfInTargetLOS( mobj ){

	

};
function A_JumpIfMasterCloser( mobj ){

	

};
function A_JumpIfNoAmmo( mobj ){

	

};
function A_JumpIfTargetInLOS( mobj ){

	

};
function A_JumpIfTargetInsideMeleeRange( mobj ){

	

};
function A_JumpIfTargetOutsideMeleeRange( mobj ){

	

};
function A_JumpIfTracerCloser( mobj ){

	

};


// Status changes
function A_ActiveAndUnblock( mobj ){

	

};
function A_ChangeCountFlags( mobj ){

	

};
//function A_ChangeFlag (deprecated)( mobj ){};
function A_ChangeVelocity( mobj ){

	

};
function A_ClearShadow( mobj ){

	

};
function A_CopyFriendliness( mobj ){

	

};
function A_DeQueueCorpse( mobj ){

	

};
function A_FadeIn( mobj ){

	

};
function A_FadeOut( mobj ){

	

};
function A_FadeTo( mobj ){

	

};
function A_FaceMovementDirection( mobj ){

	

};
function A_Fall( mobj ){

	

};
function A_Gravity( mobj ){

	

};
function A_HideThing( mobj ){

	

};
function A_LowGravity( mobj ){

	

};
function A_Morph( mobj ){

	

};
function A_NoBlocking( mobj ){

	

};
function A_NoGravity( mobj ){

	

};
function A_QueueCorpse( mobj ){

	

};
function A_RearrangePointers( mobj ){

	

};
function A_ResetHealth( mobj ){

	

};
function A_Respawn( mobj ){

	

};
function A_ScaleVelocity( mobj ){

	

};
function A_ScreamAndUnblock( mobj ){

	

};
function A_SetAngle( mobj ){

	

};
function A_SetArg( mobj ){

	

};
function A_SetChaseThreshold( mobj ){

	

};
function A_SetDamageType( mobj ){

	

};
function A_SetFloat( mobj ){

	

};
function A_SetFloatSpeed( mobj ){

	

};
function A_SetFloatBobPhase( mobj ){

	

};
function A_SetFloorClip( mobj ){

	

};
function A_SetGravity( mobj ){

	

};
function A_SetHealth( mobj ){

	

};
function A_SetInvulnerable( mobj ){

	

};
function A_SetMass( mobj ){

	

};
function A_SetMugshotState( mobj ){

	

};
function A_SetPainThreshold( mobj ){

	

};
function A_SetPitch( mobj ){

	

};
function A_SetReflective( mobj ){

	

};
function A_SetReflectiveInvulnerable( mobj ){

	

};
function A_SetRenderStyle( mobj ){

	

};
function A_SetRipperLevel( mobj ){

	

};
function A_SetRipMin( mobj ){

	

};
function A_SetRipMax( mobj ){

	

};
function A_SetRoll( mobj ){

	

};// Graficon.gif (GZDoom only: not supported by ZDoom)
function A_SetScale( mobj ){

	

};
function A_SetShadow( mobj ){

	

};
function A_SetShootable( mobj ){

	

};
function A_SetSize( mobj ){

	

};
function A_SetSolid( mobj ){

	

};
function A_SetSpecial( mobj ){

	

};
function A_SetSpecies( mobj ){

	

};
function A_SetSpeed( mobj ){

	

};
function A_SetTeleFog( mobj ){

	

};
function A_SetTics( mobj ){

	

};
function A_SetTranslucent( mobj ){

	

};
function A_SetUserArray( mobj ){

	

};
function A_SetUserArrayFloat( mobj ){

	

};
function A_SetUserVar( mobj ){

	

};
function A_SetUserVarFloat( mobj ){

	

};
function A_SetViewAngle( mobj ){

	

};
function A_SetViewPitch( mobj ){

	

};
function A_SetViewRoll( mobj ){

	

};
function A_SetTranslation( mobj ){

	

};
function A_SetVisibleRotation( mobj ){

	

};
function A_SwapTeleFog( mobj ){

	

};
function A_TransferPointer( mobj ){

	

};
function A_UnHideThing( mobj ){

	

};
function A_UnsetFloat( mobj ){

	

};
function A_UnSetFloorClip( mobj ){

	

};
function A_UnSetInvulnerable( mobj ){

	

};
function A_UnSetReflective( mobj ){

	

};
function A_UnSetReflectiveInvulnerable( mobj ){

	

};
function A_UnSetShootable( mobj ){

	

};
function A_UnsetSolid( mobj ){

	

};


// Dynamic lights
function A_AttachLight( mobj ){

	

};
function A_AttachLightDef( mobj ){

	

};
function A_RemoveLight( mobj ){

	

};


// Missile movement
function A_SeekerMissile( mobj ){

	

};
function A_Tracer( mobj ){

	

};
function A_Tracer2( mobj ){

	

};
function A_Fire( mobj ){

	

};
function A_BishopMissileWeave( mobj ){

	

};
function A_CStaffMissileSlither( mobj ){

	

};
function A_Weave( mobj ){

	

};
function A_Warp( mobj ){

	

};
function A_Countdown( mobj ){

	

};
function A_CountdownArg( mobj ){

	

};
function A_Stop( mobj ){

	

};


// Inventory functions
function A_DropInventory( mobj ){

	

};
function A_DropItem( mobj ){

	

};
function A_GiveInventory( mobj ){

	

};
function A_GiveToChildren( mobj ){

	

};
function A_GiveToSiblings( mobj ){

	

};
function A_GiveToTarget( mobj ){

	

};
function A_TakeInventory( mobj ){

	

};
function A_TakeFromChildren( mobj ){

	

};
function A_TakeFromSiblings( mobj ){

	

};
function A_TakeFromTarget( mobj ){

	

};
function A_SelectWeapon( mobj ){

	

};
function A_SetInventory( mobj ){

	

};
function A_RadiusGive( mobj ){

	

};


// Weapon functions
function A_WeaponReady( mobj ){

	

};
function A_WeaponOffset( mobj ){

	

};
function A_Lower( mobj ){

	

};
function A_Raise( mobj ){

	

};
function A_ReFire( mobj ){

	

};
function A_ClearReFire( mobj ){

	

};
function A_GunFlash( mobj ){

	

};
function A_CheckReload( mobj ){

	

};
function A_CheckForReload( mobj ){

	

};
//function A_CheckRailReload SkulltagIcon22.png (Skulltag only: not supported by ZDoom) (deprecated)( mobj ){};
function A_ResetReloadCounter( mobj ){

	

};
function A_Light( mobj ){

	

};
function A_Light0( mobj ){

	

};
function A_Light1( mobj ){

	

};
function A_Light2( mobj ){

	

};
function A_LightInverse( mobj ){

	

};
function A_ClearOverlays( mobj ){

	

};
function A_Overlay( mobj ){

	

};
function A_OverlayAlpha( mobj ){

	

};
function A_OverlayFlags( mobj ){

	

};
function A_OverlayOffset( mobj ){

	

};
function A_OverlayPivot( mobj ){

	

};
function A_OverlayPivotAlign( mobj ){

	

};
function A_OverlayRenderstyle( mobj ){

	

};
function A_OverlayRotate( mobj ){

	

};
function A_OverlayScale( mobj ){

	

};
function A_OverlayTranslation( mobj ){

	

};
function A_OverlayVertexOffset( mobj ){

	

};
function A_Recoil( mobj ){

	

};
function A_ZoomFactor( mobj ){

	

};
function A_SetCrosshair( mobj ){

	

};


// Weapon attack functions
function A_CustomPunch( mobj ){

	

};
function A_FireBullets( mobj ){

	

};
//function A_FireCustomMissile (deprecated)( mobj ){};
function A_FireProjectile( mobj ){

	

};
function A_FireAssaultGun( mobj ){

	

};
function A_FireBFG( mobj ){

	

};
function A_FireOldBFG( mobj ){

	

};
function A_FirePistol( mobj ){

	

};
function A_FireShotgun( mobj ){

	

};
function A_FireShotgun2( mobj ){

	

};
function A_FireCGun( mobj ){

	

};
function A_FireMissile( mobj ){

	

};
function A_FirePlasma( mobj ){

	

};
//function A_FireSTGrenade (deprecated)( mobj ){};
function A_Punch( mobj ){

	

};
function A_RailAttack( mobj ){

	

};
function A_Saw( mobj ){

	

};


// Script functions
function ACS_NamedExecute( mobj ){

	

};
function ACS_NamedSuspend( mobj ){

	

};
function ACS_NamedTerminate( mobj ){

	

};
function ACS_NamedLockedExecute( mobj ){

	

};
function ACS_NamedLockedExecuteDoor( mobj ){

	

};
function ACS_NamedExecuteWithResult( mobj ){

	

};
function ACS_NamedExecuteAlways( mobj ){

	

};


// Original Doom/Strife monster attacks
function A_PosAttack( mobj ){

	

};
function A_SPosAttack( mobj ){

	

};
function A_CPosAttack( mobj ){

	

};
function A_CPosRefire( mobj ){

	

};
function A_SpidRefire( mobj ){

	

};
function A_TroopAttack( mobj ){

	

};
function A_SargAttack( mobj ){

	

};
function A_HeadAttack( mobj ){

	

};
function A_BruisAttack( mobj ){

	

};
function A_SkullAttack( mobj ){

	

};
function A_BspiAttack( mobj ){

	

};
function A_CyberAttack( mobj ){

	

};
function A_PainAttack( mobj ){

	

};
function A_DualPainAttack( mobj ){

	

};
function A_PainDie( mobj ){

	

};
function A_SkelFist( mobj ){

	

};
function A_SkelMissile( mobj ){

	

};
function A_FatAttack1( mobj ){

	

};
function A_FatAttack2( mobj ){

	

};
function A_FatAttack3( mobj ){

	

};
function A_VileTarget( mobj ){

	

};
function A_VileAttack( mobj ){

	

};
function A_BrainSpit( mobj ){

	

};
function A_SpawnFly( mobj ){

	

};
function A_SpawnSound( mobj ){

	

};
function A_BrainScream( mobj ){

	

};
function A_BrainExplode( mobj ){

	

};
function A_Mushroom( mobj ){

	

};
function A_M_Saw( mobj ){

	

};
function A_SentinelRefire( mobj ){

	

};
function A_BetaSkullAttack( mobj ){

	

};


// Miscellaneous functions for Doom( mobj )
function A_Hoof( mobj ){

	

};
function A_Metal( mobj ){

	

};
function A_BabyMetal( mobj ){

	

};
function A_FatRaise( mobj ){

	

};
function A_SkelWhoosh( mobj ){

	

};
function A_StartFire( mobj ){

	

};
function A_FireCrackle( mobj ){

	

};
function A_BFGSpray( mobj ){

	

};
function A_BarrelDestroy( mobj ){

	

};
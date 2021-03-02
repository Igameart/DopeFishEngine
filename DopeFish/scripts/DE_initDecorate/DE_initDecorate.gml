globalvar DEparseMode;
DEparseMode = "NULL";

#macro DEFAULT_HEALTH  1000
#macro ONFLOORZ  -2147483648.0
#macro ONCEILINGZ  2147483647.0
#macro FLOATRANDZ  ONCEILINGZ-1
#macro TELEFRAG_DAMAGE  1000000
#macro MinVel  1./65536
#macro LARGE_MASS  10000000	// not INT_MAX on purpose
#macro ORIG_FRICTION  (0xE800/65536.)	// original value
#macro ORIG_FRICTION_FACTOR  (2048/65536.)	// original value
#macro DEFMORPHTICS  40 * TICRATE

globalvar ACTORstruct;
ACTORstruct = {
	Scale : 1, 
	Health : DEFAULT_HEALTH, 
	Reactiontime : 8, 
	Radius : 20, 
	RenderRadius : 0, 
	Height : 16, 
	Mass : 100, 
	RenderStyle : "Normal", 
	Alpha : 1, 
	MinMissileChance : 200, 
	MeleeRange : [64 - 20], 
	MaxDropoffHeight : 24, 
	MaxStepHeight : 24, 
	BounceFactor : 0.7, 
	WallBounceFactor : 0.75, 
	BounceCount : -1, 
	FloatSpeed : 4, 
	FloatBobPhase : -1, 	// : randomly : initialize : by : default
	FloatBobStrength : 1.0, 
	Gravity : 1, 
	Friction : 1, 
	DamageFactor : 1.0, 		// : damage : multiplier : as : target : of : damage.
	DamageMultiply : 1.0, 		// : damage : multiplier : as : source : of : damage.
	PushFactor : 0.25, 
	WeaveIndexXY : 0, 
	WeaveIndexZ : 16, 
	DesignatedTeam : 255, 
	PainType : "Normal", 
	DeathType : "Normal", 
	TeleFogSourceType : "TeleportFog", 
	TeleFogDestType : "TeleportFog", 
	RipperLevel : 0, 
	RipLevelMin : 0, 
	RipLevelMax : 0, 
	DefThreshold : 100, 
	BloodType : ["Blood", "BloodSplatter", "AxeBlood"], 
	ExplosionDamage : 128, 
	ExplosionRadius : -1, 	// : i.e. : use : ExplosionDamage : value
	MissileHeight : 32, 
	SpriteAngle : 0, 
	SpriteRotation : 0, 
	StencilColor : [00 , 00 , 00], 
	VisibleAngles : [0, 0], 
	VisiblePitch : [0, 0], 
	DefaultStateUsage : EStateUseFlags.SUF_ACTOR,//|EStateUseFlags.SUF_OVERLAY, 
	CameraHeight : 40, 
	CameraFOV : 90., 
	FastSpeed : -1, 
	RadiusDamageFactor : 1, 
	SelfDamageFactor : 1, 
	StealthAlpha : 0, 
	WoundHealth : 6, 
	GibHealth : -5,//int.min, 
	DeathHeight : -1, 
	BurnHeight : -1, 
	RenderHidden : 0, 
	RenderRequired : 0, 
	FriendlySeeBlocks : 10, // 10 (blocks) * 128 (one map unit block)
	
	SHOOTABLE : false,
	COUNTKILL : false,
	SOLID : false,
	CANPUSHWALLS : false,
	CANUSEWALLS : false,
	ACTIVATEMCROSS : false,
	CANPASS : false,
	ISMONSTER : false,
	NOBLOCKMAP : false,
	NOGRAVITY : false,
	DROPOFF : false,
	MISSILE : false,
	ACTIVATEIMPACT : false,
	ACTIVATEPCROSS : false,
	NOTELEPORT : false,
	BLOODSPLATTER : false
}

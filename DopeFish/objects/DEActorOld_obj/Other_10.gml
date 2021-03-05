/// @description Init Actor Vars

age = 0;
Scale = 0;
Health = 0;
Reactiontime = 0;
Radius = 0;
RenderRadius = 0;
Height = 0;
Mass = 0;
RenderStyle = 0;
Alpha = 0;
MinMissileChance = 0;
MeleeRange = 0;
MaxDropoffHeight = 0;
MaxStepHeight = 0;
BounceFactor = 0;
WallBounceFactor = 0;
BounceCount = 0;
FloatSpeed = 0;
FloatBobPhase = 0;
FloatBobStrength = 0;
Gravity = 0;
Friction = 0;
DamageFactor = 0;
DamageMultiply = 0;
PushFactor = 0;
WeaveIndexXY = 0;
WeaveIndexZ = 0;
DesignatedTeam = 0;
PainType = 0;
DeathType = 0;
TeleFogSourceType = 0;
TeleFogDestType = 0;
RipperLevel = 0;
RipLevelMin = 0;
RipLevelMax = 0;
DefThreshold = 0;
BloodType = 0;
ExplosionDamage = 0;
ExplosionRadius = 0;
MissileHeight = 0;
SpriteAngle = 0;
SpriteRotation = 0;
StencilColor = 0;
VisibleAngles = 0;
VisiblePitch = 0;
DefaultStateUsage = 0;
CameraHeight = 0;
CameraFOV = 0;
FastSpeed = 0;
RadiusDamageFactor = 0;
SelfDamageFactor = 0;
StealthAlpha = 0;
WoundHealth = 0;
GibHealth = 0;
DeathHeight = 0;
BurnHeight = 0;
RenderHidden = 0;
RenderRequired = 0;
FriendlySeeBlocks = 0;

SHOOTABLE = false;
COUNTKILL = false;
SOLID = false;
CANPUSHWALLS = false;
CANUSEWALLS = false;
ACTIVATEMCROSS = false;
CANPASS = false;
ISMONSTER = false;
NOBLOCKMAP = false;
NOGRAVITY = false;
DROPOFF = false;
MISSILE = false;
ACTIVATEIMPACT = false;
ACTIVATEPCROSS = false;
NOTELEPORT = false;
BLOODSPLATTER = false;

// interaction info
pitch = 0;
roll = 0;	// This was fixed_t before, which is probably wrong
BlockNode = 0;			// links in blocks (if needed)
Sector = 0;
subsector = 0;
floorz = 0;
ceilingz = 0;	// closest together of contacted secs
dropoffz = 0;		// killough 11/98: the lowest floor over all contacted Sectors.

floorsector = 0;
floorpic = 0;			// contacted sec floorpic
floorterrain = 0;
ceilingsector = 0;
ceilingpic = 0;			// contacted sec ceilingpic
radius = 0;
height = 0;		// for movement checking
projectilepassheight = 0;	// height for clipping projectile movement against this actor
velx = 0;
vely = 0;
velz = 0;	// velocity
tics = 4;				// state tic counter
state = 0;
Damage = 0;			// For missiles and monster railgun
projectileKickback = 0;
flags = 0;
flags2 = 0;			// Heretic flags
flags3 = 0;			// [RH] Hexen/Heretic actor-dependant behavior made flaggable
flags4 = 0;			// [RH] Even more flags!
flags5 = 0;			// OMG! We need another one.
flags6 = 0;			// Shit! Where did all the flags go?
flags7 = 0;			// WHO WANTS TO BET ON 8!?

// [BB] If 0, everybody can see the actor, if > 0, only members of team (VisibleToTeam-1) can see it.
VisibleToTeam = 0;

special1 = 0;		// Special info
special2 = 0;		// Special info
weaponspecial = 0;	// Special info for weapons.
_health = 0;
movedir = 0;		// 0-7
visdir = 0;
movecount = 0;		// when 0, select a new dir
strafecount = 0;	// for MF3_AVOIDMELEE
target = 0;			// thing being chased/attacked (or NULL)
				// also the originator for missiles
lastenemy = 0;		// Last known enemy -- killough 2/15/98
LastHeard = 0;		// [RH] Last actor this one heard
reactiontime = 0;	// if non 0, don't attack yet = 0; used by
				// player to freeze a bit after teleporting
threshold = 0;		// if > 0, the target will be chased
				// no matter what (even if shot)
player = 0;		// only valid if type of APlayerPawn
LastLookActor = 0;	// Actor last looked for (if TIDtoHate != 0)
SpawnPoint = [0,0,0]; 	// For nightmare respawn
SpawnAngle = 0;
StartHealth = 0;
WeaveIndexXY = 0;	// Separated from special2 because it's used by globally accessible functions.
WeaveIndexZ = 0;
skillrespawncount = 0;
TIDtoHate = 0;			// TID of things to hate (0 if none)
Species = 0;		// For monster families
tracer = 0;			// Thing being chased/attacked for tracers
master = 0;			// Thing which spawned this one (prevents mutual attacks)
floorclip = 0;		// value to use for floor clipping
tid = 0;			// thing identifier
special = 0;		// special
args = [0,0,0,0,0];		// special arguments

accuracy = 0;
stamina = 0;		// [RH] Strife stats -- [XA] moved here for DECORATE/ACS access.

inext = 0;
iprev = 0;// Links to other mobjs in same bucket
goal = 0;			// Monster's goal if not chasing anything
waterlevel = 0;		// 0=none, 1=feet, 2=waist, 3=eyes
boomwaterlevel = 0;	// splash information for non-swimmable water sectors
MinMissileChance = 0;// [RH] If a random # is > than this, then missile attack.
LastLookPlayerNumber = 0;// Player number last looked for (if TIDtoHate == 0)
BounceFlags = 0;	// which bouncing type?
SpawnFlags = 0;		// Increased to DWORD because of Doom 64
meleerange = 0;		// specifies how far a melee attack reaches.
meleethreshold = 0;	// Distance below which a monster doesn't try to shoot missiles anynore
				// but instead tries to come closer for a melee attack.
				// This is not the same as meleerange
maxtargetrange = 0;	// any target farther away cannot be attacked
bouncefactor = 0;	// Strife's grenades use 50%, Hexen's Flechettes 70.
wallbouncefactor = 0;	// The bounce factor for walls can be different.
bouncecount = 0;	// Strife's grenades only bounce twice before exploding
gravity = 0;		// [GRB] Gravity factor
Friction = 0;
FastChaseStrafeCount = 0;
pushfactor = 0;
lastpush = 0;
activationtype = 0;	// How the thing behaves when activated with USESPECIAL or BUMPSPECIAL
lastbump = 0;		// Last time the actor was bumped, used to control BUMPSPECIAL
Score = 0;			// manipulated by score items, ACS or DECORATE. The engine doesn't use this itself for anything.
Tag = 0;			// Strife's tag name.
DesignatedTeam = 0;	// Allow for friendly fire cacluations to be done on non-players.

BlockingMobj = 0;	// Actor that blocked the last move
BlockingLine = 0;	// Line that blocked the last move

PoisonDamage = 0; // Damage received per tic from poison.
PoisonDamageType = 0; // Damage type dealt by poison.
PoisonDuration = 0; // Duration left for receiving poison damage.
PoisonPeriod = 0; // How often poison damage is applied. (Every X tics.)

PoisonDamageReceived = 0; // Damage received per tic from poison.
PoisonDamageTypeReceived = 0; // Damage type received by poison.
PoisonDurationReceived = 0; // Duration left for receiving poison damage.
PoisonPeriodReceived = 0; // How often poison damage is applied. (Every X tics.)
Poisoner = 0; // Last source of received poison damage.
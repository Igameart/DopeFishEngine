/// @description  Initial settings

entVertBuffers = ds_map_build();

event_user(0);

sprSequence = [];
sprite = noone;
sprite_structure = noone;
sprFrameIndex = 0;
sprLastFrameIndex = -1;
seqStep = 0;
//sprFrames = 0;
state = noone;
stateName = "";
buff = noone;
tex = noone;

z = 0;

secZ = 0;
secColor = 255;

TexW = 0;
TexH = 0;
xOff = 0;
yOff = 0;

Sector=-1;
Mssect=-1;

thingType = -1;
thing = -1;

alarm[0] = 1;

shader = shd_Sprite;

u_spriteColor	= shader_get_uniform(shader,"u_spriteColorize");

u_fogColor		= shader_get_uniform(shader,"u_fogColor");
u_fogMinDist	= shader_get_uniform(shader,"u_fogMinDist");
u_fogMaxDist	= shader_get_uniform(shader,"u_fogMaxDist");

secL = 255;

entArtifact		= false;
entPickup		= false;
entWeapon		= false;
ISMONSTER		= false;
entObstacle		= false;
entGrounded		= true;
entDirectional	= false;
entAnimated		= false;
entInteruptAnim	= false;

entSpriteMap	= ds_map_build();

movedir		= 0;
Direction	= 0;
Angle	= 0;
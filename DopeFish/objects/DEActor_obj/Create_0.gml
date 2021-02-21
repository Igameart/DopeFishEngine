/// @description  Initial settings

entVertBuffers = ds_map_build();

sprFrameIndex = 0;
sprFrames = 0;
buff = noone;
tex = noone;

z = 0;

secZ = 0;
secColor = 255;

TexW = 0;
TexH = 0;
xOff = 0;
yOff = 0;

Msect=-1;
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
entMonster		= false;
entObstacle		= false;
entGrounded		= true;
entDirectional	= false;
entAnimated		= false;
entInteruptAnim	= false;
entSpriteMap	= ds_map_build();
entDirection	= random(360);
entAngle		= 0;

function flagHas(flags,str){
	//Is an Artifact
	if ds_list_find_index(flags,str)!=-1{
		return true;
	}else return false;
}

function parseClassDat(class){
	
	var flags = string_to_list(class);
	
	//Is an Artifact
	if flagHas(flags,"A"){
		entArtifact = true;
	}
	
	//Is a Pickup
	if flagHas(flags,"P"){
		entPickup = true;
	}
	
	//Is a Weapon
	if flagHas(flags,"W"){
		entWeapon = true;
	}
	
	//Is a Monster
	if flagHas(flags,"M"){
		entMonster = true;
	}
	
	//Is an Obstacle
	if flagHas(flags,"O"){
		entObstacle = true;
	}
	
	//Is Grounded
	if flagHas(flags,"^"){
		entGrounded = false;
	}
	
	ds_list_destroy(flags);
	
	
}
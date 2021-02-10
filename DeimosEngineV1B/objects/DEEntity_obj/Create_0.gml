/// @description  Initial settings

TexW = 1;
TexH = 1;

xOff = 0;
yOff = 0;

z = 0;

surf = noone;

secZ = 0;

Msect=-1;

thingType = -1;
thing = -1;

DESprite = noone;

alarm[0] = 1;

shader = shd_Sprite;

u_fogColor=shader_get_uniform(shader,"u_fogColor");
u_fogMinDist=shader_get_uniform(shader,"u_fogMinDist");
u_fogMaxDist=shader_get_uniform(shader,"u_fogMaxDist");

secL = 255;

entArtifact	= false;
entPickup	= false;
entWeapon	= false;
entMonster	= false;
entObstacle	= false;
entGrounded	= true;

function flagHas(flags,str){
	//Is an Artifact
	if ds_list_find_index(flags,str)!=-1{
		return true;
	}else return false;
}

function parseClassDat(class){
	
	var flags = string_to_list(class);
	
	//ds_list_print(flags);
	
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
/// @description 

age++;

visible = DE_checkPVS( DEcam.Subsector, Subsector );

if !visible exit;

if tics == -1 exit;

if ( tics <= 0 ){
	tics = state.tics;
	sprFrameIndex++;
	
	DE_SetMobjState(id,stateName);
	
	//we've reached the end of this sequence
	if ( sprFrameIndex >= array_length(sprSequence) ){
		sprFrameIndex = 0;
		seqStep++;
		//tics = 0;
	}		
	//trace("Actor Frame Advancing",tics,sprFrameIndex,array_length(sprSequence),sprSequence);

}

if array_length(sprSequence) == 0 exit;

if secL!=undefined{
	secColor = secL/255;
}

//If there's a callback, call it
//if ( state != noone)
//	if (state.action.acp1)		
//		state.action.acp1(id);


var __F = sprSequence[ 0 ];
var __A = "0";

__F = sprSequence[ sprFrameIndex ];
	
if __F == undefined __F = "";


var __sprNFO = wadSpriteDB[? sprite ];	
	
if __sprNFO.directional{
	DE_thingGetSpriteAngle();
	if wadSpritesDir[? sprite + __F ] != false
		__A = string(Angle);
	else __A = "1";
}
	
var __sprFrames = __sprNFO.frames;
var __sprName = __sprFrames[? __F+__A ];
sprite_structure = wadSprites[? __sprName ];
var __spr = entSpriteMap[? sprite + __F+__A ];
	
if __spr != undefined{
	
	sprite_index = __spr;
	
	tex = sprite_get_texture( sprite_index, 0 );
		
	buff = entVertBuffers[? sprite + __F+__A ];
	
}
		
tics -= (35/60);

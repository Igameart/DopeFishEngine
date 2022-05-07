/// @description 

age++;

visible = DE_checkPVS( DEcam.Subsector, Mssect );

if !visible exit;

if tics == -1 exit;

if array_length(sprSequence) == 0 exit;

if secL!=undefined{
	secColor = secL/255;
}

var __F = sprSequence[ 0 ];
var __A = "0";

__F = sprSequence[ floor(sprFrameIndex) ];
	
if __F == undefined __F = "";

var __sprNFO = wadSpriteDB[? sprite ];
var __sprFrames = __sprNFO.frames;
var __sprName = __sprFrames[? __F+__A ];
	
sprite_structure = wadSprites[? __sprName ];
	
if entDirectional{
	DE_thingGetSpriteAngle();
	if wadSpritesDir[? sprite + __F ] != false
		__A = string(Angle);
	else __A = "1";
}
	
var __spr = entSpriteMap[? __F+__A ];
	
if __spr != undefined{
	
	sprite_index = __spr;
	
	tex = sprite_get_texture( sprite_index, 0 );
	
	wScalar = nextPowTwo(1/texture_get_texel_width(tex));
	hScalar = nextPowTwo(1/texture_get_texel_height(tex));
	sRes = [ wScalar, hScalar ];
		
	buff = entVertBuffers[? __F+__A ];
	
}
		
sprFrameIndex += ( ( 35 / tics ) / 60 );

//we've reached the end of this sequence
if ( floor(sprFrameIndex) >= array_length(sprSequence) ){
	
	sprFrameIndex = 0;
	
}
/// @description 

visible = DE_checkPVS( DEcam.Mssect, Mssect );

if !visible exit;

//if __reject == 0 visible = true else visible = false;
//#endregion

if secL!=undefined{
	secColor = secL/255;
}

	
var __F = sprSequence[| 0 ];
var __A = "0";
	
__F = sprSequence[| floor(sprFrameIndex) ];
	
if __F == undefined __F = "";
	
if entDirectional{
	DE_thingGetSpriteAngle();
	if wadSpritesDir[? sprPrefix + __F ] != false
		__A = string(entAngle);
	else __A = "1";
}
	
var __spr = entSpriteMap[? __F+__A ];
	
if __spr != undefined{
	
	tex = sprite_get_texture( __spr, 0 );
		
	buff = entVertBuffers[? __F+__A ];
	
}
		
sprFrameIndex += (4/35);

if ( sprFrameIndex > sprFrames ) sprFrameIndex = 0;
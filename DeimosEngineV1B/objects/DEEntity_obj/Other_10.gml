/// @description

thing = DEThingType[thingType];

if !is_array(thing){
	trace("Thing Type Invalid");
	instance_destroy();
}else{

trace("Loading Thing Type:",thing);

name = thing[ DEThingDef.Description ];

sprPrefix = thing[ DEThingDef.Sprite ];
sprSequence = thing[ DEThingDef.Sequence ];
sprClass = thing[ DEThingDef.Class ];

parseClassDat(sprClass);

var num = 0;
do{
	
	sprName = sprPrefix + string_char_at(sprSequence,1) + string(num);

	//trace("Thing building sprite for "+name,sprName);

	var spriteDat = wadSprites[? sprName ];
	
	num++;

}until spriteDat != undefined || num> 8;

if spriteDat == undefined{
	num = 0;
do{
	
	sprName = sprPrefix + string_char_at(sprSequence,1) + string(num);

	trace("Thing building sprite for "+name,sprName);

	var spriteDat = wadSprites[? sprName ];
	
	num++;

}until spriteDat != undefined || num> 8;
}

if spriteDat != undefined{
	
	if DESprites[?sprName] == undefined{
		DESprite = DE_buildPatch(spriteDat);
		DESprites[?sprName] = DESprite;
	}else DESprite = DESprites[?sprName];

	TexW = spriteDat[? "width"];
	TexH = spriteDat[? "height"];
	xOff = spriteDat[? "o_left"];
	yOff = spriteDat[? "o_top"];
	
	trace("Added entity",sprName,TexW,TexH,xOff,yOff);
	
}

name = string_replace(name," ","\n");

draw_set_halign(fa_center);
draw_set_valign(fa_center);

if !surface_exists(surf){
	surf = surface_create(TexW*2,TexH*2);
	surface_set_target(surf);
	draw_clear(c_orange);
	draw_text_color(TexW,TexH,name,c_black,c_black,c_black,c_black,1);
	surface_reset_target();
}
}
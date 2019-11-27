/// @description

thing = DEThingType[thingType];

var name = thing[?"Description"];

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
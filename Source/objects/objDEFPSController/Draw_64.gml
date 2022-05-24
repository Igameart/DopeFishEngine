/// @description 

var filter = gpu_get_tex_filter();
gpu_set_tex_filter(false);
var ww,hh;

ww = surface_get_width(application_surface);
hh = surface_get_height(application_surface);

var ss = ww / 320;

var diff = ( (200*1.2) - (hh / ss) )*.833333;

//if sprite_exists(wep_spr)
//	draw_sprite_ext(wep_spr,0,0,(-diff*.75+bob)*ss,ss,ss*1.2,0,c_white,1);

DE_drawimage(wep_spr,0,0);

DE_drawStatusBar();

gpu_set_tex_filter(filter);

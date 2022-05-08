/// @description 
var ww,hh;

ww = surface_get_width(application_surface);
hh = surface_get_height(application_surface);

//surface_set_target(application_surface);

var _scale = 1;
if RFXenabled _scale *= RFXscale;

var ss = ww / 320;

draw_sprite_ext(wep_spr,0,0,0*_scale + bob,ss/_scale,ss/_scale,0,c_white,1);

draw_sprite_ext(stbar_spr,0,0,hh-32*ss/_scale,ss/_scale,ss/_scale,0,c_white,1);

//surface_reset_target();

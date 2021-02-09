
var w,h;

w = display_get_gui_width()*0+ surface_get_width(application_surface);
h = display_get_gui_height()*0+surface_get_height(application_surface);

//RFX_draw_surface(application_surface,0,0);

var _str = wad +": " + DEMap + "\nLoading time: "+string(time_taken)+"s.";

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(4,h-4,string_lower(_str));


gpu_set_tex_filter(true);
draw_sprite_ext(spr_DopeFishLogo,0,8,8,0.15,0.15,0,c_white,1);
gpu_set_tex_filter(false);
RFX_draw_surface(application_surface,0,0);



var w,h;

w = surface_get_width(application_surface);
h = surface_get_height(application_surface);

var _str = wad +": " + DEMap + "\nLoading time: "+string(time_taken)+"s.";

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(4,h-4,string_lower(_str));



gpu_set_tex_filter(true);
draw_sprite_ext(spr_DopeFishLogo,0,0,0,0.25,0.25,0,c_white,1);
gpu_set_tex_filter(false);
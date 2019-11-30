RFX_draw_surface(application_surface,0,0);

draw_sprite_ext(spr_DeimosLogo,0,0,0,1/RFXscale,1/RFXscale,0,c_white,1);

var w,h;

w = surface_get_width(application_surface);
h = surface_get_height(application_surface);

var _str = wad +": " + DEMap + "\nLoading time: "+string(time_taken)+"s.";

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(4,h-4,string_lower(_str));




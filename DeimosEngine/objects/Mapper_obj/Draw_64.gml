RFX_draw_surface(application_surface,0,0);

draw_sprite_ext(spr_deimLogo,0,0,0,1/RFXscale,1/RFXscale,0,c_white,1);

var w,h;

w = surface_get_width(application_surface);
h = surface_get_height(application_surface);

var _str = wad +": " + control_obj.MAP + "\nLoading time: "+string(time_taken/1000)+"s.";

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(c_maroon);
draw_text(4-1,h-4,(_str));
draw_text(4+1,h-4,(_str));
draw_text(4,h-4-1,(_str));
draw_text(4,h-4+1,(_str));
draw_set_color(c_white);
draw_text(4,h-4,(_str));

//draw_set_halign(fa_right);
//draw_text(w-4,h-4,("Current GL_SSECT: "+string(global.cssect)));


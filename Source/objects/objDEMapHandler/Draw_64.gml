var w,h;

w = surface_get_width(application_surface);
h = surface_get_height(application_surface);

var _str = wad +": " + DEMap + "\nLoading time: "+string(time_taken)+"s.";

var _scale = 1;
if RFXenabled _scale = RFXscale;

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text_transformed(4/_scale,h-4/_scale,string_lower(_str),1/_scale,1/_scale,0);


draw_sprite_ext(spr_DopeFishLogo,0,8/_scale,8/_scale,0.15/_scale,0.15/_scale,0,c_white,1);
gpu_set_tex_filter(DE_texFilter);

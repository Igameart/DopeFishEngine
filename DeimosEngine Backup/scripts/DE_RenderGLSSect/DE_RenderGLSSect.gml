
var _GLSSect = argument[0];

var glSSect = ds_list_find_value(mapGLSSects,_GLSSect);

if glSSect == undefined return false;

//ds_map_print(glSSect);
    
var vbuffer,ctex,ftex,ttex,sect,zadd,crushing;

ttex=0;

vbuffer = ds_map_find_value(glSSect,"vbuffer");

if vbuffer!=undefined{

	ftex = ds_map_find_value_fixed(glSSect,"tex_f");
	ctex = ds_map_find_value_fixed(glSSect,"tex_c");
	sect = ds_map_find_value(glSSect,"sector");
	
	zadd = 0;
	crushing = 0;
    
	if !is_undefined(sect){
	    var s = ds_list_find_value(mapSectors,sect);
	    zadd = ds_map_find_value(s,"lift");
	    crushing = ds_map_find_value(s,"crush");
	}
    
	shader_set_uniform_f(u_sectBotOff,zadd);
	shader_set_uniform_f(u_sectTopOff,crushing);
    
	if ctex!="-"{
	    ctex=ds_map_find_value(pload_flats,ctex);
	    if !is_undefined(ctex)
	    if sprite_exists(ctex)
	        texture_set_stage(shd_ctex,sprite_get_texture(ctex,0));
	}
	if ctex!="-"{
	ftex=ds_map_find_value(pload_flats,ftex);
	if !is_undefined(ftex)
	    if sprite_exists(ftex)
	    ttex=sprite_get_texture(ftex,0);
	}

	vertex_submit(vbuffer,pr_trianglelist,ttex);
	
}
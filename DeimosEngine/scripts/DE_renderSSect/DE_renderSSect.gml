
var sects = mapSectors;//ds_map_find_value_fixed(wad_levels,"sectors");

var ssect = argument[0];

var count,start,vbuffer,ctex,ftex,ttex,sect,zadd,crushing;
ttex=0;
//count = ds_map_find_value_fixed(ssect,"count");
//start = ds_map_find_value_fixed(ssect,"start");
vbuffer = ds_map_find_value_fixed(ssect,"vbuffer");

sect = ds_map_find_value(ssect,"sector");

zadd = 0;
crushing = 0;
    
if !is_undefined(sect){
    var s = ds_list_find_value(sects,sect);
    zadd = ds_map_find_value(s,"lift");
    crushing = ds_map_find_value(s,"crush");

	ftex = ds_map_find_value_fixed(s,"tex_f");
	ctex = ds_map_find_value_fixed(s,"tex_c");

    
	shader_set_uniform_f(u_sectBotOff,zadd);
	shader_set_uniform_f(u_sectTopOff,crushing);
    
	if ctex!="-"{
	    ctex=ds_map_find_value(pload_flats,ctex);
	    if !is_undefined(ctex)
	    if sprite_exists(ctex)
	        texture_set_stage(shd_ctex,sprite_get_texture(ctex,0));
	}

	if ftex!="-"{
		//trace(ftex)
	ftex=ds_map_find_value(pload_flats,ftex);
	if !is_undefined(ftex)
	    if sprite_exists(ftex)
	    ttex=sprite_get_texture(ftex,0);
	}

	vertex_submit(vbuffer,pr_trianglelist,ttex);
}
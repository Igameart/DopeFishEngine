function DE_renderSSect() {

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
			var tex = DE_getCompedFlat(ctex);
			texture_set_stage(shd_ctex,tex);
		}

		if ftex!="-"{
			ttex = DE_getCompedFlat(ftex);
		}
	
	
		vertex_submit(vbuffer,pr_trianglelist,ttex);
	}


}

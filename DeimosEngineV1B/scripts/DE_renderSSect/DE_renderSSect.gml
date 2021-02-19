function DE_renderSSect( __ssec ) {

	var sects = mapSectors;//ds_map_find_value_fixed(wad_levels,"sectors");
	
	var ssect = ds_list_find_value_fixed(mapGLSSects,__ssec);

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
		
		//trace("Drawing SSect",sect,"with textures:",ftex,ctex);

    
		shader_set_uniform_f(u_sectBotOff,zadd);
		shader_set_uniform_f(u_sectTopOff,crushing);
    
		if ctex!="-" && ctex != undefined{
			var tex = DE_getCompedFlat(ctex);
			texture_set_stage(shd_ctex,tex);
		}

		if ftex!="-" && ftex != undefined{
			ttex = DE_getCompedFlat(ftex);
		}
	
	
		vertex_submit(vbuffer,pr_trianglelist,ttex);
	}


}

function DE_segsOfSSect( __ssec ) {
	
	var ssect = ds_list_find_value_fixed(mapGLSSects,__ssec);

	var count,start;
	count = ds_map_find_value_fixed(ssect,"count");
	start = ds_map_find_value_fixed(ssect,"start");
	
	//var __segs = mapGLSegs;
	var __pos = start;
	repeat count{
		
		//var __seg = __segs[| __pos ];
		
		//if (__seg != undefined){
			DE_renderGLSeg( __pos );
		//}
		
		__pos++;
		
	}

}

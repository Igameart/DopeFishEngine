function DE_renderSSect( __ssec ) {

	var sects = mapSectors;//ds_map_find_value_fixed(wadlevel,"sectors");
	
	var ssect = ds_list_find_value_fixed(mapGLSSects,__ssec);

	var vbuffer,ctex,ftex,ttex,sect,zadd,crushing;
	ttex=0;
	
	vbuffer = ds_map_find_value_fixed(ssect,"vbuffer");

	sect = ds_map_find_value(ssect,"sector");

	zadd = 0;
	crushing = 0;
    
	if !is_undefined(sect){
		
	    var s = ds_list_find_value(sects,sect);
		
	    zadd = ds_map_find_value(s,"lift");
	    crushing = ds_map_find_value(s,"crush");

		ftex = ds_map_find_value(s,"tex_f");
		ctex = ds_map_find_value(s,"tex_c");
    
		shader_set_uniform_f(u_sectBotOff,zadd);
		shader_set_uniform_f(u_sectTopOff,crushing);

		if ftex!="-" && ftex != undefined{
			ttex = DE_getFlatTexture(ftex);
			
			if ttex == -1{
				ttex = sprite_get_texture(spr_empty,0);
				//trace("Floor flat does not exist for sector",sect,ftex);
			}
		}
    
		if ctex!="-" && ctex != undefined{
			var tex = DE_getFlatTexture(ctex);
			
			if tex == -1{
				tex = sprite_get_texture(spr_empty,0);
				//trace("Ceiling flat does not exist for sector",sect,ctex);
			}
				
			texture_set_stage(shd_ctex,tex);
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

function DE_PvisGLsegsOfSSect( __ssec, __list ) {

	var count,start;
	count = ds_map_find_value_fixed(__ssec,"count");
	start = ds_map_find_value_fixed(__ssec,"start");
	
	var __pos = start;
	repeat count{
		
		var seg = mapGLSegs[| __pos ];

		var l = seg[?"linedef"];

		if l != 65535 ds_list_add(__list,__pos);
		
		__pos++;
		
	}

}

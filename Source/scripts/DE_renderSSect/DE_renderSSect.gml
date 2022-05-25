function DE_renderSSect( __ssec ) {

	var sects = mapSectors;//ds_map_find_value_fixed(wadlevel,"sectors");
	
	var ssect = ds_list_find_value(mapGLSSects,__ssec);
	
	//if !is_struct(ssect) return;

	var vbuffer,ctex,ftex,tex,sect,zadd,crushing;
	ttex=0;
	
	vbuffer = ssect.vbuffer;

	sect = ssect.sector;

	zadd = 0;
	crushing = 0;
    
	if !is_undefined(sect){
		
	    var s = ds_list_find_value(sects,sect);
		
	    zadd = (s.lift);
	    crushing = (s.crush);

		ftex = (s.floorpicnum);
		ctex = (s.ceilingpicnum);
    
		shader_set_uniform_f(u_sectBotOff,zadd);
		shader_set_uniform_f(u_sectTopOff,crushing);

		if ftex!="-" && ftex != undefined{
			tex = DE_getFlatTexture(ftex);
			if tex != -1{
				tex = tex.images;
				if is_struct(tex){
					shader_set_uniform_f(u_sectFloorTex,(tex.left+1),(tex.top+1),(64),(64));
				}
			}
		}
    
		if ctex!="-" && ctex != undefined{
			tex = DE_getFlatTexture(ctex);
			if tex != -1{
				tex = tex.images;
				if is_struct(tex){
					shader_set_uniform_f(u_sectCeilTex,(tex.left+1),(tex.top+1),(64),(64));
				}
			}
		}
		vertex_submit(vbuffer,pr_trianglelist,tFlats);
	}


}

function DE_segsOfSSect( __ssec ) {
	
	var ssect = ds_list_find_value_fixed(mapGLSSects,__ssec);

	var count,start;
	count = (ssect.count);
	start = (ssect.start);
	
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
	count = (__ssec.count);
	start = (__ssec.start);
	
	var __pos = start;
	repeat count{
		
		var seg = mapGLSegs[| __pos ];

		var l = seg.linedef;

		if l != 65535 ds_list_add(__list,__pos);
		
		__pos++;
		
	}

}

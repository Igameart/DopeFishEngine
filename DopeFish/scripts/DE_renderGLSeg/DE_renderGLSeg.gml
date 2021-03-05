function DE_renderGLSeg(j) {
	
	//CHRIS:
	//Perhaps only do these checks for segs tagged as dynamic, cut back on all the calculations needed to be done for each seg being drawn
	//Also check to see if some of this stuff can be condensed

	var segs = mapGLSegs;	
	var lines = mapLinedefs;
	var sects = mapSectors;	
	var sides = mapSidedefs;

	var seg = segs[| j ];

	var l = seg.linedef;

	if l = 65535 return;

	var linedef = ds_list_find_value(lines,l);
	
	/**/
	var verts = mapVertexes;
	var gverts = mapGLVerts;
	var startv,endv;

	startv = seg.startv;
	endv = seg.endv;
	
	var sx,sy,ex,ey,vert,vcheck;
	vcheck=verts;
	if(startv&VERT_IS_GL){
	    startv=startv&~VERT_IS_GL;
	    vcheck=gverts;
	}
    
	vert=ds_list_find_value(vcheck,startv);
	sx = (vert.x);
	sy = (vert.y);
    
	vcheck=verts;
	if(endv&VERT_IS_GL){
	    endv=endv&~VERT_IS_GL;
	    vcheck=gverts;
	}
    
	vert=ds_list_find_value(vcheck,endv);
	ex = (vert.x);
	ey = (vert.y);
    
	if !is_clockwise(sx,sy,ex,ey,DEcam.x,DEcam.y) return;
	/**/

	var lSides = ["right","left"];
	var s = lSides[ seg.side ];
	
	switch s{
		case "right": s = linedef.right; break;
		case "left":  s = linedef.left; break;
	}
		
	if ( s != -1 ){
		var side = sides[| s ];
	
		//trace("NOTICE: Looking For Sidedef:",s,string(side));
		var flags = linedef.flags;
    
		var s = side.sector;
		s = ds_list_find_value(sects,s);
            
		var bs = lSides[! seg.side];
	
		switch bs{
			case "right": bs = linedef.right; break;
			case "left":  bs = linedef.left; break;
		}
		
		if (bs!=-1){
			var bside = ds_list_find_value(sides,bs);
			var b=(bside.sector);
			b = ds_list_find_value_fixed(sects,b);
			var crushing = (b.crush);
			shader_set_uniform_f(u_upBotOff,crushing);
			zadd = (b.lift);
			shader_set_uniform_f(u_lowTopOff,zadd);
		}
		

		var zadd = (s.lift);
    
		shader_set_uniform_f(u_midBotOff,zadd);
    
		shader_set_uniform_f(u_lowBotOff,zadd);
    
        
		crushing = (s.crush);
		shader_set_uniform_f(u_midTopOff,crushing);
    
		shader_set_uniform_f(u_upTopOff,crushing);
    
		var val=(flags.peglower);
	
		if is_real(val)
		shader_set_uniform_f(u_LowPeg,val);
    
		val=(flags.pegupper);
	
		if is_real(val)
		shader_set_uniform_f(u_UpPeg,val);
    

		var vbuffer	= (seg.vbuffer);
		
		if vbuffer == undefined {trace("NOTICE: Seg Buffer Undefined",seg); return;}
		
		var lowtex	= (side.lowtex);
		var uptex	= (side.uptex);
		var midtex	= (side.midtex);
    
    
		if lowtex!="-" or uptex!="-" or midtex!="-"{
        
		    var vlowtex	= ds_map_find_value(pload_tex,lowtex);
		    var vuptex	= ds_map_find_value(pload_tex,uptex);
		    var vmidtex	= ds_map_find_value(pload_tex,midtex);
        
		    if is_undefined(vmidtex){
		        vmidtex = [0,0,0];
		    }else{
		        shader_set_uniform_f(u_TexHM,sprite_get_height(vmidtex[0]));
		    }
        
		    if !is_undefined(vlowtex){
						
		        if sprite_exists(vlowtex[0]){
								
		            shader_set_uniform_f(u_TexHL,sprite_get_height(vlowtex[0]));
				
					shader_set_uniform_f(shd_uLuv,vlowtex[1],vlowtex[2]);
			
					var tex = DE_getCompedTexture(lowtex);
				
		            texture_set_stage(shd_ltex,tex);
				
		        }
			
		    }else texture_set_stage(shd_ltex,0);
        
		    if !is_undefined(vuptex){
			
		        if sprite_exists(vuptex[0]){
								
		            shader_set_uniform_f(u_TexHU,sprite_get_height(vuptex[0]));
				
					shader_set_uniform_f(shd_uUuv,vuptex[1],vuptex[2]);
			
					var tex = DE_getCompedTexture(uptex);
				
		            texture_set_stage(shd_utex,tex);
				
		        }
            
		    }else texture_set_stage(shd_utex,0);
			
				shader_set_uniform_f(shd_uMuv,vmidtex[1],vmidtex[2]);
			
				var tex = DE_getCompedTexture(midtex);
			
				vertex_submit(vbuffer,pr_trianglelist,tex);
		}
	}

}

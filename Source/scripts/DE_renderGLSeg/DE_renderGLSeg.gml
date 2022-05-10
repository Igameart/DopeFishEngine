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
	
		var flags = linedef.flags;
    
		var s = side.sector;
		s = ds_list_find_value(sects,s);
            
		var bs = lSides[! seg.side];
	
		switch bs{
			case "right": bs = linedef.right; break;
			case "left":  bs = linedef.left; break;
		}
		
		var _blift = 0;
		var _bcrush = 0;
		
		if (bs!=-1){
			var bside = ds_list_find_value(sides,bs);
			var b=(bside.sector);
			b = ds_list_find_value_fixed(sects,b);
			_bcrush = (b.crush);
			_blift = (b.lift);
		}
		
		

		var _slift = (s.lift);
		var _scrush = (s.crush);
		
		shader_set_uniform_f(u_upOff,_bcrush,_scrush);
		//shader_set_uniform_f(u_upTopOff,scrush);
		
		shader_set_uniform_f(u_lowOff,_slift,_blift);
		//shader_set_uniform_f(u_lowTopOff,_blift);
		
		shader_set_uniform_f(u_midOff,_slift,_scrush);
		//shader_set_uniform_f(u_midTopOff,scrush);
		
    
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
        
		    var vlowtex	= pload_tex[? lowtex];
		    var vuptex	= pload_tex[? uptex ];
		    var vmidtex	= pload_tex[? midtex];
        
		    if !is_undefined(vmidtex) && vmidtex != -1{
				var tex = vmidtex.images;
				if is_struct(tex){
					shader_set_uniform_f(shd_mtex,(tex.left+1),(tex.top+1),(tex.width-2),(tex.height-2));
			        shader_set_uniform_f(u_TexHM,tex.height-2);
				}
		    }
        
		    if !is_undefined(vlowtex) && vlowtex != -1{
				var tex = vlowtex.images;
				if is_struct(tex){
					shader_set_uniform_f(shd_ltex,(tex.left+1),(tex.top+1),(tex.width-2),(tex.height-2));
					shader_set_uniform_f(u_TexHL,tex.height-2);
				}
		    }
        
		    if !is_undefined(vuptex) && vuptex != -1{				
				var tex = vuptex.images;
				if is_struct(tex){
					shader_set_uniform_f(shd_utex,(tex.left+1),(tex.top+1),(tex.width-2),(tex.height-2));
					shader_set_uniform_f(u_TexHU,tex.height-2);
				}
		    }
			
			vertex_submit(vbuffer,pr_trianglelist, tTextures );
		}
	}

}

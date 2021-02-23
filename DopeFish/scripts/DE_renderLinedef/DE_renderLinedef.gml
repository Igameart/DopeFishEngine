function DE_renderLinedef() {
	var j = argument[0];

	var lines = ds_map_find_value_fixed(wadlevel,"linedefs");
	var sects = ds_map_find_value_fixed(wadlevel,"sectors");

	var sides = ds_map_find_value_fixed(wadlevel,"sidedefs");
	var side = ds_list_find_value_fixed(sides,j);

	var l = ds_map_find_value_fixed(side,"linedef");

	if l = 65535 return;

	l = ds_list_find_value_fixed(lines,l);
	
	/**/
	var start_,end_;
	//Determine what side of linedef is this side
	if l[?"left"] == j{
		start_ = l[?"start"];
		end_ = l[?"end"];
	}else{
		start_ = l[?"end"];
		end_ = l[?"start"];		
	}
	
	var x1,y1,x2,y2;
	start_ = mapVertexes[|start_];
	end_ = mapVertexes[|end_];
	
	x1 = start_[?"x"];
	y1 = start_[?"y"];
	
	x2 = end_[?"x"];
	y2 = end_[?"y"];
	
	//Let's only draw if on the correct side of the linedef
		if is_clockwise(x1,y1,x2,y2,DEcam.x,DEcam.y) return;

	/* */
	
	
	var flags = ds_map_find_value_fixed(l,"flags");
    
	var s=ds_map_find_value(side,"sector");
	var b=ds_map_find_value(side,"bsect");
	s = ds_list_find_value(sects,s);
	b = ds_list_find_value(sects,b);
	var zadd = ds_map_find_value(s,"lift");
    
	shader_set_uniform_f(u_midBotOff,zadd);
	var crushing = ds_map_find_value(b,"crush");
    
	shader_set_uniform_f(u_lowBotOff,zadd);
	shader_set_uniform_f(u_upBotOff,crushing);
    
	zadd = ds_map_find_value(b,"lift");
	shader_set_uniform_f(u_lowTopOff,zadd);
        
	crushing = ds_map_find_value(s,"crush");
	shader_set_uniform_f(u_midTopOff,crushing);
    
	shader_set_uniform_f(u_upTopOff,crushing);
    
	var val=ds_map_find_value_fixed(flags,"peglower");
	if is_real(val)
	shader_set_uniform_f(u_LowPeg,val);
    
	val=ds_map_find_value_fixed(flags,"pegupper");
	if is_real(val)
	shader_set_uniform_f(u_UpPeg,val);
    

	var vbuffer=ds_map_find_value_fixed(side,"vbuffer");
	var tex_l=ds_map_find_value_fixed(side,"tex_l");
	var tex_u=ds_map_find_value_fixed(side,"tex_u");
	var tex_m=ds_map_find_value_fixed(side,"tex_m");
    
    
	if tex_l!="-" or tex_u!="-" or tex_m!="-"{
        
	    var vtex_l=ds_map_find_value(pload_tex,tex_l);
	    var vtex_u=ds_map_find_value(pload_tex,tex_u);
	    var vtex_m=ds_map_find_value(pload_tex,tex_m);
        
	    if is_undefined(vtex_m){
	        vtex_m = [0,0,0];
	    }else{
	        shader_set_uniform_f(u_TexHM,sprite_get_height(vtex_m[0]));
	    }
        
	    if !is_undefined(vtex_l){
			
			//trace("Rendering Lower Texture: "+tex_l,vtex_l);
			
	        if sprite_exists(vtex_l[0]){
								
	            shader_set_uniform_f(u_TexHL,sprite_get_height(vtex_l[0]));
				
				shader_set_uniform_f(shd_uLuv,vtex_l[1],vtex_l[2]);
				
	            texture_set_stage(shd_ltex,sprite_get_texture(vtex_l[0],0));
				
	        }
			
	    }else texture_set_stage(shd_ltex,0);
        
	    if !is_undefined(vtex_u){
			
			//trace("Rendering Upper Texture: "+tex_u,vtex_u);
			
	        if sprite_exists(vtex_u[0]){
								
	            shader_set_uniform_f(u_TexHU,sprite_get_height(vtex_u[0]));
				
				shader_set_uniform_f(shd_uUuv,vtex_u[1],vtex_u[2]);
				
	            texture_set_stage(shd_utex,sprite_get_texture(vtex_u[0],0));
				
	        }
            
	    }else texture_set_stage(shd_utex,0);
        
		//if sprite_exists(vtex_m[0]){
			
			shader_set_uniform_f(shd_uMuv,vtex_m[1],vtex_m[2]);
			
			vertex_submit(vbuffer,pr_trianglelist,sprite_get_texture(vtex_m[0],0));
			
		//}
	}


}

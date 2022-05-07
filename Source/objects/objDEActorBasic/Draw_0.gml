/// @description  Draw the right surface

//if sprite != "none"{	
	
	shader_set(shader);
		
	shader_set_uniform_f(u_spriteColor,secColor,secColor,secColor);
	shader_set_uniform_f_array(uRes,sRes);
	
	with DEcam{
		shader_set_uniform_f(other.u_fogColor,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
		shader_set_uniform_f(other.u_fogMaxDist,f_far);
		shader_set_uniform_f(other.u_fogMinDist,f_near);
	}
	
	d3d_transform_add_translation( x, y, z );
		
	var __oldrep = gpu_get_texrepeat();
	gpu_set_texrepeat(false)
		
	if buff !=noone vertex_submit(buff,pr_trianglefan,tex);
		
	gpu_set_texrepeat(__oldrep);
	
	d3d_transform_set_identity();

	shader_reset();
	
	d3d_transform_set_transform( x, y, z, 90, 90-DEcam.yaw,0);
	/*
	if is_struct(sprite_structure){
	
		var TexW = sprite_structure.width;
		var TexH = sprite_structure.height;
		var xOff = sprite_structure.leftoff;
		var yOff = sprite_structure.topoff;
	
		yOff = max(yOff, sprite_get_height(sprite_index) );
	
		var x1,z1,x2,z2;
	
		x1 = (TexW-xOff);
		x2 = x1-TexW;
		z1 = TexH-yOff;
		z2 = z1 - TexH;
	
		draw_rectangle_color(x1,z1,x2,z2,c_orange,c_orange,c_yellow,c_yellow,true);
	}
	
	draw_line_width_color(0,0,0,-64,2,c_orange,c_lime);*/
	
	d3d_transform_set_identity();
	
//}//else instance_destroy();
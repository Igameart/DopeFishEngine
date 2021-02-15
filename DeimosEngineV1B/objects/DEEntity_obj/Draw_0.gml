/// @description  Draw the right surface

//CHRIS: Move frame/sprite picking into a custom event called only when a frame index or animation sequence changes!

if sprPrefix != "none"{	
	
	shader_set(shader);
	
	
	
	shader_set_uniform_f(u_spriteColor,secColor,secColor,secColor);
	
	with DEcam{
		shader_set_uniform_f(other.u_fogColor,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
		shader_set_uniform_f(other.u_fogMaxDist,f_far);
		shader_set_uniform_f(other.u_fogMinDist,f_near);
	}
	
	d3d_transform_add_translation( x, y, z );
		
	var __oldrep = gpu_get_texrepeat();
	gpu_set_texrepeat(false)
		
	if buff!= noone vertex_submit(buff,pr_trianglefan,tex);
		
	gpu_set_texrepeat(__oldrep);

	shader_reset();
	
	d3d_transform_set_identity();
	
}else instance_destroy();
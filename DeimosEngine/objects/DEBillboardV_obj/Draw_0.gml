/// @description  Draw the right surface
if DESprite!=noone{
	
	if secL!=undefined
		draw_set_color(make_color_hsv(255,0,secL));
	else draw_set_color(c_white);
	
	shader_set(shader);
	
	with DEcam{
		shader_set_uniform_f(other.u_fogColor,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
		shader_set_uniform_f(other.u_fogMaxDist,f_far*0.9);
		shader_set_uniform_f(other.u_fogMinDist,f_near);
	}
	
	d3d_transform_add_translation(-xOff,0,0);
	d3d_transform_add_rotation_z(90+DEcam.yaw);
	d3d_transform_add_translation(x,y,secZ);

	var tex = sprite_get_texture(DESprite,0);

	d3d_draw_wall(TexW,0,TexH,0,0,0,tex,1,1);
	
	d3d_transform_set_identity();

	shader_reset();
}
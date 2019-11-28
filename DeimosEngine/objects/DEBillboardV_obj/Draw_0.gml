/// @description  Draw the right surface
if DESprite!=noone{
	
	//d3d_set_zwriteenable(false);
	d3d_transform_add_translation(-xOff,0,0);
	d3d_transform_add_rotation_z(90+DEcam.yaw);
	d3d_transform_add_translation(x,y,secZ);

	var tex = sprite_get_texture(DESprite,0);

	d3d_draw_wall(TexW,0,TexH,0,0,0,tex,1,1);

	//draw_sprite(DESprite,0,0,0);

	//d3d_set_zwriteenable(true);
	d3d_transform_set_identity();


}
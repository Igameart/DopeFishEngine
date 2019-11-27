/// @description  Draw the right surface

if !surface_exists(surf){
	surf = surface_create(32,32);
	surface_set_target(surf);
	draw_clear(c_orange);
	surface_reset_target();
}

d3d_set_zwriteenable(false);
d3d_transform_add_translation(-xOff,0,0);
d3d_transform_add_rotation_z(90+Mapper_obj.yaw);
d3d_transform_add_translation(x,y,secZ);
var tex = surface_get_texture(surf);
d3d_draw_wall(0,0,0,TexW,0,TexH,tex,1,1);
d3d_set_zwriteenable(true);
d3d_transform_set_identity();


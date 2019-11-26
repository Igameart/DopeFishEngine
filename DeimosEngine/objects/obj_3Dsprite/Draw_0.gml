/// @description  Draw the right surface
d3d_set_zwriteenable(false);
d3d_transform_add_rotation_z(90+obj_camera.direction);
//d3d_transform_add_scaling(1,1,-1);
d3d_transform_add_translation(x,y,z);
var tex = surface_get_texture(generator.frame[current]);
d3d_draw_wall(-w/2,0,-h/2,w/2,0,h/2,tex,1,1);
d3d_set_zwriteenable(true);
d3d_transform_set_identity();

current = (current+1) mod no_frames;


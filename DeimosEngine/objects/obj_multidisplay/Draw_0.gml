/// @description  Draw all surfaces
d3d_set_zwriteenable(false);

var i = 0;
repeat (count) {
    //d3d_transform_add_scaling(1,1,-1);
    d3d_transform_set_rotation_z(90+obj_camera.direction);
    d3d_transform_add_translation(bb_x[i],bb_y[i],bb_z[i]);
    var tex = surface_get_texture(generator.frame[current[i]]);
    d3d_draw_wall(-generator.w/2,0,-generator.h/2,generator.w/2,0,generator.h/2,tex,1,1);
    
    current[i] = (current[i]+1) mod no_frames;
    i++;
}

d3d_transform_set_identity();
d3d_set_zwriteenable(true);


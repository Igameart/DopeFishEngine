/// @description  Renders the no_frames next frames
/*  Arguments: none
 *
 *  Returns: none
 *
 *  Remarks: to be called as an instance method of obj_generator
 *
 */
repeat(no_frames) {
    part_system_update(sys);
    
    surface_set_target(frame[current]);
    
    d3d_set_projection_ortho(0,0,w,h,0);
    d3d_transform_set_identity();
    draw_clear_alpha(c_white,0);
    
    part_system_drawit(sys);
    
    count[current] = part_particles_count(sys);
    
    surface_reset_target();
    
    current = (current+1) mod no_frames;
}
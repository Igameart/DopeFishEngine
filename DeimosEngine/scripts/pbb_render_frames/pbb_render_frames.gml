/// @description  Render no_frames next frames using the shader version
/*  Arguments: none
 *
 *  Returns: none
 *
 *  Remarks: to be called as an instance method of obj_pbb_gen_disp
 *
 */
repeat (no_frames) {
    surface_set_target(sf);
    
    d3d_set_projection_ortho(0,0,w,h,0);
    d3d_transform_stack_push();
    d3d_transform_set_identity();
    
    draw_clear_alpha(c_white,0);
    
    part_system_update(sys);    // Don't forget to update the system!
    part_system_drawit(sys);
    
    surface_reset_target();
    
    // surface_copy_part() works just fine for this!
    // Note that, for some reason, you need to set the render target to sf_billboards...
    surface_set_target(sf_billboards);
    
    var x_index = current div row_count;
    var y_index = current mod row_count;
    
    surface_copy_part(sf_billboards,x_index*w,y_index*w,sf,0,0,w,h);
    
    d3d_transform_stack_pop();
    
    surface_reset_target();
    
    current = (current+1) mod no_frames;
}
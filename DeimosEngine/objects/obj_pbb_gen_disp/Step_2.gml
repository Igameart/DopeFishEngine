/// @description  Update current frame
if (!surface_exists(sf)) {
    sf = surface_create(w,h);   // Small problem, simply recreate surface
}
surface_set_target(sf);

d3d_set_projection_ortho(0,0,w,h,0);
d3d_transform_stack_push();
d3d_transform_set_identity();

draw_clear_alpha(c_white,0);

part_system_drawit(sys);

d3d_transform_stack_pop();

surface_reset_target();

if (!surface_exists(sf_billboards)) {
    // Big problem => all frames lost
    sf_billboards = surface_create(tex_size,tex_size);  // That's that already...
    pbb_render_frames();
} else {
    // surface_copy_part() works fine for this!
    // Note that, for some reason, you need to set the render target to sf_billboards...
    surface_set_target(sf_billboards);
    
    var x_index = current div row_count;
    var y_index = current mod row_count;
    
    surface_copy_part(sf_billboards,x_index*w,y_index*w,sf,0,0,w,h);
    //draw_surface_part(sf,0,0,128,128,0,0);   // HTML5?
    
    surface_reset_target();
}

current = (current+1) mod no_frames;

/// Post-update debug stuff
count[cur_prev] = part_particles_count(sys);    //cur_prev!

disp_particles_count = 0;
for(var i = 0;i < array_length_1d(dbg_offset);i++) {
    var frame_index = (dbg_offset[i] + cur_prev) mod no_frames;
    disp_particles_count += count[frame_index];
}

/// Visibility check
visible = (buffer != -1);


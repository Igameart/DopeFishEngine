/// @description  Update current frame
if (!surface_exists(frame[current])) {
    // Assume worst-case: re-create and re-render all frames
    create_all_frames();
    render_all_frames();
    exit;   // Skip this iteration since all frames have been rendered already
}
surface_set_target(frame[current]);

d3d_set_projection_ortho(0,0,w,h,0);
d3d_transform_set_identity();
draw_clear_alpha(c_white,0);

part_system_drawit(sys);

count[current] = part_particles_count(sys);  // Keep track of particle count

surface_reset_target();

current = (current+1) mod no_frames;


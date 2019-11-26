/// @description  Create array of surfaces
no_frames = 120;    // Number of frames, more frames = more variation

w = 128;            // Surface and display dimensions
h = w;

create_all_frames();// Create all frames

current = 0;        // Current frame index

/// Provide a particle system
sys = part_system_create();

/// Set the right draw color (c_white)!
draw_set_color(c_white);


/// @description  Initialize variables & resources
// TODO: rectangular frame dimensions
no_frames = 64;     // Number of frames, must be square e.g. 8^2, 4^2

//show_debug_message(ceil(log2(no_frames)));
//sqrt(power(2,ceil(log2(no_frames)))); // Hmm.. => WIP

w = 128;            // Frame dimensions, currently square
h = w;

sf_billboards = -1;             // Initialize surface
pbb_create_frames();

sf = surface_create(w,h);       // Temporary surface for single frame

sys = part_system_create();     // Provide a particle system

part_system_automatic_draw(sys,false);  // Manual redraw and update
part_system_automatic_update(sys,false);

update_interval = 1;            // Particle system update interval
alarm[0] = update_interval;

angle = 0;                      // Billboard orientation angle (deg)

buffer = vertex_create_buffer();// Initialize vertex buffer

/// Initialize debug functionality
cur_prev = current; // Most recently rendered frame index

// Keep track of particle count on each image
for(var i = 0;i < no_frames;i++) {
    count[i] = 0;
}

// Keep track of frame offsets per display
dbg_offset = 0;

// Total displayed number of particles
disp_particles_count = 0;


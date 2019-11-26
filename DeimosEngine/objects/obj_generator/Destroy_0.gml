/// @description  Free all surfaces
for (var i = 0;i < no_frames;i++) {
    if (surface_exists(frame[i]))
        surface_free(frame[i]);
}

frame = 0;  // Free arrays
count = 0;

/// Destroy particle system
part_system_destroy(sys);


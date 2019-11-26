/// @description  Create all frames
/*  Arguments: none
 *
 *  Returns: none
 *
 *  Remarks: to be called as an instance method of obj_generator
 *
 */
for (var i = 0;i < no_frames;i++) {
    frame[i] = surface_create(w,h);
    count[i] = 0;   // Keep track of number of particles on surface
}
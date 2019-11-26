/// @description  This script creates the surface that contains the frames
/*  Arguments: none
 *
 *  Returns: none
 *
 *  Remarks: to be called as an instance method of obj_pbb_gen_disp
 *
 *  Usage: pbb_create_frames()
 *
 */
row_count = sqrt(no_frames);    // Number of frames in a row
    
tex_size = row_count * w;       // Texture size, currently square

current = 0;                    // Current frame index

if (surface_exists(sf_billboards)) surface_free(sf_billboards);
sf_billboards = surface_create(tex_size,tex_size);  // All frames
/// @description  This script resizes the size of and number of frames generated
/*  Arguments: 0. frame width (real)
 *             1. frame height (real)
 *             2. number of frames (real, integer)
 *
 *  Returns: none
 *
 *  Remarks: * to leave a value unchanged, enter the existing value
 *             e.g. pbb_resize_frames(w,h,no_frames) gives no change
 *           * instantly re-renders all frames
 *
 *  Usage: pbb_resize_frames(new_width,new_height,new_no_frames)
 *
 */
w = argument0;
h = argument1;
no_frames = argument2;

pbb_create_frames();        // Recreate frames surface
    
pbb_render_frames();        // Re-render all frames
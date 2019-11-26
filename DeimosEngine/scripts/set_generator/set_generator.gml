/// @description  This script sets the particle generator for the current display
/*  Arguments: 0. generator ID
 *
 *  Returns: none
 *
 *  Remarks: * to be called as an instance method of obj_display
 *           * the starting frame is chosen randomly
 *
 *  Usage: set_generator(generator)
 *
 */

generator = argument0;
no_frames = generator.no_frames;
current = irandom(no_frames-1);
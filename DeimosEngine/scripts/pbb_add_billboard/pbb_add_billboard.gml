/// @description  Add a single billboard to the given vertex buffer
/*  Arguments: 0. billboard width (real)
 *             1. billboard height (real)
 *             2. frame offset (real, integer)
 *             3. x (real)
 *             4. y (real)
 *             5. z (real)
 *
 *  Returns: none
 *
 *  Remarks: to be called as an instance method of obj_pbb_gen_disp
 *
 */

vertex_position_3d(buffer,0,0,-argument1/2);         // Triangle 1
vertex_normal(buffer,argument3,argument4,argument5);
vertex_texcoord(buffer,0,0);
vertex_float1(buffer,argument2);

vertex_position_3d(buffer,argument0/2,0,-argument1/2);
vertex_normal(buffer,argument3,argument4,argument5);
vertex_texcoord(buffer,1,0);
vertex_float1(buffer,argument2);

vertex_position_3d(buffer,argument0/2,0,argument1/2);
vertex_normal(buffer,argument3,argument4,argument5);
vertex_texcoord(buffer,1,1);
vertex_float1(buffer,argument2);

vertex_position_3d(buffer,0,0,-argument1/2);         // Triangle 2
vertex_normal(buffer,argument3,argument4,argument5);
vertex_texcoord(buffer,0,0);
vertex_float1(buffer,argument2);

vertex_position_3d(buffer,argument0/2,0,argument1/2);
vertex_normal(buffer,argument3,argument4,argument5);
vertex_texcoord(buffer,1,1);
vertex_float1(buffer,argument2);

vertex_position_3d(buffer,0,0,argument1/2);
vertex_normal(buffer,argument3,argument4,argument5);
vertex_texcoord(buffer,0,1);
vertex_float1(buffer,argument2);

var index = array_length_1d(dbg_offset);            // Debug info
dbg_offset[index] = argument2;
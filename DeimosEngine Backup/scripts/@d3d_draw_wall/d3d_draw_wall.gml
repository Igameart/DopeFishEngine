/// @description Draws a simple 3D vertical wall.
/// @param x1 The initial x coordinate of the wall.
/// @param y1 The initial y coordinate of the wall.
/// @param z1 The initial z coordinate of the wall.
/// @param x2 The opposite x coordinate of the wall.
/// @param y2 The opposite y coordinate of the wall. 
/// @param z2 The opposite z coordinate of the wall.
/// @param tex The id of the texture to use (-1 for no texture)
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.
/// @returns 

//var ret = global.__d3d;
//global.__d3d = false;
//return ret;

var __x1 = argument0;
var __y1 = argument1;
var __z1 = argument2;
var __x2 = argument3;
var __y2 = argument4;
var __z2 = argument5;
var __tex = argument6;
var __hrepeat = argument7;
var __vrepeat = argument8;

var __xdiff = __x2 - __x1;
var __ydiff = __y2 - __y1;

var __lsquared = (__xdiff * __xdiff) + (__ydiff * __ydiff);
if (__lsquared == 0)
	return 0;
	
var __l = sqrt(__lsquared);

var __nx = __ydiff / __l;
var __ny = -__xdiff / __l;

var __oldrep = gpu_get_texrepeat();
gpu_set_texrepeat(true)	

d3d_primitive_begin_texture(pr_trianglefan, __tex);

d3d_vertex_normal_texture(__x1, __y1, __z1, __nx, __ny, 0, 0, 0);
d3d_vertex_normal_texture(__x2, __y2, __z1, __nx, __ny, 0, __hrepeat, 0);
d3d_vertex_normal_texture(__x2, __y2, __z2, __nx, __ny, 0, __hrepeat, __vrepeat);
d3d_vertex_normal_texture(__x1, __y1, __z2, __nx, __ny, 0, 0, __vrepeat);

d3d_primitive_end();

gpu_set_texrepeat(__oldrep);
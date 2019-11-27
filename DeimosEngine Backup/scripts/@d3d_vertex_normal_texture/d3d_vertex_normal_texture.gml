/// @description d3d - Defines a vertex for a textured primitive in 3D along with its corresponding normal.
/// @param x the x position
/// @param y the y position
/// @param z the z position
/// @param nx the normal x
/// @param ny the normal y
/// @param nz the normal z
/// @param u the normal u
/// @param v the normal v

vertex_position_3d( global.__d3dPrimBuffer, argument0, argument1, argument2 );
vertex_normal( global.__d3dPrimBuffer, argument3, argument4, argument5 );
vertex_colour( global.__d3dPrimBuffer, draw_get_colour(), draw_get_alpha() );
vertex_texcoord( global.__d3dPrimBuffer, (argument6 * global.__d3dPrimTexW) + global.__d3dPrimTexX, (argument7 * global.__d3dPrimTexH) + global.__d3dPrimTexY );
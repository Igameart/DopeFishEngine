/// @description DE_vertexNormal(buffer, x, y, z, nx, ny, nz, u,v, col, alpha,texture index,middle?)
/// @param buffer
/// @param  x
/// @param  y
/// @param  z
/// @param  nx
/// @param  ny
/// @param  nz
/// @param  u
/// @param v
/// @param  col
/// @param  alpha
/// @param texture index
/// @param middle?
function DE_vertexNormal(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {
	vertex_position_3d(argument0,argument1,argument2,argument3);
	vertex_normal(argument0,argument4,argument5,argument6);
	vertex_texcoord(argument0,real(argument7),real(argument8));
	vertex_colour(argument0,argument9,argument10);
	vertex_texcoord(argument0,real(argument11),real(argument12));



}

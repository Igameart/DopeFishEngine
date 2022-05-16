/// @description DE_vertexGLSS(buffer, x, y, z, nx, ny, nz, u,v, col, alpha,texture index, Top?)
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
/// @param  Top?
function DE_vertexGLSS(buffer, xx, yy, zz, nx, ny, nz, u, v, color, alpha, texIndex ) {
	var isSky = 0;
	if argument_count>12 isSky = argument[12];
	
	vertex_position_3d(buffer,xx,yy,zz);
	vertex_normal(buffer,nx,ny,nz);
	vertex_texcoord(buffer,real(u),real(v));
	vertex_colour(buffer,color,alpha);
	vertex_texcoord(buffer,real(texIndex),isSky);
	vertex_texcoord(buffer,-1,-1);



}

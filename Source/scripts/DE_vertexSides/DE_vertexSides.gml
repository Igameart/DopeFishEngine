function DE_vertexSides( buffer, x, y, z, nx, ny, nz, u,v, col, alpha, index, middle, top ) {
	
	var isSky = 0;
	var isCeilSky = 0;
	if argument_count>14 isSky = argument[14];
	if argument_count>15 isCeilSky = argument[15];
	
	vertex_position_3d(buffer,x,y,z);
	vertex_normal(buffer,nx,ny,nz);
	vertex_position(buffer,(u),(v));
	vertex_colour(buffer,col,isCeilSky);
	vertex_texcoord(buffer,real(index),real(middle));
	vertex_texcoord(buffer,real(top),isSky);
	//vertex_texcoord(buffer,isCeilSky,0);

}

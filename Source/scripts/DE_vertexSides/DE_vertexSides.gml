function DE_vertexSides( buffer, x, y, z, nx, ny, nz, u,v, col, alpha, index, middle, top) {
	
	vertex_position_3d(buffer,x,y,z);
	vertex_normal(buffer,nx,ny,nz);
	vertex_position(buffer,(u),(v));
	vertex_colour(buffer,col,alpha);
	vertex_texcoord(buffer,real(index),real(middle));
	vertex_texcoord(buffer,real(top),-1);

}

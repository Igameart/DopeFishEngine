function verlet_motion_add_2d( __angle, __spd ){
	
	var __v = [__spd,0,0];

	// build the rotation matrix
	var __mT = matrix_build(0, 0, 0, 0, 0, __angle, 1, 1, 1);
	
	__v = matrix_transform_vertex(__mT,__v[0],__v[1],__v[2]);
	
	verlet_apply_force( __v );
	
}
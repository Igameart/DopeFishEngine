/// @description d3d - Adds a rotation around the z-axis with the indicated amount.
/// @param angle the angle to rorate the transform through the vector
function d3d_transform_add_rotation_z(argument0) {

	// get the sin and cos of the angle passed in
	var c = dcos(argument0);
	var s = dsin(argument0);

	// build the rotation matrix
	var mT = matrix_build_identity();
	mT[0] = c;
	mT[1] = -s;

	mT[4] = s;
	mT[5] = c;

	var m = matrix_get( matrix_world );
	var mR = matrix_multiply( m, mT );
	matrix_set( matrix_world, mR );



}

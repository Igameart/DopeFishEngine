/// @description d3d - Sets the transformation to a rotation around the z-axis with the indicated amount.
/// @param angle the angle to rorate the transform through the vector

// get the sin and cos of the angle passed in
var c = dcos(argument0);
var s = dsin(argument0);

// build the rotation matrix
var m = matrix_build_identity();
m[0] = c;
m[1] = -s;

m[4] = s;
m[5] = c;

matrix_set( matrix_world, m);

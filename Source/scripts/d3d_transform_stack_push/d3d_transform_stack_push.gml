/// @description d3d - Pushes the current transformation onto the stack.
function d3d_transform_stack_push() {
	var m = matrix_get( matrix_world );
	matrix_stack_push();
	matrix_stack_set( m );
	return true;


}

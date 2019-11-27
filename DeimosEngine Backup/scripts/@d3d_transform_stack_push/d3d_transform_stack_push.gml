/// @description d3d - Pushes the current transformation onto the stack.
var m = matrix_get( matrix_world );
matrix_stack_push();
matrix_stack_set( m );
return true;
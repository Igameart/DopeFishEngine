/// @description  d3d - backface culling on or off
/// @param enable true if enabled, false if disabled
function d3d_set_culling(argument0) {

	//gpu_set_cullmode( argument0 ? cull_clockwise : cull_noculling );
	gpu_set_cullmode( argument0 ? cull_counterclockwise : cull_noculling );


}

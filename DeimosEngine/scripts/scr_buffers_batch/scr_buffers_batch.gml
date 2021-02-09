var buffers = argument[0];
var vFormat = argument[1];

var main_buffer = buffer_create_from_vertex_buffer(buffers[0],buffer_fixed,1);

for (var b = 1; b<array_length_1d(buffers); b++){
	var buffer = buffer_create_from_vertex_buffer(buffers[b],buffer_fixed,1);
	
	var size = buffer_get_size(buffer);
	var pos = buffer_get_size(main_buffer);
	
	buffer_copy(buffer,0,size,main_buffer,pos);
	
	buffer_delete(buffer);
	vertex_delete_buffer(buffers[b]);
	
}

return vertex_create_buffer_from_buffer(main_buffer,vFormat);
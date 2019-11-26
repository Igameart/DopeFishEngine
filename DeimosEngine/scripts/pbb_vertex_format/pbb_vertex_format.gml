/// @description  Create the vertex format used by the shader-based billboard system
vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_textcoord();
vertex_format_add_custom(vertex_type_float1,vertex_usage_textcoord);

return vertex_format_end();
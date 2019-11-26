/// @description YYD_vbuffer_format_define();
globalvar YYD_vbformat;
vertex_format_begin()
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_textcoord();
vertex_format_add_colour();
vertex_format_add_textcoord();
vertex_format_add_textcoord();
YYD_vbformat = vertex_format_end();

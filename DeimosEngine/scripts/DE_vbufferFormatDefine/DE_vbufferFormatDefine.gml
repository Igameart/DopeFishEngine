/// @description DE_vbufferFormatDefine();
globalvar DE_vFormat;
vertex_format_begin()
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
vertex_format_add_texcoord();
vertex_format_add_texcoord();
DE_vFormat = vertex_format_end();

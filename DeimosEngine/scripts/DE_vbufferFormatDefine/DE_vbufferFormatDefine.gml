/// @description DE_vbufferFormatDefine();
globalvar YYD_vbformat;
vertex_format_begin()
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
vertex_format_add_texcoord();
vertex_format_add_texcoord();
YYD_vbformat = vertex_format_end();

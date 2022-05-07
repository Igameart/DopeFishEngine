/// @description

if RFXenabled{
	var w,h;

	w = surface_get_width(application_surface);
	h = surface_get_height(application_surface);

	RFXnoMask = true;

	if RFX2wide
		d3d_transform_add_translation(-w/2,0,0);

	gpu_set_tex_filter(false);
	RFX_draw_view();
	gpu_set_tex_filter(true);

}
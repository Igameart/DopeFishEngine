/// @description RFX_apply()
if RFXenabled{
    
    shader_set(RFXshader);
    texture_set_stage(RFXpalsampler,RFXpal);
    texture_set_stage(RFXdithsampler,RFXdith);
    texture_set_repeat_ext(RFXpalsampler,false);
    texture_set_repeat_ext(RFXdithsampler,true);
	
    
    shader_set_uniform_f(RFXscreensize,(__view_get( e__VW.WView, 0 ))/(1+RFX2wide),__view_get( e__VW.HView, 0 ));
    shader_set_uniform_f(RFXuspread,RFXspread);
    shader_set_uniform_f(RFXudepth,RFXcdepth);
    texture_set_interpolation(false);
	
    var sSize = [display_get_gui_width(),display_get_gui_height()];
	draw_surface_stretched(application_surface,0,0,sSize[0],sSize[1]);
    
    shader_reset();

}

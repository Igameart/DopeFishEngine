/// @description RFX_draw_sprite()
/// @param Surface
/// @param X
/// @param Y
/// @param xScale
/// @param yScale
/// @param Angle
/// @param Color
/// @param Alpha
function RFX_draw_surface() {

	var surf = argument[0];
	var xx = argument[1];
	var yy = argument[2];
	var xScale = argument_count>3? argument[3]: 1;
	var yScale = argument_count>4? argument[4]: 1;
	var Rot = argument_count>5? argument[5]: 0;
	var Col = argument_count>6? argument[6]: c_white;
	var Alph = argument_count>7? argument[7]: 1;

	if RFXenabled{
	
		var __mip = gpu_get_tex_mip_enable();
		gpu_set_tex_mip_enable(false);
	
	    shader_set(RFXshader);
	
		var area = [surface_get_width(surf)*xScale,surface_get_height(surf)*yScale];
	
		//shader_set_uniform_f_array(RFXuPixelScale,RFXPixelScale);
	
		gpu_set_tex_filter_ext(RFXpalsampler,false);
		gpu_set_tex_filter_ext(RFXdithsampler,false);
		gpu_set_tex_repeat_ext(RFXdithsampler,true);
	
	    texture_set_stage(RFXpalsampler,RFXpal);
	    texture_set_stage(RFXdithsampler,RFXdith);
    
	    shader_set_uniform_f_array(RFXscreensize,area);
	    shader_set_uniform_f(RFXuspread,RFXspread);
	    shader_set_uniform_f(RFXudepth,RFXcdepth);
		shader_set_uniform_f(RFXugamma,RFXGamma);
		shader_set_uniform_f(RFXunoMask,RFXnoMask);
	}
		draw_surface_ext(surf,xx,yy,xScale,yScale,Rot,Col,Alph);

	if RFXenabled{
	    shader_reset();
		gpu_set_tex_mip_enable(__mip);
	}



}
/// @param Alpha
function RFX_draw_view() {

	var xScale = RFXPixelScale[0];//argument_count>3? argument[3]: 1;
	var yScale = RFXPixelScale[1];//argument_count>4? argument[4]: 1;
	var Rot = 0;//argument_count>5? argument[5]: 0;
	var Col = c_white;//argument_count>6? argument[6]: c_white;
	var Alph = 1;//argument_count>7? argument[7]: 1;

	if RFXenabled{
	
		var __mip = gpu_get_tex_mip_enable();
		gpu_set_tex_mip_enable(false);
	
	    shader_set(RFXshader);
	
		var area = [surface_get_width(application_surface),surface_get_height(application_surface)];
	
		//shader_set_uniform_f_array(RFXuPixelScale,RFXPixelScale);
	
		gpu_set_tex_filter_ext(RFXpalsampler,false);
		gpu_set_tex_filter_ext(RFXdithsampler,false);
		gpu_set_tex_repeat_ext(RFXdithsampler,true);
	
	    texture_set_stage(RFXpalsampler,RFXpal);
	    texture_set_stage(RFXdithsampler,RFXdith);
    
	    shader_set_uniform_f_array(RFXscreensize,area);
	    shader_set_uniform_f(RFXuspread,RFXspread);
	    shader_set_uniform_f(RFXudepth,RFXcdepth);
		shader_set_uniform_f(RFXugamma,RFXGamma);
		shader_set_uniform_f(RFXunoMask,RFXnoMask);
	}
		draw_surface_ext(application_surface,0,0,RFX2wide? 2: 1,1,Rot,Col,Alph);

	if RFXenabled{
	    shader_reset();
		gpu_set_tex_mip_enable(__mip);
	}



}

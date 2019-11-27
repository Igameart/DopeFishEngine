/// @description RFX_set_coldepth(Color Depth)
/// @param Color Depth
RFXshader = RFX_coldepth_shd;
RFXcdepth = argument0;

RFXdithsampler = shader_get_sampler_index(RFXshader, "s_dithmap");
RFXpalsampler = shader_get_sampler_index(RFXshader, "s_lutmap");
RFXscreensize = shader_get_uniform(RFXshader ,"screensize");
RFXuspread = shader_get_uniform(RFXshader ,"dspread");
RFXudepth = shader_get_uniform(RFXshader ,"cdepth");
//RFXuPixelScale = shader_get_uniform(RFXshader ,"PixelScale");

texture_set_repeat_ext(RFXpalsampler,false);
texture_set_repeat_ext(RFXdithsampler,true);
gpu_set_tex_filter_ext(RFXdithsampler,false);
gpu_set_tex_filter_ext(RFXpalsampler,false);

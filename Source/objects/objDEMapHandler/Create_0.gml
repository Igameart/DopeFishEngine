
num=0;

DE_loadMap(DEMap);

window_set_cursor(cr_none);

alarm[0]=1;//Load music after loading everything else

cam2D = camera_create();

display_reset(8,1);
d3d_set_culling(true);
gpu_set_tex_filter(DE_texFilter);
texture_set_repeat(true);	
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

draw_set_alpha_test(true);
draw_set_alpha_test_ref_value(128);

gpu_set_tex_mip_enable(mip_off);
gpu_set_tex_mip_bias(-1.5);
gpu_set_tex_max_mip(8);
//gpu_set_tex_max_aniso(16);
gpu_set_tex_mip_filter(tf_point);

globalvar worldGravity;
worldGravity = 3.;

global._dt = 1;

time=0;

time = 0;

#macro fcol __background_get_colour( )
#macro f_far (2048*2)
#macro f_near 128

//globalvar shd_ctex;shd_ctex=shader_get_sampler_index(shd_GLSSect,"tex_C");
#macro shd_ltex shader_get_uniform(shd_Sidedef,"tex_L")
#macro shd_utex shader_get_uniform(shd_Sidedef,"tex_U")
#macro shd_mtex shader_get_uniform(shd_Sidedef,"tex_M")
#macro shd_sMat shader_get_uniform(shd_Sidedef,"u_fMat")

//globalvar shd_uLuv;shd_uLuv=shader_get_uniform(shd_Sidedef,"u_Luv");
//globalvar shd_uUuv;shd_uUuv=shader_get_uniform(shd_Sidedef,"u_Uuv");
//globalvar shd_uMuv;shd_uMuv=shader_get_uniform(shd_Sidedef,"u_Muv");
#macro u_sideAtlasScale 	shader_get_uniform(shd_Sidedef,"u_sectAtlas")

#macro u_fogColorS		shader_get_uniform(shd_Sidedef,"u_fogColor")
#macro u_fogMinDistS	shader_get_uniform(shd_Sidedef,"u_fogMinDist")
#macro u_fogMaxDistS	shader_get_uniform(shd_Sidedef,"u_fogMaxDist")

#macro u_fogColorG 		shader_get_uniform(shd_GLSSect,"u_fogColor")
#macro u_fogMinDistG 	shader_get_uniform(shd_GLSSect,"u_fogMinDist")
#macro u_fogMaxDistG 	shader_get_uniform(shd_GLSSect,"u_fogMaxDist")

#macro u_hightlight 	shader_get_uniform(shd_GLSSect,"u_hightlight")

#macro u_sectBotOff 	shader_get_uniform(shd_GLSSect,"u_sectBotOff")
#macro u_sectTopOff 	shader_get_uniform(shd_GLSSect,"u_sectTopOff")

#macro u_sectFloorTex 	shader_get_uniform(shd_GLSSect,"u_sectFloorTex")
#macro u_sectCeilTex   	shader_get_uniform(shd_GLSSect,"u_sectCeilTex")

#macro u_sectAtlasScale 	shader_get_uniform(shd_GLSSect,"u_sectAtlas")

#macro SuRes shader_get_uniform(shd_Sidedef,"uRes")

#macro u_lowOff shader_get_uniform(shd_Sidedef,"u_lowOff")
//globalvar u_lowTopOffu_lowTopOff shader_get_uniform(shd_Sidedef,"u_lowTopOff")

#macro u_upOff shader_get_uniform(shd_Sidedef,"u_upOff")
//globalvar u_upTopOffu_upTopOff shader_get_uniform(shd_Sidedef,"u_upTopOff")

#macro u_midOff shader_get_uniform(shd_Sidedef,"u_midOff")
//globalvar u_midTopOffu_midTopOff shader_get_uniform(shd_Sidedef,"u_midTopOff")

#macro u_LowPeg shader_get_uniform(shd_Sidedef,"u_LowPeg")
#macro u_UpPeg shader_get_uniform(shd_Sidedef,"u_UpPeg")

#macro u_TexHU shader_get_uniform(shd_Sidedef,"u_TexHU")
#macro u_TexHL shader_get_uniform(shd_Sidedef,"u_TexHL")
#macro u_TexHM shader_get_uniform(shd_Sidedef,"u_TexHM")

skyhandler = instance_create_depth(0,0,0,objDESkyHandler);
rfxcontrol = instance_create_depth(0,0,0,objRFXScreen);
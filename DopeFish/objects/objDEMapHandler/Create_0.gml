
num=0;

application_surface_draw_enable(false);

dtex=sprite_get_texture(RFXbayerdith_spr,0);
RFX_init(3,dtex,256/3,false,0.975);
//RFX_set_palswap(sprite_get_texture(RFXpalettes_spr,2));
RFX_set_coldepth( 24 );
//RFXenabled = false;

surface_resize(application_surface,display_get_gui_width()/RFXPixelScale[0],display_get_gui_height()/RFXPixelScale[1]);

view_wport[0] = display_get_gui_width()/RFXscale;
view_hport[0] = display_get_gui_height()/RFXscale;

DE_loadMap(DEMap);

window_set_cursor(cr_none);


display_reset(2,1);
d3d_set_culling(true);
texture_set_repeat(true);	
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

draw_set_alpha_test(true);
draw_set_alpha_test_ref_value(128);

gpu_set_tex_mip_enable(mip_on);
gpu_set_tex_mip_bias(-1.5);
gpu_set_tex_max_mip(8);
gpu_set_tex_max_aniso(16);

globalvar worldGravity;
worldGravity = 3.;

global._dt = 1;

time=0;
time_taken = 0;

//CHRIS: Music Stuff, move this to another object please
noteslist = noone;
time = 0;
realbpm = 0;

globalvar fcol;fcol=__background_get_colour( );
globalvar f_far;f_far=(2048*2);
globalvar f_near;f_near=128;

globalvar shd_ctex;shd_ctex=shader_get_sampler_index(shd_GLSSect,"tex_C");
globalvar shd_ltex;shd_ltex=shader_get_sampler_index(shd_Sidedef,"tex_L");
globalvar shd_utex;shd_utex=shader_get_sampler_index(shd_Sidedef,"tex_U");
globalvar shd_uLuv;shd_uLuv=shader_get_uniform(shd_Sidedef,"u_Luv");
globalvar shd_uUuv;shd_uUuv=shader_get_uniform(shd_Sidedef,"u_Uuv");
globalvar shd_uMuv;shd_uMuv=shader_get_uniform(shd_Sidedef,"u_Muv");

globalvar u_fogColorS;u_fogColorS=shader_get_uniform(shd_Sidedef,"u_fogColor");
globalvar u_fogMinDistS;u_fogMinDistS=shader_get_uniform(shd_Sidedef,"u_fogMinDist");
globalvar u_fogMaxDistS;u_fogMaxDistS=shader_get_uniform(shd_Sidedef,"u_fogMaxDist");

globalvar u_fogColorG;u_fogColorG=shader_get_uniform(shd_GLSSect,"u_fogColor");
globalvar u_fogMinDistG;u_fogMinDistG=shader_get_uniform(shd_GLSSect,"u_fogMinDist");
globalvar u_fogMaxDistG;u_fogMaxDistG=shader_get_uniform(shd_GLSSect,"u_fogMaxDist");

globalvar u_hightlight; u_hightlight=shader_get_uniform(shd_GLSSect,"u_hightlight");

globalvar u_sectBotOff;u_sectBotOff=shader_get_uniform(shd_GLSSect,"u_sectBotOff");
globalvar u_sectTopOff;u_sectTopOff=shader_get_uniform(shd_GLSSect,"u_sectTopOff");

globalvar u_lowBotOff;u_lowBotOff=shader_get_uniform(shd_Sidedef,"u_lowBotOff");
globalvar u_lowTopOff;u_lowTopOff=shader_get_uniform(shd_Sidedef,"u_lowTopOff");
globalvar u_upBotOff;u_upBotOff=shader_get_uniform(shd_Sidedef,"u_upBotOff");
globalvar u_upTopOff;u_upTopOff=shader_get_uniform(shd_Sidedef,"u_upTopOff");

globalvar u_midBotOff;u_midBotOff=shader_get_uniform(shd_Sidedef,"u_midBotOff");
globalvar u_midTopOff;u_midTopOff=shader_get_uniform(shd_Sidedef,"u_midTopOff");

globalvar u_LowPeg;u_LowPeg=shader_get_uniform(shd_Sidedef,"u_LowPeg");
globalvar u_UpPeg;u_UpPeg=shader_get_uniform(shd_Sidedef,"u_UpPeg");

globalvar u_TexHU;u_TexHU=shader_get_uniform(shd_Sidedef,"u_TexHU");
globalvar u_TexHL;u_TexHL=shader_get_uniform(shd_Sidedef,"u_TexHL");
globalvar u_TexHM;u_TexHM=shader_get_uniform(shd_Sidedef,"u_TexHM");
/// @description

DE_renderClearCache();

if !instance_exists(obj_DE_clipHead) instance_create(0,0,obj_DE_clipHead);

globalvar fcol;fcol=__background_get_colour( );
globalvar f_far;f_far=(2048);
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

num=0;

PLAYER_HEIGHT = 55;

application_surface_draw_enable(false);

dtex=sprite_get_texture(RFXbayerdith_spr,0);
RFX_init(2,dtex,256,false,0.75);
//RFX_set_palswap(sprite_get_texture(RFXpalettes_spr,6));
RFX_set_coldepth( 36 );
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

xx=1;
yy=0;
zz=0;
zspeed=0;
Msect=-1;
Mssect=-1;
secZ=0;

//var things=ds_map_find_value_fixed(wadlevel,"things");
//things=ds_list_find_value(things,0);

//x=ds_map_find_value(things,"x");
//y=ds_map_find_value(things,"z");
z=0;

//yaw=ds_map_find_value(things,"angle");
yaw = 0;
direction=yaw;
pitch=0;
cam_x=lengthdir_x(lengthdir_x(1,pitch),yaw)
cam_y=lengthdir_y(lengthdir_x(1,pitch),yaw)
cam_z=lengthdir_y(1,pitch)

var cMsect;
cMsect=DE_findSectorAt(x,y,Msect);

if cMsect!=Msect{
    if !is_undefined(cMsect){
        var sects = ds_map_find_value_fixed(wadlevel,"sectors");
        z=ds_map_find_value_fixed(ds_list_find_value_fixed(sects,cMsect),"floor");
    }
};


// camera
center_x=display_get_width()/2
center_y=display_get_height()/2
display_mouse_set(center_x,center_y)

cam_x=lengthdir_x(lengthdir_x(1,pitch),yaw)
cam_y=lengthdir_y(lengthdir_x(1,pitch),yaw)
cam_z=lengthdir_y(1,pitch)

mouse_free=0;

time=0;

IDDQD = false;
NOCLIP = false;

vel = [ 0.0, 0.0, 0.0 ]; // 2m/s along x-axis
acc = [ 0.0, 0.0, 0.0 ]; // no acceleration at first
mass = 1.0; // 1kg
drag = 0.1; // rho*C*Area - simplified drag for this example
vGravity = 0;
vFriction = 0.995;

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
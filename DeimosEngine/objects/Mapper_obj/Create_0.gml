
num=0;

application_surface_draw_enable(false);

DE_loadMap(DEMap);

window_set_cursor(cr_none);

display_reset(4,1);
d3d_set_perspective(true);
d3d_set_hidden(true);
d3d_set_culling(true);
texture_set_repeat(true);	
d3d_start();///Start 3d drawing
draw_set_alpha_test(true);
draw_set_alpha_test_ref_value(128);

fcol=__background_get_colour( );
f_far=mean(1024,2048);
f_near=64;

xx=1;
yy=0;
zz=0;
zspeed=0;
Msect=-1;
secZ=0;

var things=ds_map_find_value_fixed(wad_levels,"things");
things=ds_list_find_value(things,0);

x=ds_map_find_value(things,"x");
y=ds_map_find_value(things,"z");
z=0;

eyes=mean(56,32);

yaw=ds_map_find_value(things,"angle");
direction=yaw;
pitch=0;
cam_x=lengthdir_x(lengthdir_x(1,pitch),yaw)
cam_y=lengthdir_y(lengthdir_x(1,pitch),yaw)
cam_z=lengthdir_y(1,pitch)

var cMsect;
cMsect=DE_findSectorAt(x,y,Msect);

if cMsect!=Msect{
    if !is_undefined(cMsect){
        var sects = ds_map_find_value_fixed(wad_levels,"sectors");
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

shd_ctex=shader_get_sampler_index(shd_GLSSect,"tex_C");
shd_ltex=shader_get_sampler_index(shd_Sidedef,"tex_L");
shd_utex=shader_get_sampler_index(shd_Sidedef,"tex_U");
shd_uLuv=shader_get_uniform(shd_Sidedef,"u_Luv");
shd_uUuv=shader_get_uniform(shd_Sidedef,"u_Uuv");
shd_uMuv=shader_get_uniform(shd_Sidedef,"u_Muv");

u_fogColorS=shader_get_uniform(shd_Sidedef,"u_fogColor");
u_fogMinDistS=shader_get_uniform(shd_Sidedef,"u_fogMinDist");
u_fogMaxDistS=shader_get_uniform(shd_Sidedef,"u_fogMaxDist");

u_fogColorG=shader_get_uniform(shd_GLSSect,"u_fogColor");
u_fogMinDistG=shader_get_uniform(shd_GLSSect,"u_fogMinDist");
u_fogMaxDistG=shader_get_uniform(shd_GLSSect,"u_fogMaxDist");


u_sectBotOff=shader_get_uniform(shd_GLSSect,"u_sectBotOff");
u_sectTopOff=shader_get_uniform(shd_GLSSect,"u_sectTopOff");

u_lowBotOff=shader_get_uniform(shd_Sidedef,"u_lowBotOff");
u_lowTopOff=shader_get_uniform(shd_Sidedef,"u_lowTopOff");
u_upBotOff=shader_get_uniform(shd_Sidedef,"u_upBotOff");
u_upTopOff=shader_get_uniform(shd_Sidedef,"u_upTopOff");

u_midBotOff=shader_get_uniform(shd_Sidedef,"u_midBotOff");
u_midTopOff=shader_get_uniform(shd_Sidedef,"u_midTopOff");

u_LowPeg=shader_get_uniform(shd_Sidedef,"u_LowPeg");
u_UpPeg=shader_get_uniform(shd_Sidedef,"u_UpPeg");

u_TexHU=shader_get_uniform(shd_Sidedef,"u_TexHU");
u_TexHL=shader_get_uniform(shd_Sidedef,"u_TexHL");
u_TexHM=shader_get_uniform(shd_Sidedef,"u_TexHM");

time=0;


dtex=sprite_get_texture(RFXbayerdith_spr,0);
RFX_init(2,dtex,256,false);
//ptex=sprite_get_texture(RFXpalettes_spr,3);
//RFX_set_palswap(ptex);
RFX_set_coldepth(28);

surface_resize(application_surface,display_get_gui_width()/RFXscale,display_get_gui_height()/RFXscale);

view_wport[0] = display_get_gui_width()/RFXscale;
view_hport[0] = display_get_gui_height()/RFXscale;

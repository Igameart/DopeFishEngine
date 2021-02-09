
num=0;

//application_surface_draw_enable(false);

dtex=sprite_get_texture(RFXbayerdith_spr,0);
RFX_init(3,dtex,256,false);
//ptex=sprite_get_texture(RFXpalettes_spr,3);
//RFX_set_palswap(ptex);
RFX_set_coldepth(24);
//RFXenabled = false;

surface_resize(application_surface,display_get_gui_width()/RFXscale,display_get_gui_height()/RFXscale);

view_wport[0] = display_get_gui_width()/RFXscale;
view_hport[0] = display_get_gui_height()/RFXscale;


DE_loadMap(DEMap);

//window_set_cursor(cr_none);

display_reset(4,1);
d3d_set_culling(true);
texture_set_repeat(true);	
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

draw_set_alpha_test(true);
draw_set_alpha_test_ref_value(128);

//gpu_set_tex_mip_enable(mip_on);
//gpu_set_tex_mip_bias(-0.5);
//gpu_set_tex_max_mip(8);
//gpu_set_tex_max_aniso(16);

xx=1;
yy=0;
zz=0;
zspeed=0;
Msect=-1;
secZ=0;

//var things=ds_map_find_value_fixed(wad_levels,"things");
//things=ds_list_find_value(things,0);

//x=ds_map_find_value(things,"x");
//y=ds_map_find_value(things,"z");
z=0;

eyes=mean(56,32);

//yaw=ds_map_find_value(things,"angle");
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

time=0;
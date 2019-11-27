image_angle=0;
image_xscale=1;
image_yscale=1;

time+=0.01;
    
//zspeed=(keyboard_check(ord('E'))-keyboard_check(ord('Q')))*5;

//zspeed=max(-5.5,zspeed);
var spd=1;
// movement
if keyboard_check(ord("W"))motion_add(yaw    ,spd)
if keyboard_check(ord("A"))motion_add(yaw+90 ,spd)
if keyboard_check(ord("S"))motion_add(yaw+180,spd)
if keyboard_check(ord("D"))motion_add(yaw+270,spd)

// camera
yaw  +=(center_x-display_mouse_get_x())/6;
pitch+=(display_mouse_get_y()-center_y)/6;
pitch=min(89,max(-89,pitch));

//z+=zspeed;
var cMsect;
cMsect=YYD_get_sector(x,y,Msect);

window_set_caption("FPS: "+string(fps_real)+"Sector: "+string(cMsect));

if cMsect!=Msect{
    if !is_undefined(cMsect){
        var sects = ds_map_find_value_fixed(wad_levels,"sectors");
        secZ=ds_map_find_value_fixed(ds_list_find_value_fixed(sects,cMsect),"floor");
        Msect=cMsect;
    }
};
    
if Msect!=-1{
    if z>secZ{
            z-=6;
    }
    if zspeed<=0.05{
        if z<=secZ{
            zspeed=0;
            var zdiff=secZ-z;
            if (abs(zdiff)>0.2){
                z+=zdiff*0.4;
            }else z=secZ;
        }
    }
    if z<=secZ{
        if keyboard_check_pressed(vk_space) zspeed=24;
    }
}

speed*=.9;
z+=zspeed;
zspeed*=.7;

if keyboard_check_pressed(vk_enter) mouse_free=!mouse_free

if mouse_free=0{
    display_mouse_set(center_x,center_y)
    cam_x=lengthdir_x(lengthdir_x(1,pitch),yaw)
    cam_y=lengthdir_y(lengthdir_x(1,pitch),yaw)
    cam_z=lengthdir_y(1,pitch)
}

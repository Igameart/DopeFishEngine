image_angle=0;
image_xscale=1;
image_yscale=1;

time+=0.01;

if keyboard_check_pressed(vk_numpad0) IDDQD = !IDDQD;
if keyboard_check_pressed(vk_numpad1) NOCLIP = !NOCLIP;

var cMsect;
cMsect=DE_findSectorAt(x,y,Msect);

if cMsect!=Msect{
    if !is_undefined(cMsect){
        var sects = ds_map_find_value_fixed(wad_levels,"sectors");
        secZ=ds_map_find_value_fixed(ds_list_find_value_fixed(sects,cMsect),"floor");
        Msect=cMsect;
    }
};
    
if Msect!=-1{
	
	if (IDDQD == false){
	
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
	}else{
		zspeed = ( keyboard_check(vk_space) - keyboard_check(vk_lcontrol) ) * 3;
		if (z < secZ){
			z = secZ;
		}
	}
}

speed*=.9;
z+=zspeed;
zspeed*=.7;

if keyboard_check_pressed(vk_enter){
	mouse_free=!mouse_free
	if mouse_free == false display_mouse_set(center_x,center_y);
}

	
var spd=1;
// movement
if keyboard_check(ord("W"))motion_add(yaw    ,spd)
if keyboard_check(ord("A"))motion_add(yaw+90 ,spd)
if keyboard_check(ord("S"))motion_add(yaw+180,spd)
if keyboard_check(ord("D"))motion_add(yaw+270,spd)
	
if mouse_free=0{

	// camera
	yaw  +=(center_x-display_mouse_get_x())/6;
	pitch+=(display_mouse_get_y()-center_y)/6;
	pitch=min(89,max(-89,pitch));
	
    display_mouse_set(center_x,center_y);
    cam_x=lengthdir_x(lengthdir_x(1,pitch),yaw);
    cam_y=lengthdir_y(lengthdir_x(1,pitch),yaw);
    cam_z=lengthdir_y(1,pitch);
	
}


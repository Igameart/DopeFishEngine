image_angle=0;
image_xscale=1;
image_yscale=1;

time+=0.01;

if keyboard_check_pressed(vk_numpad0) IDDQD = !IDDQD;
if keyboard_check_pressed(vk_numpad1) NOCLIP = !NOCLIP;

var cMsect;
cMsect	= DE_findSectorAt( x, y, Sector );

Subsector	= DE_findSubacksectororAt( x, y );

if cMsect!=Sector{
	
    if !is_undefined(cMsect){		
		var secCheck = ds_list_find_value(mapGLSSects,Subsector);
		if (secCheck != undefined){
			secZ = mapSectors[|secCheck.sector].floorz;
		    Sector = cMsect;
		}
    }
	
};
    
if (IDDQD == false){
	if Sector!=-1{
	        if z<=secZ{
				vGravity = 0.0;
				vFriction = 0.995;
	            //zspeed=0;
	            var zdiff=secZ-z;
	            if (abs(zdiff)>0.2){
	                z+=zdiff*0.4;
	            }else z=secZ;
	        }else vGravity = 1.0;
	    if z <= secZ + 12 {
	        if keyboard_check_pressed(vk_space){
				verlet_apply_force([0,0,130]);
				vGravity = 1.0;
				vFriction = 1;
			}
	    }
	}
}else{
	z += ( keyboard_check(vk_space) - keyboard_check(vk_lcontrol) ) * 3;
	vGravity = 0;
	vFriction = 0.995;
}

if keyboard_check_pressed(vk_enter){
	mouse_free=!mouse_free
	if mouse_free == false display_mouse_set(center_x,center_y);
}


var spd=5+keyboard_check(vk_shift)*7;

if vGravity != 0 spd *= 0.5;

// movement
if keyboard_check(ord("W")) verlet_motion_add_2d( yaw     ,spd);
if keyboard_check(ord("A")) verlet_motion_add_2d( yaw+90  ,spd);
if keyboard_check(ord("S")) verlet_motion_add_2d( yaw+180 ,spd);
if keyboard_check(ord("D")) verlet_motion_add_2d( yaw+270 ,spd);

//speed = min(speed,6+keyboard_check(vk_shift)*4);

global._dt = delta_time / 1000000;//ideal_time;

repeat 15 verlet_update( global._dt );
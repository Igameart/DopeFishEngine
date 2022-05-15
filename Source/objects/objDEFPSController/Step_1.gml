/// @description Insert description here
image_angle=0;
image_xscale=1;
image_yscale=1;

if keyboard_check_pressed(vk_numpad0) IDDQD = !IDDQD;
if keyboard_check_pressed(vk_numpad1) NOCLIP = !NOCLIP;

var cMsect;
//cMsect	= -1;// DE_findSectorAt( x, y, Sector );
cMsect	= DE_findSectorAt( x, y, Sector );

Subsector= DE_findSubsectorAt( x, y, Subsector );

var secCheck = ds_list_find_value(mapGLSSects,Subsector);

/*if is_struct(secCheck)
	cMsect = (secCheck.sector);*/

if cMsect!=Sector{
	
    if !is_undefined(cMsect){
		if (secCheck != undefined){
			var _sec = mapSectors[| secCheck.sector];
			secF = DE_FindSectorFloorHeight(_sec);//.floorz;
			secC = DE_FindSectorCeilingHeight(_sec);//.ceilingz;
		    Sector = cMsect;
		}
    }
	
};
    
if (IDDQD == false){
	if Sector!=-1{
	        if z<=secF{
				jumping = false;
				jumpVal = 0;
				vGravity = 0.0;
				vFriction = 0.995;
				drag = 0.1;
	            //zspeed=0;
	            var zdiff=secF-z;
	            if (abs(zdiff)>0.2){
	                z+=zdiff*0.4;
	            }else z=secF;
	        }else vGravity = worldGravity;
	    if z <= secF + 12 {
	        if keyboard_check_pressed(vk_space){
				vGravity = -1;
				jumpVal = jumpStr;
				jumping = true;
			}
	    }
	}
}else{
	z += ( keyboard_check(vk_space) - keyboard_check(vk_lcontrol) ) * 3;
	jumpVal = 0;
	vGravity = 0;
	vFriction = 0.995;
}

if jumpVal > 0{
	
	if jumping == true
		verlet_apply_force([0,0,jumpVal]);
	
	jumpVal *= .8;
	
	vGravity += 1.0/6;
	vGravity = min(vGravity,worldGravity);
	
	vFriction = 0.995;
	drag = 0.1;
	
	if keyboard_check_released(vk_space){
		jumping = false;
		//jumpVal = 0;
		//vGravity = worldGravity;
	}
	
	//Check if we bumped our heads
	
}

if keyboard_check_pressed(vk_enter){
	mouse_free=!mouse_free
	if mouse_free == false display_mouse_set(center_x,center_y);
}


var spd=5+keyboard_check(vk_shift)*7;

//if vGravity != 0 spd *= 0.1;

// movement
if keyboard_check(ord("W")) verlet_motion_add_2d( yaw     ,spd);
if keyboard_check(ord("A")) verlet_motion_add_2d( yaw+90  ,spd);
if keyboard_check(ord("S")) verlet_motion_add_2d( yaw+180 ,spd);
if keyboard_check(ord("D")) verlet_motion_add_2d( yaw+270 ,spd);

global._dt = delta_time / 1000000;//ideal_time;

repeat 15 verlet_update( global._dt );



if vel[2] >0{
if z+Height+HeadRoom > secC{
	jumping = false;
	vel[2] = 0;
	vGravity = worldGravity;
	z = secC - Height - HeadRoom;
}
}
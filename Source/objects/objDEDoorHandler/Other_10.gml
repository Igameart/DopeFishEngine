
if sector!=noone
if is_struct(sector){
if (sector.doorheight != undefined && sector.floorz != undefined){

	doorHeight = sector.doorheight - sector.floorz;

	doorPos = 0;
	
}
}else{
	instance_destroy();
}
else instance_destroy();
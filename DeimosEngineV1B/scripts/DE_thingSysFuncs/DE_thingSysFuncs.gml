// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DE_thingGetSpriteAngle(){
	
	var angle = 180 + angle_difference(point_direction(x, y, DEcam.x,DEcam.y),entDirection);
	entAngle = floor( angle * 8 / 360 - .5);
	
	entAngle -= 3;
	
	if entAngle<0 entAngle += 8;
	if entAngle>8 entAngle -= 8;
	
	entAngle++;

}
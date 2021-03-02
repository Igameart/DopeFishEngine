// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DE_thingGetSpriteAngle(){
	
	var angle = 180 + angle_difference(point_direction(x, y, DEcam.x,DEcam.y),Direction);
	angle = floor( angle * 8 / 360 - .5);
	
	angle -= 3;
	
	if angle<0 angle += 8;
	if angle>8 angle -= 8;
	
	angle++;

}
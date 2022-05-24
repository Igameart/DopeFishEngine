function DE_thingGetSpriteAngle(){
	
	var angle = 180 + angle_difference( point_direction(x, y, DEcam.x,DEcam.y), Direction );
	Angle = floor( angle * 8 / 360 - .5);
	
	Angle -= 3;
	
	while Angle<0 Angle += 8;
	while Angle>8 Angle -= 8;
	
	Angle++;

}

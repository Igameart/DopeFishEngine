/// @description Gets the coordinates of where the camera is 'looking'
function camera_calculate(argument0) {
	/*  By Fraser Tomison interning at YoYo Games Ltd.
	 *
	 *  arg0 : camera to find
	 *  
	 */
 
	//roll is assumed unchanged- will add later

	argument0.xx = cos (degtorad(argument0.yaw)) * cos (degtorad(argument0.pitch));
	argument0.yy = sin (degtorad(argument0.pitch));
	argument0.zz = sin (degtorad(argument0.yaw)) * cos (degtorad(argument0.pitch));



}

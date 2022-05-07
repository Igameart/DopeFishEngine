function scr_mouseLook() {
	yaw -= ((device_mouse_raw_x(0)) - window_get_width() /2) /4;
	pitch -= ((device_mouse_raw_y(0)) - window_get_height() /2) /4;

	if (pitch >= 80) pitch = 80;
	if (pitch <= -80) pitch = -80;

	window_mouse_set(window_get_width() / 2, window_get_height() / 2); 



}

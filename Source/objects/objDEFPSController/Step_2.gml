/// @description

if mouse_free=0{
	// camera
	yaw  +=(center_x-display_mouse_get_x())/6;
	pitch+=(display_mouse_get_y()-center_y)/6;
	pitch=min(89,max(-89,pitch));
    display_mouse_set(center_x,center_y);
}

event_inherited();


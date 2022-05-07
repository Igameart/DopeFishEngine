/// @description

if RFXenabled{
	
if keyboard_check_pressed(vk_up){
	RFXscale++;
	RFX_toggle_screen_fx(true);
}
if keyboard_check_pressed(vk_down){
	RFXscale--;
	RFXscale = max(RFXscale,2);
	RFX_toggle_screen_fx(true);
}

if keyboard_check_pressed(vk_left){
	RFXcdepth -= 2;
	RFX_toggle_screen_fx(true);
}
if keyboard_check_pressed(vk_right){
	RFXcdepth += 2;
	RFXcdepth = max(RFXcdepth,2);
}

}
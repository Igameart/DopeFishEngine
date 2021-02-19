function verlet_init(){
	globalvar ideal_delta_time; ideal_delta_time = 1/game_get_speed(gamespeed_fps) * 1000000; //typically 33333 or 16666
}
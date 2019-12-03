/// @description

//trace("Player Colliding With Door Switch");

if triggerType == DETriggers.MANUAL
	if state == 0
	if keyboard_check(ord("F")){
		if switchIndex != undefined{
			sndPlaying = DE_getSound("DSSWTCHN");
			audio_play_sound(sndPlaying,random(16),false);
		}
		
		event_user(0);
	
	}
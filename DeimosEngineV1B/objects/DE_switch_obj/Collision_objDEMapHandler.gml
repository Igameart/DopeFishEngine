/// @description

//trace("Player Colliding With Door Switch");

if switched == false
	if sectsComplete = -1{
	if TRIG[0] == "S" || TRIG[0] == "P"
		if keyboard_check(ord("F")){
			
			if TRIG[0] == "S"{
				trace("Flipping Switch");
			
				sndPlaying = DE_getSound("DSSWTCHN");
				audio_play_sound(sndPlaying,random(16),false);
			}			
		
			event_user(0);
		}
	if TRIG[0] == "W"{
		event_user(0);
	}
}
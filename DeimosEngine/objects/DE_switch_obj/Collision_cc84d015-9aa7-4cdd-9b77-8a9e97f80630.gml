/// @description

//trace("Player Colliding With Door Switch");

if keyboard_check(ord("F")){
	
	switch routine{
		
		case DERoutines.DOOR:
			for (var Door = 0; Door<doorNum; Door++){
	
				with doorSectors[|Door]
				switch state{
		
					case "CLOSED":
						state = "OPEN";
						sndPlaying = DE_getSound("DSDOROPN");
						audio_play_sound(sndPlaying,random(16),false);
					break;
		
					/*case "OPENED":
						state = "CLOSE";
					break;*/
				}
			}
		break;
		
	}
	
}
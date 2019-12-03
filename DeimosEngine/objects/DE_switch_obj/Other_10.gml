/// @description perform action

/*switchIndex = sPos;

if sPos!=undefined{

	switchTex[0] = side[?switchIndex];
	switchTex[1] = wadSwitchTextures[? side[? switchIndex ] ];
	
}*/

if state == 0{

	state = !state;

	if switchIndex!=undefined{
		side[?switchIndex] = switchTex[state];
	}
	
	alarm[1] = sOnTime*room_speed;

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
				
				}
			}
		
		break;
		
	}
}
/// @description

if switched == false{
	
	//if sector has been activated by another switch,
	//Check to see if it's repeatable, if not, deactivate this switch
	
	var _ready = DE_switchCheckIfReady();
	
	if (_ready == true && repeatable == false ){
		switched = true;
		exit;
	}
	
	if _ready == true
		switch TRIG[0]{
		case "S":
		case "P":
		if keyboard_check_pressed(ord("F")){
				
			trace("Interacting");
			
			if TRIG[0] == "S"{
				trace("Flipping Switch");
				sndPlaying = DE_getSound("DSSWTCHN");
				audio_play_sound(sndPlaying,random(16),false);
			}			
		
			event_user(0);
		}
		break;
		
		case "W":
			event_user(0);
		break;
	
	}
}
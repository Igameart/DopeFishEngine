/// @description

if switched == false{
	
	//if sector has been activated by another switch,
	//Check to see if it's repeatable, if not, deactivate this switch
	
	var _ready = DE_switchCheckIfReady();
	
	if (_ready == true && repeatable == false ){
		switched = true;
		exit;
	}
	
	if _ready == true{
		if TRIG[0] == "S" || TRIG[0] == "P"
			if keyboard_check_pressed(ord("F")){
			
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
}
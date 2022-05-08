function DE_switchSetDoorState(_state) {
	//For all linked doors, set their state
	
	var _activated = false;
	
	var _doors = ds_list_size(taggedSectors);

	DEtrace("Switch Activates",_doors,"Door Sectors");

	for (var Door = 0; Door < _doors; Door++){
		
		var this = id;
		
		with taggedSectors[| Door ]{
			
			if ready == true
			if active == false && state!="Idle"{
				
				var _engage = false;
				
				switch _state{
					case "Open":
						if state == "Closed" _engage = true;
					break;
					case "Close":
						if active = false _engage = true;
					break;
				}
				
				if _engage == true{
					active = true;
					ready = false;
					FUNC = this.FUNC;
					state = _state;
					_activated = true;
				}
			}
		}
	}
	
	if (_activated == true){
		
		trace("Linedef Action Engaged:",_state,FUNC);
		
		switch _state{
			case "Open":
				audio_play_sound(DE_getSound("DSDOROPN"),random(16),false);
			break;
			case "Close":
				audio_play_sound(DE_getSound("DSDORCLS"),random(16),false);
			break;
		}
	}
}

function DE_switchCheckIfReady(){
	
	var _ready = 0;
	
	var _doors = ds_list_size( taggedSectors );

	for (var Door = 0; Door < _doors; Door++){
		
		with taggedSectors[| Door ] if ready == true _ready++;
		
	}
	
	if _ready >= _doors return true else return false;
}

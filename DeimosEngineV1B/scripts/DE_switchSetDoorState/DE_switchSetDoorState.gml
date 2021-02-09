function DE_switchSetDoorState() {
	//For all linked doors, set their state

	var _state = argument[0];

	trace("Linedef Action Engaged:",_state,FUNC);

	for (var Door = 0; Door<taggedSectNum; Door++){
		var this = id;
		with taggedSectors[|Door]{
			owner = this;
			FUNC = this.FUNC;
			state = _state;
		
			//ds_map_print(sector);
			trace(current_time);
		
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


}

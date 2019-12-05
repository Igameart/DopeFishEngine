
var DT = (2/35)*((room_speed/fps));//translate(0,0,35,0,0);

var stateChange = false;

switch state{
	
	case "Open":
	
		doorPos += doorSpeed*DT;
		//doorPos = clamp(doorPos,0,doorHeight);
		
		sector[?"crush"]=doorPos;
		
		if doorPos > doorHeight{
			
			sector[?"crush"] = doorHeight;
			stateChange = true;
			
		}
		
	break;
	
	case "Close":
		doorPos -= doorSpeed*DT;
		doorPos = clamp(doorPos,0,doorHeight);
		sector[?"crush"]=doorPos;
		
		if doorPos == 0{
			stateChange = true;
		}
		
	break;
	
	case "Wait":
		if wait!= -1{
			time += 1;
			
			if time>=wait*room_speed{
				time = 0;
				stateChange = true;
			}
			
		}else state = "IDLE"
	break;
}

if stateChange == true{
	
	funcPos++;
				
	if funcPos == array_length_1d(FUNC){
		trace(FUNC);
		state = "IDLE";
		
		//If this is a repeatable action, make sure owner switch resets
		if repeatable == true{
			funcPos = 0;
			if instance_exists(owner){
				with owner{
					sectsComplete++;
						//But only if all linked sectors have completed actions (add 1 to account for the required negative value of sectsComplete)
					if sectsComplete+1 == ds_list_size(taggedSectors){
						trace("All Tagged Sectors Have Completed Their Actions");
						event_user(1);
						
					}
				}
			}
			
			
		}
		
	}else{
		
		state = FUNC[funcPos];
		switch state{
			case "Close":
				audio_play_sound(DE_getSound("DSDORCLS"),random(16),false);				
			break;
			case "Open":
				audio_play_sound(DE_getSound("DSDORCLS"),random(16),false);
			break;			
		}
		
	}
	
	trace("Door State Changed To:",state);
	trace(current_time);
}
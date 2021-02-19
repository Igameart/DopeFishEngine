
//We are idle, there's nothing left to do.
//if state == "Idle" exit;

var DT = ( 35 / 60 ) * ( delta_time / ideal_time );//translate(0,0,35,0,0);

var stateAdvance = false;

switch state{
	
	case "Open":
	
		doorPos += doorSpeed*DT;
		
		sector[? "crush" ] = doorPos;
		
		if doorPos > doorHeight{
			active = false;
			sector[? "crush" ] = doorHeight;
			stateAdvance = true;
		}
		
	break;
	
	case "Close":
		doorPos -= doorSpeed*DT;
		doorPos = clamp(doorPos,0,doorHeight);
		sector[? "crush" ]=doorPos;
		
		if doorPos == 0{
			stateAdvance = true;
		}
		
	break;
	
	case "Wait":
		if wait!= -1{
			time += 1;
			
			if time>=wait*room_speed{
				time = 0;
				stateAdvance = true;
			}
			
		}else state = "Idle"
	break;
}

if stateAdvance == true{
	
	funcPos++;
				
	if funcPos >= array_length( FUNC ){
		
		ready = true;
		
		//If this is a repeatable action, reset self and owner
		if repeatable == true{
			
			funcPos = 0;
			active = false;
			
			if ( state == "Close" ){
				state = "Closed";
			}
			
		}else{
			//Not repeatable, now we become IDLE
			state = "Idle";
		}
		
	}else{
		
		state = FUNC[funcPos];
		
		switch state{
			case "Close":
				var __snd = DE_getSound("DSDORCLS");
				if !audio_is_playing(__snd)
					audio_play_sound(__snd,random(16),false);				
			break;
			case "Open":
				var __snd = DE_getSound("DSDOROPN");
				if !audio_is_playing(__snd)
					audio_play_sound(__snd,random(16),false);	
			break;			
		}
		
	}
	
	trace("Door State Changed To:",state);
}

if keyboard_check_pressed(ord("F")){
	switch state{
		case "CLOSED":
			state = "OPEN";
		break;
		//case "OPENED":
		//	state = "CLOSE";
		//break;
	}
}

switch state{	
	case "OPEN":
	
		doorPos -= doorSpeed;
		doorPos = clamp(doorPos,doorHeight,4);
		
		if doorPos == 4{
			state = "WAIT";
		}
		
	break;
	case "CLOSE":
		doorPos += doorSpeed;
		doorPos = clamp(doorPos,doorHeight,4);
	break;
	case "WAIT":
		if wait!= -1{
			time ++;
			if time>=wait{
				time = 0;
				state = "CLOSE";
			}
		}else state = "OPENED";
	break;
}

sector[?"crush"]=-doorPos;


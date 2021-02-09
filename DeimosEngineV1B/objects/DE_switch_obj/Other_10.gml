/// @description perform action

/*switchIndex = sPos;

if sPos!=undefined{

	switchTex[0] = side[?switchIndex];
	switchTex[1] = wadSwitchTextures[? side[? switchIndex ] ];
	
}*/

if switched == false{
	
	switched = true;

	if TRIG[0] == "S"{

		if switchIndex!=undefined{
			side[?switchIndex] = switchTex[switched];
		}
		
	}
	
	/*
	if TRIG[1] == "R"{	//Action is repeatable so reset the switch after a moment
		alarm[1] = sOnTime*room_speed;
	}*/

	switch routine{
		case DERoutines.DOOR:
			DE_switchSetDoorState( FUNC[0] );
		break;
	}
	
}
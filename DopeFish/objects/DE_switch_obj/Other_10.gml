/// @description perform action

if switched == false{
	
	trace( "Performing Action For Switch" );
	
	switched = true;

	if TRIG[0] == "S"{

		if switchIndex!=undefined{
			side[?switchIndex] = switchTex[switched];
		}
		
	}

	switch routine{
		case DERoutines.DOOR:
			DE_switchSetDoorState( FUNC[0] );
		break;
	}
	
}
/// @description perform action

if switched == false{
	
	//DEtrace( "Performing Action For Switch",routine );
	
	switched = true;
	
	if TRIG[0] == "S" || TRIG[0] == "P"{

		switch switchIndex{				
			case "lowtex":	side.lowtex	= switchTex[switched]; break;
			case "midtex":	side.midtex	= switchTex[switched]; break;
			case "uptex":	side.uptex	= switchTex[switched]; break;
		}
		
	}

	switch routine{
		case DERoutines.DOOR:
		
			DEtrace("Switching Open Door");
			DE_switchSetDoorState( FUNC[0] );
			
		break;
	}
	
}
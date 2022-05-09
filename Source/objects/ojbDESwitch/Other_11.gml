/// @description Toggle if Repeatable

//sectsComplete++;

//ds_list_print(taggedSectors);

//But only if all linked sectors have completed actions (add 1 to account for the required negative value of sectsComplete)
//if sectsComplete >= ds_list_size(taggedSectors){
	
	trace("Switch Object Resetting");
	
	switched = false;
	sectsComplete = 0;

	if TRIG[0] == "S" || TRIG[0] == "P"{

		switch switchIndex{				
			case "lowtex":	side.lowtex	= switchTex[switched]; break;
			case "midtex":	side.midtex	= switchTex[switched]; break;
			case "uptex":	side.uptex	= switchTex[switched]; break;
		}
		
		if TRIG[0] == "S"	//Only play the unswitch sound if this is a switch
			audio_play_sound(DE_getSound("DSSWTCHX"),random(16),false);
	}
//}
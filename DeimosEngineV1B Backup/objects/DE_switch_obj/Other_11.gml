/// @description Toggle if Repeatable

//sectsComplete++;

trace("Switch Object Resetting");
//ds_list_print(taggedSectors);

//But only if all linked sectors have completed actions (add 1 to account for the required negative value of sectsComplete)
//if sectsComplete >= ds_list_size(taggedSectors){
	
	switched = false;
	sectsComplete = 0;

	if TRIG[0] == "S"{

		if switchIndex!=undefined{
			side[?switchIndex] = switchTex[switched];
		}

		audio_play_sound(DE_getSound("DSSWTCHX"),random(16),false);
	}
//}
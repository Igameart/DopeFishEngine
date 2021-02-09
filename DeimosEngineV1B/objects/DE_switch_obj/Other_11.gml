/// @description Toggle Off

switched = false;
sectsComplete = -1;

if TRIG[0] == "S"{

	if switchIndex!=undefined{
		side[?switchIndex] = switchTex[switched];
	}

	audio_play_sound(DE_getSound("DSSWTCHX"),random(16),false);
	
}
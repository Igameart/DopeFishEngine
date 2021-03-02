/// @description MUSIC
if noteslist != noone{
	time += realbpm;

	for(var i = 0; i < ds_list_size(noteslist); i++) {
		var note = ds_list_find_value(noteslist, i);
		if (note[0] > time) {
			continue;
		} else {
			var snd = audio_play_sound(snd_beep, 1, 0); //play middle c
			var n = note[1] - 60; //find out the note's relation to middle c (60)
			audio_sound_pitch(snd, power(2, (0 + n)/12)); //change pitch accordingly 
			ds_list_delete(noteslist, i);
		}
	}

}
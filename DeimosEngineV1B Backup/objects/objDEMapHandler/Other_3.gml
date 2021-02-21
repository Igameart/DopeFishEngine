/// @description

//Free all loaded buffer sounds
if ds_exists(wadSounds,ds_type_map){
	var key = ds_map_find_first(wadSounds);
	do{
		var val = wadSounds[?key];
		if val != undefined{
			audio_free_buffer_sound(val);
		}
		key = ds_map_find_next(wadSounds,key);
	}until key == undefined;
}

//buffer_delete(wadbuff);
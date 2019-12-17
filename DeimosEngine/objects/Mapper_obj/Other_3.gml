/// @description

//Free all loaded buffer sounds
var key = ds_map_find_first(wadSounds);
do{
	var val = wadSounds[?key];
	audio_free_buffer_sound(val);
	key = ds_map_find_next(wadSounds,key);
}until key == undefined;

buffer_delete(wadbuff);
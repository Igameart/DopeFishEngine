var map = argument[0], entry = argument[1];

var key = ds_map_find_first(map);

do{
	var val = map[?key];
	
	if val == entry return key;
	
	key = ds_map_find_next(map,key);
}until key == undefined;

return undefined;
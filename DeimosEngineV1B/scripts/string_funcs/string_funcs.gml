function split(_string, _split) {
	var _pos=string_pos(_split,_string);

	return string_copy(_string,_pos+1,string_length(_string)-_pos+1);

}

function string_to_list(string){
	var list = ds_list_build();

	var slot = 0;

	var i;
	for (i = 1; i < (string_length(string)+1); i++) {
	    var currStr = string_copy(string, i, 1);
		list[| slot] = currStr;
		slot++;
	}
	
	return list;
}
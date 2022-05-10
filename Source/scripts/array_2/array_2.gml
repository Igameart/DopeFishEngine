function array_2(argument0, argument1) {
	var array;

	array[0]=argument0;
	array[1]=argument1;

	return array;



}

function array_find_index( _arr,_val ){
 
	for (var _g = 0; _g < array_length(_arr); _g++)
	{
	if (_arr[_g] == _val)
	return _g;
	}
 
	return -1;
}

function array_replace(_arr,_old,_new){
 
	var _pos = array_find_index(_arr, _old);
 
	if (_pos == -1)
	return -1;
 
	_arr [@ _pos] = _new;
}



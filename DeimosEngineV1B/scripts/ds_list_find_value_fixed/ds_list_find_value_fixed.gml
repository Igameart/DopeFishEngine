function ds_list_find_value_fixed(argument0, argument1) {
	var val = ds_list_find_value(argument0,argument1);
	if is_undefined(val) val = 0;
	return val;



}

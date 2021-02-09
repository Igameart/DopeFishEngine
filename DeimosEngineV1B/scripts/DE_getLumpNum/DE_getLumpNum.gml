function DE_getLumpNum(argument0) {
	var lump=argument0;
	for(l=0;l<ds_list_size(wadDirectory);l+=1)
	if(ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name")=lump){
	//show_debug_message("NOTICE: Found Lump["+string(l)+"]: "+ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name"));
	return l;
	}



}

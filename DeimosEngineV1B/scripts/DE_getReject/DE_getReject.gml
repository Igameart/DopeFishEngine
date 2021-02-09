function DE_getReject(argument0, argument1) {
	var level=argument0,lump=argument1;
	//return -1; // XXX This is no doubt wrong, but is optional

	var reject=ds_list_build();
	ds_map_add(wad_levels,"reject",reject);

	var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

	var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

	//show_debug_message("NOTICE: ["+level+'] REJECT size '+string( size ));

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
	var rej=ds_map_build();
	ds_map_add(rej,"bit",buffer_read(wadbuff,buffer_u16));
	ds_list_add(reject,rej);
	}

	show_debug_message("NOTICE: ["+level+"] REJECT "+string( ds_list_size(reject) ));



}

function DE_getSsectors(argument0, argument1) {
	var level=argument0,lump=argument1;

	var ssectors=mapSSectors;//ds_list_build();

	var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

	var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
		var ssector=ds_map_build();
	    var count=buffer_read(wadbuff,buffer_u16)
	    var start=buffer_read(wadbuff,buffer_u16)
	    //show_debug_message("NOTICE: ["+level+"] SSECTOR Data: "+string( count)+","+string( start));
	    ds_map_add(ssector,"count",count);
	    ds_map_add(ssector,"start",start);

		ds_list_add(ssectors,ssector);

	}

	//show_debug_message("NOTICE: ["+level+"] SSECTORS "+string( ds_list_size(ds_map_find_value_fixed(wadlevel,"ssectors")) ));



}

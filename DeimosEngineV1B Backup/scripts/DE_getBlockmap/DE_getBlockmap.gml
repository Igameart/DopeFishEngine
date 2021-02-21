function DE_getBlockmap(argument0, argument1) {
	var level=argument0,lump=argument1
	buffer_seek(wadbuff,buffer_seek_start,ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos"));


	//var id_=buffer_read_string(wadbuff,4);
	//var numlumps=buffer_read(wadbuff,buffer_u32);
	//var infotableofs=buffer_read(wadbuff,buffer_u32);

	var len=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos")+ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

	blockmap=ds_map_build();
	offsets=ds_list_build();
	ds_map_add(wad_levels,"blockmap",blockmap);


	ds_map_add(blockmap,"x",buffer_read(wadbuff,buffer_u16))
	ds_map_add(blockmap,"y",buffer_read(wadbuff,buffer_u16))
	ds_map_add(blockmap,"cols",buffer_read(wadbuff,buffer_u16))
	ds_map_add(blockmap,"rows",buffer_read(wadbuff,buffer_u16))
	ds_map_add(blockmap,"offsets",offsets);

	while(buffer_tell(wadbuff)<len)
	//this.wad.levels[level].blockmap.offsets.push(this.view.getUint16());
	ds_list_add(offsets,buffer_read(wadbuff,buffer_u16));
	//if(wadLoader.debug)
	show_debug_message("NOTICE: ["+level+"] BLOCKMAP Offsets: "+string(ds_list_size(offsets)));




}

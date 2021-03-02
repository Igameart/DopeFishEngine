function DE_getBlockmap( level, lump ) {
	
	buffer_seek( wadbuff, buffer_seek_start, ds_list_find_value_fixed(wadDirectory,lump).filepos );

	var len = ds_list_find_value_fixed(wadDirectory,lump).filepos + ds_list_find_value_fixed(wadDirectory,lump).size;

	var blockmap = struct_copy(blocktype);
	var offsets = ds_list_build();
	wadlevel.blockmap = blockmap;


	blockmap.x = buffer_read(wadbuff,buffer_u16);
	blockmap.y = buffer_read(wadbuff,buffer_u16);
	blockmap.cols = buffer_read(wadbuff,buffer_u16);
	blockmap.rows = buffer_read(wadbuff,buffer_u16);
	blockmap.offsets = offsets;

	while(buffer_tell(wadbuff)<len){
		//this.wad.levels[level].blockmap.offsets.push(this.view.getUint16());
		ds_list_add(offsets,buffer_read(wadbuff,buffer_u16));
	}
	
	//if(wadLoader.debug)
	show_debug_message("NOTICE: ["+level+"] BLOCKMAP Offsets: "+string(ds_list_size(offsets)));




}

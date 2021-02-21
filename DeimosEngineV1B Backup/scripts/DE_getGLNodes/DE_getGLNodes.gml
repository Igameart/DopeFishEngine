function DE_getGLNodes(argument0, argument1) {
	var level=argument0,lump=argument1+(WAD_FORMAT=="DOOM"?0:1);

	var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

	var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	//wadGLVersion=buffer_read_string(wadbuff,4);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
		var glnode=ds_map_build();

		var C_R,C_L;
	
		ds_map_add(glnode,"x",buffer_read(wadbuff,buffer_s16));
		ds_map_add(glnode,"y",-buffer_read(wadbuff,buffer_s16));
		ds_map_add(glnode,"dx",buffer_read(wadbuff,buffer_s16));
		ds_map_add(glnode,"dy",-buffer_read(wadbuff,buffer_s16));
	
		var list1=ds_list_build();
		ds_list_add(list1,-buffer_read(wadbuff,buffer_s16));
		ds_list_add(list1,-buffer_read(wadbuff,buffer_s16));
		ds_list_add(list1,buffer_read(wadbuff,buffer_s16));
		ds_list_add(list1,buffer_read(wadbuff,buffer_s16));
	
		var list2=ds_list_build();
		ds_list_add(list2,-buffer_read(wadbuff,buffer_s16));
		ds_list_add(list2,-buffer_read(wadbuff,buffer_s16));
		ds_list_add(list2,buffer_read(wadbuff,buffer_s16));
		ds_list_add(list2,buffer_read(wadbuff,buffer_s16));
	
	
		ds_map_add(glnode,"bbox",[list1,list2]);

		//var crSSect,clSSect;
	
		if(wadGLVersion == 5){
	
			C_R = buffer_read(wadbuff,buffer_u32);// Version 5 32bit
			C_L = buffer_read(wadbuff,buffer_u32);// Version 5 32bit
			CHILD_IS_SUBSEC = (1 << 31);
			CHILD_SUBSEC_MASK = ((1 << 31) - 1);

		}else{
		
			C_R = buffer_read(wadbuff,buffer_u16);
			C_L = buffer_read(wadbuff,buffer_u16);
			CHILD_IS_SUBSEC = (1 << 15);
			CHILD_SUBSEC_MASK = ((1 << 15) - 1);
		}

		glnode[?"children"] = [C_R,C_L];

		ds_list_add(mapGLNodes,glnode);

	}

	numGLNodes = ds_list_size(mapGLNodes);

	show_debug_message("NOTICE: ["+level+"] GL_NODES "+string( ds_list_size(mapGLNodes)));


}

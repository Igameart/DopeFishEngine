function DE_getReject(level, lump) {

	ds_map_add(wad_levels,"reject",mapReject);
	
	var __LDat = ds_list_find_value_fixed(wadDirectory,lump);

	var pos=ds_map_find_value_fixed(__LDat,"filepos");

	var size=ds_map_find_value_fixed(__LDat,"size");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
		
		var __byte = buffer_read(wadbuff,buffer_bool);
		
		var __bit = 0;
		repeat 8{
			var __bval = bit_get(__byte,__bit++);
			//trace(__bval);
			ds_list_add(mapReject,__bval);
		}
	}

	show_debug_message("NOTICE: ["+level+"] REJECT "+string( ds_list_size( mapReject ) ));
	//ds_list_print(mapReject);

}

function DE_checkReject( __Sect1, __Sect2 ){
	
	var __rCheck = mapReject[| __Sect1 * __Sect2 ];
	
	//trace("Checking REJECT:",__Sect1, __Sect2,__rCheck);
	
	return __rCheck;
	
}


function DE_getGLPVIS(level, lump) {

	ds_map_add(wad_levels,"gl_pvis",mapPVIS);
	
	var __LDat = ds_list_find_value_fixed(wadDirectory,lump);

	var pos=ds_map_find_value_fixed(__LDat,"filepos");

	var size=ds_map_find_value_fixed(__LDat,"size");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
		
		var __byte = buffer_read(wadbuff,buffer_bool);
				
		
		ds_list_add(mapPVIS, __byte);
		
		/*repeat 8{
			var __bval = bit_get(__byte,__bit++);
			//trace(__bval);
			ds_list_add(mapPVIS,__bval);
		}*/
	}

	show_debug_message("NOTICE: ["+level+"] GL_PVS "+string( size ));
	//ds_list_print(mapReject);

}

function DE_checkPVS( view_sub, i ){
	
    //byte *vis_data;   	// PVS lump
	
	var numsubsectors = ds_list_size(mapSSectors);
    
	var vis = mapPVIS[| ((numsubsectors + 7) / 8) * i];
    
    if (byte_get_bit(vis,i >> 3) & (1 << (i & 7)))
    {
        // Subsector is visible
		return true;
    }
    else
    {
        // Subsector is not visible
		return false;
    }
	
}


function DE_getFlatTextures() {
	var l,b;
	//this.wad.flats=[];

	var readflats=false;
	var size = ds_list_size(wadDirectory);
	for(l=0;l<size;l+=1){
	
	    var lump=ds_list_find_value_fixed(wadDirectory,l);
	    var n=ds_map_find_value_fixed(lump,"name");
	
	    switch(n){
		
	        case "F_START":		readflats=true; break;
	        case "FF_START":	readflats=true; break;
	        case "F1_START":	readflats=true; break;
	        case "F2_START":	readflats=true; break;
	        case "F3_START":	readflats=true; break;
	        case "F4_START":	readflats=true; break;
	        case "F5_START":	readflats=true; break;
	        case "F6_START":	readflats=true; break;
		
			case "F_END":		readflats=false; break;
			case "FF_END":		readflats=false; break;
			case "F1_END":		readflats=false; break;
			case "F2_END":		readflats=false; break;
			case "F3_END":		readflats=false; break;
			case "F4_END":		readflats=false; break;
			case "F5_END":		readflats=false; break;
			case "F6_END":		readflats=false; break;
	    }
	
		if(readflats){
			
	        buffer_seek(wadbuff,buffer_seek_start,ds_map_find_value_fixed(lump,"filepos"));
	        var flat=ds_list_build();
			show_debug_message("NOTICE: Found FLAT:"+n);
			
	        repeat 4096{
	            ds_list_add(flat,buffer_read(wadbuff,buffer_u8));
	        }
			
	        flats_[?n]=flat;
			
			
	    }
	}


	show_debug_message("NOTICE: Found "+string(ds_map_size(flats_))+" FLATS.");



}

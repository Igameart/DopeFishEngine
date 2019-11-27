
buffer_seek(wadbuff,buffer_seek_start, ds_map_find_value_fixed(wadHeader,"infotableofs"));

//var id_=buffer_read_string(wadbuff,4);
//var numlumps=buffer_read(wadbuff,buffer_u32);
//var infotableofs=buffer_read(wadbuff,buffer_u32);

wadDirectory=ds_list_build();
var l;
for(l=0;l<ds_map_find_value_fixed(wadHeader,"numlumps");l+=1){
        var _directory=ds_map_build();
        ds_map_add(_directory,"filepos",buffer_read(wadbuff,buffer_u32) );
        ds_map_add(_directory,"size",buffer_read(wadbuff,buffer_u32) );
		var name = string_upper(buffer_read_string(wadbuff,8));
		
		trace( "Discovered Lump " + name );
		
		if name == "BEHAVIOR"{
			trace("Hexen Formatted Level!");
			WAD_FORMAT = "HEXEN";
		}
		
        ds_map_add(_directory,"name",name );
        
        //if ds_map_find_value_fixed(_directory,"name")="E1M1"
        //show_debug_message("NOTICE: Got Directory Size: "+string(ds_map_find_value_fixed(_directory,"filepos") ) );
        
        ds_list_add(wadDirectory,_directory);
}


//show_debug_message("NOTICE: Got Directory: "+string(ds_list_size(wadDirectory))+" Entries");

//show_debug_message("Directory Name in WAD: "+string(ds_map_find_value_fixed(wadDirectory[l],"name")));

if(ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l-1),"name")!="F_END"){
//show_debug_message("Unexpected end of Directory Marker: "+ ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l-1),"name"))
//JSON.stringify(this.wad.directory[this.wad.directory.length-1]);
}

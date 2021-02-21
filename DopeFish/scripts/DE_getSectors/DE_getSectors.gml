function DE_getSectors(argument0, argument1) {
	var level=argument0,lump=argument1;

	var sectors=mapSectors;//ds_list_build();
	//mapSectors = sectors;


	var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

	var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;
	var l = 0;
	while(buffer_tell(wadbuff)<len){
	
		var sector =ds_map_build();
		var _floor = buffer_read(wadbuff,buffer_s16);
		var _ceiling = buffer_read(wadbuff,buffer_s16);
		var _texF = string_upper(buffer_read_string(wadbuff,8));
		var _texC = string_upper(buffer_read_string(wadbuff,8));
		var _light = buffer_read(wadbuff,buffer_u16);
		var _type = buffer_read(wadbuff,buffer_u16);
		var _tag = buffer_read(wadbuff,buffer_u16);
		
		//If sector is not tagged -1, then we need to do something with it
		//Save this sector to a list for quick retrieval later!
		if ( _tag != -1 ){
			DE_addSectorToTag(l,_tag);
		}

		ds_map_add(sector,"floor",_floor);
		ds_map_add(sector,"ceiling",_ceiling);
		ds_map_add(sector,"height",_ceiling-_floor);

		ds_map_add(sector,"tex_f",_texF);
		ds_map_add(sector,"tex_c",_texC);
		ds_map_add(sector,"lightlevel",_light);
		ds_map_add(sector,"type",_type);
		ds_map_add(sector,"tag",_tag);
		ds_map_add(sector,"lift",0);
		ds_map_add(sector,"crush",0);

		var coltris = ds_list_build();//Create a Collision Map

		ds_map_add(sector,"colmap",coltris);//assign the Collision map
	
		ds_list_add(sectors,sector);
		l+=1;

	}

	show_debug_message("NOTICE: ["+level+"] SECTORS "+string( ds_list_size(sectors) ));

}

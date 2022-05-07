function DE_getSectors(argument0, argument1) {
	var level=argument0,lump=argument1;

	var sectors=mapSectors;//ds_list_build();
	//mapSectors = sectors;


	var pos = ds_list_find_value_fixed(wadDirectory,lump).filepos;

	var size = ds_list_find_value_fixed(wadDirectory,lump).size;

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;
	var l = 0;
	while(buffer_tell(wadbuff)<len){
	
		var sector = struct_copy(sectortype);
		sector.floorz			= buffer_read(wadbuff,buffer_s16);
		sector.ceilingz			= buffer_read(wadbuff,buffer_s16);
		
		
		sector.floorpicnum		= string_upper(buffer_read_string(wadbuff,8));
		sector.ceilingpicnum	= string_upper(buffer_read_string(wadbuff,8));
		var _light				= buffer_read(wadbuff,buffer_s16);
		sector.ceilingshade		= _light;
		sector.floorshade		= _light;
		
		
		sector.specialtype		= buffer_read(wadbuff,buffer_u16);
		sector.tag				= buffer_read(wadbuff,buffer_u16);
		
		//If sector is not tagged -1, then we need to do something with it
		//Save this sector to a list for quick retrieval later!
		if ( sector.tag != -1 ){
			DE_addSectorToTag(l,sector.tag);
		}
		
		sector.ftexz = -( LittleLong(sector.floorz) << 8);
		sector.ctexz = -( LittleLong(sector.ceilingz) << 8);

		var coltris = ds_list_build();//Create a Collision Map

		sector.colmap = coltris;//assign the Collision map
	
		ds_list_add(sectors,sector);
		l+=1;

	}

	show_debug_message("NOTICE: ["+level+"] SECTORS "+string( ds_list_size(sectors) ));

}

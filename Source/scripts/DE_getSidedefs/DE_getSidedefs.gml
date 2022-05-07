function DE_getSidedefs(argument0, argument1) {
	var level=argument0,lump=argument1;

	var sidedefs=mapSidedefs;//ds_list_build();

	var pos=(ds_list_find_value_fixed(wadDirectory,lump).filepos);

	var size=(ds_list_find_value_fixed(wadDirectory,lump).size);

	trace("NOTICE: ["+level+"] sidedefs size "+string( size ));

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;
	l=0;
	while(buffer_tell(wadbuff)<len){
		var side = struct_copy(sidetype);
		
		var xx,yy;
		
		xx=buffer_read(wadbuff,buffer_s16);
		yy=buffer_read(wadbuff,buffer_s16);
		
		//if yy<0 show_message("Side Y Offset Less Than Zero "+string(yy));

		side.xoff	= xx;
		side.yoff	= yy;
		side.uptex	= string_upper(buffer_read_string(wadbuff,8));
		side.lowtex = string_upper(buffer_read_string(wadbuff,8));
		side.midtex = string_upper(buffer_read_string(wadbuff,8));
		side.sector = buffer_read(wadbuff,buffer_u16);
	
		ds_list_add(sidedefs,side);
		
		l+=1;
	}

	trace("NOTICE: ["+level+"] SIDEDEFS "+string( ds_list_size(sidedefs) ));



}

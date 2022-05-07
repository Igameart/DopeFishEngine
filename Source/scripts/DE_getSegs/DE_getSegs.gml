function DE_getSegs(argument0, argument1) {
	var level=argument0,lump=argument1;
	return -1; // XXX This is no doubt wrong, but is optional

	var segs=mapSegs;

	var pos=(ds_list_find_value_fixed(wadDirectory,lump).filepos);

	var size=(ds_list_find_value_fixed(wadDirectory,lump).size);

	trace("NOTICE: ["+level+"] SEGS size "+string( size ));

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
	var seg= struct_copy(segtype);
	
	seg.startv = buffer_read(wadbuff,buffer_u16);
	seg.endv = buffer_read(wadbuff,buffer_u16);
	seg.angle = buffer_read(wadbuff,buffer_u16); //Uint not Int
	seg.linedef = buffer_read(wadbuff,buffer_u16);
	seg.side = buffer_read(wadbuff,buffer_s16);
	seg.offset = buffer_read(wadbuff,buffer_s16);

	ds_list_add(segs,seg);
	};

	trace("NOTICE: ["+level+"] SEGS "+string( ds_list_size(segs) ));



}

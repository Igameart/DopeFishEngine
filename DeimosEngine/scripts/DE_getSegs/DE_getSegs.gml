var level=argument0,lump=argument1;
//return -1; // XXX This is no doubt wrong, but is optional

var segs=mapSegs;

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

//show_debug_message("NOTICE: ["+level+'] SEGS size '+string( size ));

buffer_seek(wadbuff,buffer_seek_start,pos);

var len=pos+size;

while(buffer_tell(wadbuff)<len){
var seg=ds_map_build();
ds_map_add(seg,"start",buffer_read(wadbuff,buffer_u16));
ds_map_add(seg,"end",buffer_read(wadbuff,buffer_u16));
ds_map_add(seg,"angle",buffer_read(wadbuff,buffer_u16)); //Uint not Int
ds_map_add(seg,"linedef",buffer_read(wadbuff,buffer_u16));
ds_map_add(seg,"side",buffer_read(wadbuff,buffer_s16));
ds_map_add(seg,"offset",buffer_read(wadbuff,buffer_s16));

ds_list_add(segs,seg);
};

show_debug_message("NOTICE: ["+level+"] SEGS "+string( ds_list_size(segs) ));

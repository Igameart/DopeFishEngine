//wadLoader.getHeader=function(){
//this.view.seek(0);

//file_bin_seek(wad,0);

buffer_seek(wadbuff,buffer_seek_start, 0);
var id_=buffer_read_string(wadbuff,4);
var numlumps=buffer_read(wadbuff,buffer_u32);
var infotableofs=buffer_read(wadbuff,buffer_u32);

ds_map_add(wadHeader,"id",id_);
ds_map_add(wadHeader,"numlumps",numlumps);
ds_map_add(wadHeader,"infotableofs",infotableofs);

show_debug_message("NOTICE: Got Header: "+ds_map_write(wadHeader));
if(id_!="IWAD")
	show_debug_message("Unsupported WAD format: "+ds_map_find_value_fixed(wadHeader,"id"));
else{
	show_debug_message("Supported WAD format: "+ds_map_find_value_fixed(wadHeader,"id"));
	show_debug_message("Numberof Lumps in WAD: "+string(ds_map_find_value_fixed(wadHeader,"numlumps")));
	show_debug_message("Info Table Offset in WAD: "+string(ds_map_find_value_fixed(wadHeader,"infotableofs")));
}

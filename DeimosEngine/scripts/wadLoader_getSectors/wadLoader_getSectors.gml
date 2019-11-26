var level=argument0,lump=argument1;

var sectors=ds_list_build();

ds_map_add(wad_levels,"sectors",sectors);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

//show_debug_message("NOTICE: ["+level+'] sectors size '+string( size ));

buffer_seek(wadbuff,buffer_seek_start,pos);

var len=pos+size;
l=0;
while(buffer_tell(wadbuff)<len){
var sector =ds_map_build();
ds_map_add(sector,"floor",buffer_read(wadbuff,buffer_s16))
ds_map_add(sector,"ceiling",buffer_read(wadbuff,buffer_s16))
ds_map_add(sector,"tex_f",string_upper(buffer_read_string(wadbuff,8)))
ds_map_add(sector,"tex_c",string_upper(buffer_read_string(wadbuff,8)))
ds_map_add(sector,"lightlevel",buffer_read(wadbuff,buffer_u16))
ds_map_add(sector,"type",buffer_read(wadbuff,buffer_u16))
ds_map_add(sector,"tag",buffer_read(wadbuff,buffer_u16))
ds_map_add(sector,"lift",0);
ds_map_add(sector,"crush",0);

var coltris =ds_list_build();//Create a Collision Map

ds_map_add(sector,"colmap",coltris);//assign the Collision map

//if l=0{
//show_debug_message("NOTICE: ["+level+'] SECTORS tex_f '+string(ds_map_find_value_fixed(sector,"tex_f")) );
//}
ds_list_add(sectors,sector);
l+=1;

}

show_debug_message("NOTICE: ["+level+"] SECTORS "+string( ds_list_size(sectors) ));


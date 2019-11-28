var level=argument0,lump=argument1;

var sidedefs=ds_list_build();
mapSidedefs = sidedefs;

ds_map_add(wad_levels,"sidedefs",sidedefs);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

//show_debug_message("NOTICE: ["+level+'] sidedefs size '+string( size ));

buffer_seek(wadbuff,buffer_seek_start,pos);

var len=pos+size;
l=0;
while(buffer_tell(wadbuff)<len){
var side=ds_map_build();
var xx,yy;
xx=buffer_read(wadbuff,buffer_s16);
yy=buffer_read(wadbuff,buffer_s16);

ds_map_add(side,"X_",xx);
ds_map_add(side,"Y_",yy);
ds_map_add(side,"tex_u",string_upper(buffer_read_string(wadbuff,8)))
ds_map_add(side,"tex_l",string_upper(buffer_read_string(wadbuff,8)))
ds_map_add(side,"tex_m",string_upper(buffer_read_string(wadbuff,8)))
ds_map_add(side,"sector",buffer_read(wadbuff,buffer_u16))

//if l=0{
//show_debug_message("NOTICE: ["+level+'] SIDEDEFS x '+string(ds_map_find_value(side,"X_")) );
//show_debug_message("NOTICE: ["+level+'] SIDEDEFS y '+string(ds_map_find_value(side,"Y_")) );
//show_debug_message("NOTICE: ["+level+'] SIDEDEFS tex_m '+ds_map_find_value_fixed(side,"tex_m") );
//}
ds_list_add(sidedefs,side);
l+=1;
}

show_debug_message("NOTICE: ["+level+"] SIDEDEFS "+string( ds_list_size(sidedefs) ));

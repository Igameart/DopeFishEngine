var level=argument0,lump=argument1+(WAD_FORMAT=="DOOM"?0:1);

var glnodes=ds_list_build();
ds_map_add(wad_levels,"glnodes",glnodes);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

buffer_seek(wadbuff,buffer_seek_start,pos);

glversion=buffer_read_string(wadbuff,4);

var len=pos+size;

while(buffer_tell(wadbuff)<len){
var glnode=ds_map_build();

if(glversion=="gNd5"){

ds_map_add(glnode,"x",buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"y",-buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"dx",buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"dy",-buffer_read(wadbuff,buffer_s16));
list1=ds_list_build();
ds_map_add(glnode,"bb_r",list1);
ds_list_add(list1,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list1,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list1,buffer_read(wadbuff,buffer_s16));
ds_list_add(list1,buffer_read(wadbuff,buffer_s16));
list2=ds_list_build();
ds_map_add(glnode,"bb_l",list1);
ds_list_add(list2,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list2,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list2,buffer_read(wadbuff,buffer_s16));
ds_list_add(list2,buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"c_r",buffer_read(wadbuff,buffer_u32));// Version 5 32bit
ds_map_add(glnode,"c_l",buffer_read(wadbuff,buffer_u32));// Version 5 32bit
ds_map_add(glnode,"sector","null");

}else{

ds_map_add(glnode,"x",buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"y",-buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"dx",buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"dy",-buffer_read(wadbuff,buffer_s16));
list1=ds_list_build();
ds_map_add(glnode,"bb_r",list1);
ds_list_add(list1,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list1,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list1,buffer_read(wadbuff,buffer_s16));
ds_list_add(list1,buffer_read(wadbuff,buffer_s16));
list2=ds_list_build();
ds_map_add(glnode,"bb_l",list1);
ds_list_add(list2,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list2,-buffer_read(wadbuff,buffer_s16));
ds_list_add(list2,buffer_read(wadbuff,buffer_s16));
ds_list_add(list2,buffer_read(wadbuff,buffer_s16));
ds_map_add(glnode,"c_r",buffer_read(wadbuff,buffer_u16));
ds_map_add(glnode,"c_l",buffer_read(wadbuff,buffer_u16));
ds_map_add(glnode,"sector","null");

}

ds_list_add(glnodes,glnode);

}
//if(wadLoader.debug)
//he3d.log("NOTICE",'['+level+'] GL_NODES',this.wad.levels[level].glnodes.length);
//};
show_debug_message("NOTICE: ["+level+"] GL_NODES "+string( ds_list_size(glnodes)));

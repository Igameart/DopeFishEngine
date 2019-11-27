var level=argument0,lump=argument1;

mapVertexes=ds_list_build();
ds_map_add(wad_levels,"vertexes",mapVertexes);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

buffer_seek(wadbuff,buffer_seek_start,pos);

var len=pos+size;

num=0;
while(buffer_tell(wadbuff)<len){
var vert=ds_map_build();

ds_map_add(vert,"x",buffer_read(wadbuff,buffer_s16));
var YY=-buffer_read(wadbuff,buffer_s16);
ds_map_add(vert,"y",YY);

if num=2{
show_debug_message("NOTICE: ["+level+"] VERTEX 0 X position "+string( (ds_map_find_value_fixed(vert,"x")) ));
show_debug_message("NOTICE: ["+level+"] VERTEX 0 Y position "+string( YY ));
}
num+=1
ds_list_add(mapVertexes,vert);

}

show_debug_message("NOTICE: ["+level+"] VERTEXES "+string( ds_list_size(mapVertexes) ));


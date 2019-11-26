var level=argument0,lump=argument1;

var things=ds_list_build();

mapThings = things;

ds_map_add(wad_levels,"things",things);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

//show_debug_message("NOTICE: ["+level+'] sectors start '+string( pos ));
//show_debug_message("NOTICE: ["+level+'] sectors end '+string( size ));

buffer_seek(wadbuff,buffer_seek_start,pos);

var len=pos+size;
l=0;
while(buffer_tell(wadbuff)<len){
var thing =ds_map_build();

ds_map_add(thing,"x",buffer_read(wadbuff,buffer_s16))
ds_map_add(thing,"y",-999)
ds_map_add(thing,"z",-buffer_read(wadbuff,buffer_s16))
ds_map_add(thing,"angle",buffer_read(wadbuff,buffer_s16))
ds_map_add(thing,"type",buffer_read(wadbuff,buffer_s16))
ds_map_add(thing,"flags",buffer_read(wadbuff,buffer_s16))

ds_list_add(things,thing);

// Bit Shift flags
var flags=ds_map_find_value_fixed(thing,"flags");
var flagmap=ds_map_build();

//CONTINUE HERE

ds_map_add(flagmap,"skill1_2",(flags&(1<<0)!=0));
ds_map_add(flagmap,"skill3",(flags&(1<<1)!=0));
ds_map_add(flagmap,"skill4_5",(flags&(1<<2)!=0));
ds_map_add(flagmap,"deaf",(flags&(1<<3)!=0));
ds_map_add(flagmap,"mponly",(flags&(1<<4)!=0));

ds_map_replace(thing,"flags",flagmap);

if l=137{
show_debug_message("NOTICE: ["+level+"] THING 137 ANGLE "+string( ds_map_find_value_fixed(thing,"angle" )));

}
l+=1;

};
show_debug_message("NOTICE: ["+level+"] THINGS "+string( ds_list_size(ds_map_find_value_fixed(wad_levels,"things")) ));

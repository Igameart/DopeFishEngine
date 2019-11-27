var level=argument0,lump=argument1+(WAD_FORMAT=="DOOM"?0:1);

mapGLSSects=ds_list_build();

ds_map_add(wad_levels,"glssects",mapGLSSects);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

buffer_seek(wadbuff,buffer_seek_start,pos);

show_debug_message("NOTICE: ["+level+"] GL_SSECT wadGLVersion "+string( wadGLVersion));
var len=pos+size;

while(buffer_tell(wadbuff)<len){
    var glssect=ds_map_build();
	
    if(wadGLVersion==3){
        var count=buffer_read(wadbuff,buffer_u32)
        var start=buffer_read(wadbuff,buffer_u32)
        ds_map_add(glssect,"count",count);
        ds_map_add(glssect,"first_seg",start);
    }
    
    if(wadGLVersion<=2){
        var count=buffer_read(wadbuff,buffer_u16)
        var start=buffer_read(wadbuff,buffer_u16)
        ds_map_add(glssect,"count",count);
        ds_map_add(glssect,"first_seg",start);
    }
    ds_list_add(mapGLSSects,glssect);
}

show_debug_message("NOTICE: ["+level+"] GL_SSECT "+string( ds_list_size(mapGLSSects)));

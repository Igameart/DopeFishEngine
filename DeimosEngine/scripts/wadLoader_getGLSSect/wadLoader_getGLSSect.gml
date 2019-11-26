var level=argument0,lump=argument1+(WAD_FORMAT=="DOOM"?0:1);

var glssects=ds_list_build();
ds_map_add(wad_levels,"glssects",glssects);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

buffer_seek(wadbuff,buffer_seek_start,pos);

//glversion=buffer_read_string(wadbuff,4);
//glversion=real(string_digits(glversion));
show_debug_message("NOTICE: ["+level+"] GL_SSECT GLversion "+string( glversion));
var len=pos+size;

while(buffer_tell(wadbuff)<len){
    var glssect=ds_map_build();
    //show_debug_message("NOTICE: ["+level+'] GL_SSECT Name '+string( glssect));
    if(glversion==3){
    
        var count=buffer_read(wadbuff,buffer_u32)
        var start=buffer_read(wadbuff,buffer_u32)
        show_debug_message("NOTICE: ["+level+"] GL_SSECT 3 Count "+string( count));
        //show_debug_message("NOTICE: ["+level+'] GL_SSECT Start '+string( start));
        ds_map_add(glssect,"count",count);
        ds_map_add(glssect,"start",start);
    
    }
    
    if(glversion<=2){
    
        var count=buffer_read(wadbuff,buffer_u16)
        var start=buffer_read(wadbuff,buffer_u16)
        show_debug_message("NOTICE: ["+level+"] GL_SSECT 2 Count "+string( count));
        //show_debug_message("NOTICE: ["+level+'] GL_SSECT Start '+string( start));
        ds_map_add(glssect,"count",count);
        ds_map_add(glssect,"start",start);
    
    }
    
    ds_list_add(glssects,glssect);
    
}

show_debug_message("NOTICE: ["+level+"] GL_SSECT "+string( ds_list_size(glssects)));

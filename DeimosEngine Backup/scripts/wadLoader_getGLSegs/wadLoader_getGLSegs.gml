var level=argument0,lump=argument1+(WAD_FORMAT=="DOOM"?0:1);

mapGLSegs=ds_list_build();
ds_map_add(wad_levels,"glsegs",mapGLSegs);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

buffer_seek(wadbuff,buffer_seek_start,pos);

show_debug_message("NOTICE: ["+level+"] GL_SEGS GL_VERSION gNd"+string( wadGLVersion ));

var len=pos+size;

while(buffer_tell(wadbuff)<len){
var glseg=ds_map_build();
if(wadGLVersion==3 or wadGLVersion==5){

    if wadGLVersion==3 VERT_IS_GL = (1 << 30);
    if wadGLVersion==5 VERT_IS_GL = (1 << 31);
    var val;
    val=real(buffer_read(wadbuff,buffer_u32));
    ds_map_add(glseg,"start",val);
    val=real(buffer_read(wadbuff,buffer_u32));
    ds_map_add(glseg,"end",val);
    val=real(buffer_read(wadbuff,buffer_u16));
    ds_map_add(glseg,"linedef",val);
    val=real(buffer_read(wadbuff,buffer_u16));
    ds_map_add(glseg,"side",val);
    val=real(buffer_read(wadbuff,buffer_u32));
    ds_map_add(glseg,"partner",val);

}
if(wadGLVersion<=2){
    VERT_IS_GL = (1 << 15);
    var val;
    val=real(buffer_read(wadbuff,buffer_u16));
    ds_map_add(glseg,"start",val);
    val=real(buffer_read(wadbuff,buffer_u16))
    ds_map_add(glseg,"end",val);
    val=real(buffer_read(wadbuff,buffer_u16));
    ds_map_add(glseg,"linedef",val);
    val=real(buffer_read(wadbuff,buffer_u16));
    ds_map_add(glseg,"side",val);
    val=real(buffer_read(wadbuff,buffer_u16));
    ds_map_add(glseg,"partner",val);

}

ds_list_add(mapGLSegs,glseg);

}
show_debug_message("NOTICE: ["+level+"] GL_SEGS "+string( ds_list_size(mapGLSegs)));


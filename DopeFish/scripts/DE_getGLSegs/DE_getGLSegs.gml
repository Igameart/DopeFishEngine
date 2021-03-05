function DE_getGLSegs(argument0, argument1) {
	var level=argument0,lump=argument1+(WAD_FORMAT=="DOOM"?0:1);

	var glsegs = mapGLSegs;

	var pos = ds_list_find_value_fixed(wadDirectory,lump).filepos;

	var size = ds_list_find_value_fixed(wadDirectory,lump).size;

	buffer_seek(wadbuff,buffer_seek_start,pos);

	show_debug_message("NOTICE: ["+level+"] GL_SEGS GL_VERSION gNd"+string( wadGLVersion ));

	var len = pos+size;

	while(buffer_tell(wadbuff)<len){
		
	var glseg = struct_copy(glsegtype);
	
	if(wadGLVersion==3 or wadGLVersion==5){

	    if wadGLVersion==3 VERT_IS_GL = (1 << 30);
	    if wadGLVersion==5 VERT_IS_GL = (1 << 31);
		
	    var val;
	    val=real(buffer_read(wadbuff,buffer_u32));
	    glseg.startv = val;
		
	    val=real(buffer_read(wadbuff,buffer_u32));
	    glseg.endv = val;
		
	    val=real(buffer_read(wadbuff,buffer_u16));
	    glseg.linedef = val;
		
	    val=real(buffer_read(wadbuff,buffer_u16));
	    glseg.side = val;
		
	    val=real(buffer_read(wadbuff,buffer_u32));
	    glseg.partner = val;

	}
	
	if(wadGLVersion<=2){
	    VERT_IS_GL = (1 << 15);
		
	    var val;
	    val=real(buffer_read(wadbuff,buffer_u16));
	    glseg.startv = val;
		
	    val=real(buffer_read(wadbuff,buffer_u16))
	    glseg.endv = val;
		
	    val=real(buffer_read(wadbuff,buffer_u16));
	    glseg.linedef = val;
		
	    val=real(buffer_read(wadbuff,buffer_u16));
	    glseg.side = val;
		
	    val=real(buffer_read(wadbuff,buffer_u16));
	    glseg.partner = val;

	}

	ds_list_add(glsegs,glseg);

	}
	show_debug_message("NOTICE: ["+level+"] GL_SEGS "+string( ds_list_size(glsegs)));




}

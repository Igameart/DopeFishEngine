function DE_getGLSSect(argument0, argument1) {
	var level = argument0, lump = argument1 + ( WAD_FORMAT == "DOOM"? 0 : 1 );

	var glssects=mapGLSSects;

	var pos=ds_list_find_value_fixed(wadDirectory,lump).filepos;

	var size=ds_list_find_value_fixed(wadDirectory,lump).size;

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
	    var glssect = struct_copy(glssecttype);
		
	    if(wadGLVersion==3){
	        glssect.count=buffer_read(wadbuff,buffer_u32)
	        glssect.start=buffer_read(wadbuff,buffer_u32)
	    }
    
	    if(wadGLVersion<=2){
    
	       glssect.count=buffer_read(wadbuff,buffer_u16)
	       glssect.start=buffer_read(wadbuff,buffer_u16)
    
	    }
    
		
		var coltris = ds_list_build();//Create a Collision Map

		glssect.colmap = coltris;//assign the Collision map
	
	    ds_list_add(glssects,glssect);
    
	}

	show_debug_message("NOTICE: ["+level+"] GL_SSECT "+string( ds_list_size(glssects)));



}

function DE_getGLVerts(level, __lump) {
	
	var lump = __lump + (WAD_FORMAT=="DOOM"?0:1);

	var glverts=mapGLVerts;

	var pos=ds_list_find_value_fixed(wadDirectory,lump).filepos;

	var size=ds_list_find_value_fixed(wadDirectory,lump).size;

	buffer_seek(wadbuff,buffer_seek_start,pos);

	wadGLVersion=buffer_read_string(wadbuff,4);
	wadGLVersion = string_digits(wadGLVersion);

	if wadGLVersion!=""{
		
		wadGLVersion=real(wadGLVersion);

		var len=pos+size;

		num=0;
		while(buffer_tell(wadbuff)<len){
		    var glvert = struct_copy(glverttype);
			
		    if(wadGLVersion>1){
		        glvert.xm=(buffer_read(wadbuff,buffer_s16));
		        glvert.x=(buffer_read(wadbuff,buffer_s16));
		        glvert.ym=-(buffer_read(wadbuff,buffer_s16));
		        glvert.y=-(buffer_read(wadbuff,buffer_s16));
		    }else{
		        glvert.x = (buffer_read(wadbuff,buffer_s16));
		        glvert.y = -(buffer_read(wadbuff,buffer_s16));
		    }
    
		    ds_list_add(glverts,glvert);

		}

		show_debug_message("NOTICE: ["+level+"] GL_VERT "+string( ds_list_size(glverts) ));

	}else wadGLVersion = -1;


}

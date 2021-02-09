function DE_getGLVerts(argument0, argument1) {
	var level=argument0,lump=argument1+(WAD_FORMAT=="DOOM"?0:1);

	var glverts=mapGLVerts;//ds_list_build();
	//mapGLVerts = glverts;


	var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

	var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	glversion=buffer_read_string(wadbuff,4);
	trace("NOTICE: GL Version " + glversion);
	glversion = string_digits(glversion);

	if glversion!=""{
		glversion=real(glversion);

		var len=pos+size;

		num=0;
		while(buffer_tell(wadbuff)<len){
		    var glvert=ds_map_build();
		    if(glversion>1){
		        ds_map_add(glvert,"xm",(buffer_read(wadbuff,buffer_s16)));
		        ds_map_add(glvert,"x",(buffer_read(wadbuff,buffer_s16)));
		        ds_map_add(glvert,"ym",-(buffer_read(wadbuff,buffer_s16)));
		        ds_map_add(glvert,"y",-(buffer_read(wadbuff,buffer_s16)));
		    }else{
		        ds_map_add(glvert,"x",(buffer_read(wadbuff,buffer_s16)));
		        ds_map_add(glvert,"y",-(buffer_read(wadbuff,buffer_s16)));
		    }
    
		    ds_list_add(glverts,glvert);

		}

		show_debug_message("NOTICE: ["+level+"] GL_VERT "+string( ds_list_size(glverts) ));

	}else glversion = -1;


}

function DE_getFile( e ) {
	
	var file=e;
	var filename=e;
	
	wadFile = file;

	repeat string_count("\\",wad)
	    wad = string_lower(split(wad,"\\"));
	
	var fileType = filename
	do{
		fileType=string_lower(split(fileType,"."));
	}until string_count(".",fileType)=0;
	
	trace("Map File Extension: "+fileType);

	if file_exists(file)=false{
	    trace("FATAL: Failed to retrieve Map:"+file);
	    return false;
	}else{
    
	    switch(fileType){
	        case "wad":
		        trace("SUCCESS: Retrieved Map:"+file);
		        wadbuff = buffer_load(file);
				var size = buffer_get_size(wadbuff)
				var tmpbuff = buffer_create(size, buffer_fixed, 1);
				
				buffer_copy(wadbuff, 0, size, tmpbuff, 0);
				
				buffer_delete(wadbuff);
				
				wadbuff = tmpbuff;
				
		        return true;
	        break;
	        default:
		        trace("WARNING: Unknown file type "+ fileType)
		        return false;
	        break;
	    };
	}
}

function DE_getHeader() {

	buffer_seek(wadbuff,buffer_seek_start, 0);
	
	wadHeader.id=buffer_read_string(wadbuff,4);
	wadHeader.numlumps=buffer_read(wadbuff,buffer_u32);
	wadHeader.infotableofs=buffer_read(wadbuff,buffer_u32);

	trace("NOTICE: Got Header: "+string( wadHeader ));
	
	if( wadHeader.id!="IWAD" )
		trace("Unsupported WAD format: "+(wadHeader.id));
	else{
		trace("Supported WAD format: "+(wadHeader.id));
		trace("Numberof Lumps in WAD: "+string((wadHeader.numlumps)));
		trace("Info Table Offset in WAD: "+string((wadHeader.infotableofs)));
	}

}

function DE_getDirectory() {

	buffer_seek(wadbuff,buffer_seek_start, (wadHeader.infotableofs));
	
	var l;
	for(l=0;l<(wadHeader.numlumps);l+=1){
		
	        var _directory = struct_copy(directorytype);
			_directory.filepos = buffer_read(wadbuff,buffer_u32);
			_directory.size = buffer_read(wadbuff,buffer_u32);
			
			var name = string_upper(buffer_read_string(wadbuff,8));
		
			if name == "BEHAVIOR" && WAD_FORMAT!="HEXEN"{
				WAD_FORMAT = "HEXEN";
				show_message("Hexen formatted maps will load, but you may experience issues with map interactions.\n(Hexen format integration is incomplete)");
			}
			
			if ( WAD_EPISODIC == true )
			if ( "MAP01" == name ){
				WAD_EPISODIC = false;
			}
			
			if string_count("GL_",name) > 0{
				WAD_ISGL = true;
			}
			
			
		
	        _directory.name = name;
	        ds_list_add(wadDirectory,_directory);
		
			wadDirectoryOfs[? name] = _directory.filepos;
			
			trace("NOTICE: Found Lump["+name+"]: ",_directory.filepos,_directory.size);
        
	}
	
	DE_getDecorateScript();
	DE_getLanguageData();
	DE_parseLanguagePrep();
	
	if WAD_ISGL == false{
		var __question = show_question("WARNING: GL Nodes not present. The map will not display correctly without them. Build them now?");
		
		if __question{
			var __tmpWad = wadFile;
			__question = show_question("Overwrite original wad?");
			
			if !__question{
				
				__tmpWad = get_save_filename("Doom Wad|*.wad",__tmpWad);
				
			}
				
			DE_glbspProcessWad(wadFile,__tmpWad);
			return false;
		}
	}
	
	return true;
	
}

function DE_getLevel(level) {
	
	var l,curl = 0,gotlevel=false;
	
	var l = ds_list_find_index(wadDirectory,level);
	
	if ( l != -1 ){
			
	    gotlevel=true;
        
	    trace("NOTICE: Found Level at Lump["+string(l)+"]: "+ (ds_list_find_value_fixed(wadDirectory,l).name ) );
			
	    curl=(ds_list_find_value_fixed(wadDirectory,l).name);
			
		trace("Retrieved Level:",curl,level);
			
	    wadlevel.name = curl;
	    wadlevel.lump = l;
			
	    //if(!is_bool(curl))
	    //continue;
    
	    /*switch(this.wad.directory[l].name){
	    case 'THINGS':getThings(curl,l);break;
	    case 'LINEDEFS':getLinedefs(curl,l);break;
	    case 'SIDEDEFS':getSidedefs(curl,l);break;
	    case 'VERTEXES':getVertexes(curl,l);break;
	    case 'SEGS':getSegs(curl,l);break;
	    case 'SSECTORS':getSsectors(curl,l);break;
	    case 'NODES':getNodes(curl,l);break;
	    case 'SECTORS':getSectors(curl,l);break;
	    case 'REJECT':getReject(curl,l);break;
	    case 'BLOCKMAP':getBlockmap(curl,l);break;
	    case 'GL_VERT':getGLVerts(curl,l);break;
	    case 'GL_SEGS':getGLSegs(curl,l);break;
	    case 'GL_SSECT':getGLSSect(curl,l);break;
	    case 'GL_NODES':getGLNodes(curl,l);break;
	    case 'GL_PVS':getGLPVS(curl,l);break;
	    }*/
	}
}

function DE_getLumpOfs(lump) {
	
	var ofs = wadDirectoryOfs[? lump ];
	
	trace("NOTICE: Lump["+lump+"] located at ",ofs);
	
	if ofs != undefined{
		return ofs;
	}
	
	return -1;
	
}

function DE_getLumpNum(lump) {
	
	/*var __index = ds_list_find_index(wadDirectory,lump);
	
	if __index == -1 return undefined else return __index;*/
	
	for ( var l=0;l<ds_list_size(wadDirectory);l+=1 )
		if ( ds_list_find_value_fixed(wadDirectory,l).name == lump ){
		trace("NOTICE: Found Lump["+string(l)+"]: "+(ds_list_find_value_fixed(wadDirectory,l).name));
		return l;
	}
}

function DE_getDecorateScript(){
	
	if wadGameInfo.decorate == undefined{
	
		var lpos = DE_getLumpOfs( "DECORATE" );
	
		if lpos == -1 return false;
	
		trace("NOTICE: Wad Contains Decorate Scripting");

		var len = ds_list_find_value_fixed(wadDirectory, DE_getLumpNum( "DECORATE" ) ).size;

		var __tmp = buffer_create(len,buffer_fixed,1);

		buffer_copy(wadbuff,lpos,len,__tmp,0);
	
		var str = buffer_read(__tmp,buffer_text);
	
		buffer_delete(__tmp);
	
		wadDecorate = string_split_on_delimiter(str,"\r\n");
	}else{
		var _file = program_directory +"gamedata/"+ wadGameInfo.decorate;
		
		file=file_text_open_read(_file);
		
		wadDecorate = ds_list_build();
		
		while (!file_text_eof(file)) {
		    
			var str = file_text_read_string(file);
			ds_list_add(wadDecorate,str);
		    
		    file_text_readln(file);
		}
		
	}
	
}

function DE_getMapInfo(){
	
	if wadGameInfo.mapinfo == undefined{
	
		var lpos = DE_getLumpOfs( "MAPINFO" );
	
		if lpos == -1{
			return false;
			DEtrace("NOTICE: Wad Contains No MapInfo");
		}
	
		DEtrace("NOTICE: Wad Contains MapInfo");

		var len = ds_list_find_value_fixed(wadDirectory, DE_getLumpNum( "MAPINFO" ) ).size;

		var __tmp = buffer_create(len,buffer_fixed,1);

		buffer_copy(wadbuff,lpos,len,__tmp,0);
	
		var str = buffer_read(__tmp,buffer_text);
	
		buffer_delete(__tmp);
	
		wadMapInfo = string_split_on_delimiter_includes(str,"\r\n");
	}else{
		var _file = working_directory + "gamedata/"+ wadGameInfo.mapinfo;
		
		wadMapInfo = ds_list_build();
		
		DEtrace("NOTICE: Loading Externally Defined Mapinfo",_file);
		
		DE_loadTextData( _file, wadMapInfo )
		
	}
	
}

function DE_loadTextData( _file, _list ){
			
	var file=file_text_open_read(_file);
		
	while (!file_text_eof(file)) {
		    
		var str = file_text_read_string(file);
			
		//Let's check for includes here to make life easier on everyone!
		var _include = DE_checkIncludes(str);
		
		if _include != "NULL"{
			DE_loadTextData( _include, _list );//This is recursive, so hopefully everthing just get's added in order making life worth living
		}
		else
		//DEtrace(str);
		ds_list_add( _list, str);
		    
		file_text_readln(file);
	}
	
}

function DE_checkIncludes( _str ){
	var r = string_split_as_code(_str);
	if getToken(r) == "include"{
		
		var file = getToken(r);
		file = string_copy(file,2,string_length(file)-2);
		
		DEtrace("Including File:",working_directory + "gamedata/" + file);
		ds_list_destroy(r);
		return working_directory + "gamedata/" + file;
	}else{
		ds_list_destroy(r);
		return "NULL";
	}
}

function DE_getLanguageData(){
	
	var lpos = DE_getLumpOfs( "LANGUAGE" );
	
	if lpos > -1{
	
		trace("NOTICE: Wad Contains Language Data");

		var len = ds_list_find_value_fixed(wadDirectory, DE_getLumpNum( "LANGUAGE" ) ).size;

		var __tmp = buffer_create(len,buffer_fixed,1);

		buffer_copy(wadbuff,lpos,len,__tmp,0);
	
		var str = buffer_read(__tmp,buffer_text);
	
		buffer_delete(__tmp);
	
		wadLanguage = string_split_on_delimiter(str,"\r\n")
	} else {
		var _file = working_directory + "gamedata/language.enu";
		
		if file_exists(_file){
		
			wadLanguage = ds_list_build();
		
			DEtrace("NOTICE: Loading Externally Defined Language",_file);
		
			DE_loadTextData( _file, wadLanguage );
		}
	}
	
}

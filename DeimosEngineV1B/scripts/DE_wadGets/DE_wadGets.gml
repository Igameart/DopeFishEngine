function DE_getFile( e ) {
	
	var file=e;//working_directory+"\"+e;
	var filename=e;
	
	wadFile = file;

	repeat string_count("\\",wad)
	    wad = string_lower(split(wad,"\\"));

	var fileType=string_lower(split(filename,"."));
	show_debug_message("Map File Extension: "+fileType);

	if file_exists(file)=false{
	    show_debug_message("FATAL: Failed to retrieve Map:"+file);
	    return false;
	}else{
    
	    switch(fileType){
	        case "wad":
	        show_debug_message("SUCCESS: Retrieved Map:"+file);
	        wadbuff = buffer_load(file);
	        return true;
	        break;
	        default:
	        show_debug_message("WARNING: Unknown map file type"+fileType)
	        return false;
	        break;
	    };
	}
}

function DE_getHeader() {
	//wadLoader.getHeader=function(){
	//this.view.seek(0);

	//file_bin_seek(wad,0);

	buffer_seek(wadbuff,buffer_seek_start, 0);
	var id_=buffer_read_string(wadbuff,4);
	var numlumps=buffer_read(wadbuff,buffer_u32);
	var infotableofs=buffer_read(wadbuff,buffer_u32);

	ds_map_add(wadHeader,"id",id_);
	ds_map_add(wadHeader,"numlumps",numlumps);
	ds_map_add(wadHeader,"infotableofs",infotableofs);

	show_debug_message("NOTICE: Got Header: "+ds_map_write(wadHeader));
	if(id_!="IWAD")
		show_debug_message("Unsupported WAD format: "+ds_map_find_value_fixed(wadHeader,"id"));
	else{
		show_debug_message("Supported WAD format: "+ds_map_find_value_fixed(wadHeader,"id"));
		show_debug_message("Numberof Lumps in WAD: "+string(ds_map_find_value_fixed(wadHeader,"numlumps")));
		show_debug_message("Info Table Offset in WAD: "+string(ds_map_find_value_fixed(wadHeader,"infotableofs")));
	}

}

function DE_getGLVersion(){
	
	/*var lump = argument1 + (WAD_FORMAT=="DOOM"?0:1);

	var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	wadGLVersion=buffer_read_string(wadbuff,4);
	trace("NOTICE: GL Version " + wadGLVersion);
	wadGLVersion = string_digits(wadGLVersion);

	if wadGLVersion!=""{
		
	}*/
}

function DE_getDirectory() {

	buffer_seek(wadbuff,buffer_seek_start, ds_map_find_value_fixed(wadHeader,"infotableofs"));

	wadDirectory=ds_list_build();
	wadDirectoryOfs = ds_map_build();
	var l;
	for(l=0;l<ds_map_find_value_fixed(wadHeader,"numlumps");l+=1){
	        var _directory=ds_map_build();
			var fPos = buffer_read(wadbuff,buffer_u32);
	        ds_map_add(_directory,"filepos",fPos);
	        ds_map_add(_directory,"size",buffer_read(wadbuff,buffer_u32) );
			var name = string_upper(buffer_read_string(wadbuff,8));
		
			if name == "BEHAVIOR"{
				WAD_FORMAT = "HEXEN";
				show_message("Hexen formatted maps will load, but you may experience issues with map interactions.\n(Hexen format integration is incomplete)");
			}
			
			if name == "MAP01" WAD_EPISODIC = false;
			
			if string_count("GL_",name) > 0{
				WAD_ISGL = true;
			}
		
	        ds_map_add(_directory,"name",name );
	        ds_list_add(wadDirectory,_directory);
		
			ds_map_add(wadDirectoryOfs,name,fPos);
        
	}
	
	if WAD_ISGL == false{
		var __question = show_question("WARNING: GL Nodes not present. The map will not display correctly without them. Build them now?");
		
		if __question{
			var __tmpWad = wadFile;
			__question = show_question("Overwrite original wad?");
			
			if !__question{
				
				__tmpWad = get_save_filename("Doom Wad|*.wad",__tmpWad);
				
				DE_glbspProcessWad(wadFile,__tmpWad);
				
			}
		}
	}

	if(ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l-1),"name")!="F_END"){
	//show_debug_message("Unexpected end of Directory Marker: "+ ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l-1),"name"))
	//JSON.stringify(this.wad.directory[this.wad.directory.length-1]);
	}
}

function DE_getLevel(level) {
	
	var l,curl = 0,gotlevel=false;

	for(l=0;l<ds_list_size(wadDirectory);l+=1){
	    if(ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name")=level){
	        gotlevel=true;
	        //else
	        //return false; // Got all current level data
        
	        trace("NOTICE: Found Level at Lump["+string(l)+"]: "+ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name"));
	        curl=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name");
			trace("Retrieved Level:",curl,level);
	        ds_map_add(wad_levels,"name",curl);
	        ds_map_add(wad_levels,"lump",l);
        
	        continue;
	    }
	    if(!is_bool(curl))
	    continue;
    
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

	if ofs != undefined{
		return ofs;//ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,ofs),"filepos");
	}
	return -1;
	
}

function DE_getLumpNum(lump) {
	
	for(l=0;l<ds_list_size(wadDirectory);l+=1)
	if(ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name")=lump){
	//show_debug_message("NOTICE: Found Lump["+string(l)+"]: "+ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name"));
	return l;
	}
}


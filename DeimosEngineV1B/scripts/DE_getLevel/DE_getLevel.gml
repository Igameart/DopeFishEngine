function DE_getLevel(argument0) {
	var level = (argument0);
	var l,curl = 0,gotlevel=false;

	for(l=0;l<ds_list_size(wadDirectory);l+=1){
	    if(ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name")=level){
	        gotlevel=true;
	        //else
	        //return false; // Got all current level data
        
	        //if(wadLoader.debug)
	        trace("NOTICE: Found Level at Lump["+string(l)+"]: "+ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name"));
	        curl=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name");
			trace("Retrieved Level:",curl,level);
	        ds_map_add(wad_levels,"name",curl);
	        ds_map_add(wad_levels,"lump",l);
        
	        //show_debug_message("Discovered Map: "+ curl );
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

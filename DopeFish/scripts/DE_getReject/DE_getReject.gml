function DE_getReject(level, lump) {

	ds_map_add(wad_levels,"reject",mapReject);
	
	var __LDat = ds_list_find_value_fixed(wadDirectory,lump);

	var pos=ds_map_find_value_fixed(__LDat,"filepos");

	var size=ds_map_find_value_fixed(__LDat,"size");

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;

	while(buffer_tell(wadbuff)<len){
		
		var __byte = buffer_read(wadbuff,buffer_bool);
		
		var __bit = 0;
		repeat 8{
			var __bval = bit_get(__byte,__bit++);
			//trace(__bval);
			ds_list_add(mapReject,__bval);
		}
	}

	trace("NOTICE: ["+level+"] REJECT "+string( ds_list_size( mapReject ) ));
	//ds_list_print(mapReject);

}

function DE_checkReject( __Sect1, __Sect2 ){
	
	var __rCheck = mapReject[| __Sect1 * __Sect2 ];
	
	//trace("Checking REJECT:",__Sect1, __Sect2,__rCheck);
	
	return __rCheck;
	
}


function DE_getGLPVIS(level, lump) {

	ds_map_add(wad_levels,"gl_pvis",mapPVIS);
	
	var __LDat = ds_list_find_value_fixed(wadDirectory,lump);

	var pos=ds_map_find_value_fixed(__LDat,"filepos");
	
	mapPVIS = pos;
	
	trace("COMPILING GL_PVS TABLE");
	
	var numsubsectors = ds_list_size(mapGLSSects);
	
	var __ss = 0;
	repeat numsubsectors{
		var __list = ds_list_build();
		var __segsList = ds_list_build();
		mapSSecPVISTable[| __ss ] = __list;
		mapGLsegPVISTable[| __ss ] = __segsList;
		
		var __sCheck = 0;
		repeat numsubsectors{
			if (DE_checkPVS(__ss,__sCheck)==true){
				
				//Add this subsector to the list of subsectors visible to __ss
				ds_list_add(__list,__sCheck);
				
				//Find the glsegs in this subsector and add to list of glsegs visible to __ss
				DE_PvisGLsegsOfSSect(ds_list_find_value_fixed(mapGLSSects,__sCheck),__segsList);
				
			}
			__sCheck++;
		}
		
		__ss++
		
	}

}

function DE_checkPVS( view_sub, i ){
	
	var numsubsectors = ds_list_size(mapGLSSects);
	
    var __vis = mapPVIS + (((numsubsectors + 7) div 8) * view_sub);
    
    if (buffer_peek(wadbuff, __vis + (i >> 3), buffer_u8 ) & (1 << (i & 7)) > 0)
    {
		return true;
    }
    else
    {
		return false;
    }
}

function DE_getLinedefs(argument0, argument1) {
	var level=argument0,lump=argument1;
	var linedefs=mapLinedefs;//ds_list_build();
	//mapLinedefs = linedefs;

	var pos = ds_list_find_value_fixed(wadDirectory,lump).filepos;

	var size = ds_list_find_value_fixed(wadDirectory,lump).size;

	//show_debug_message("NOTICE: Found Lump Size ["+ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"name")+"]: "+string(size));

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;
	var line=0;
	while(buffer_tell(wadbuff)<len){
	    //ldef={
	    var ldef = struct_copy(linetype);//ds_map_build();
		
	    ldef.startv	= buffer_read(wadbuff,buffer_s16);
		
	    ldef.endv		= buffer_read(wadbuff,buffer_s16);
		
	    ldef.flags		= buffer_read(wadbuff,buffer_s16);
    
	    if WAD_FORMAT == "DOOM"{
    
		    ldef.specialtype = buffer_read(wadbuff,buffer_s16);
		    ldef.sector_tag = buffer_read(wadbuff,buffer_s16);
		
			//if ssect!=0{
				mapSectTags[|ldef.sector_tag] = ldef.specialtype;
			//}
    
    
	    }else{
	        var arg;
	        ldef.specialtype = buffer_read(wadbuff,buffer_s8);
	        arg = [ buffer_read(wadbuff,buffer_s8),
					buffer_read(wadbuff,buffer_s8),
					buffer_read(wadbuff,buffer_s8),
					buffer_read(wadbuff,buffer_s8),
					buffer_read(wadbuff,buffer_s8)];
        
	        var str="HF Linedef Special: ";
	        str+=string(ldef.specialtype);
	        str+=". Arguments: "
	        num=0;
	        repeat 5{
	            str+=string(arg[num])+","
	            num++
	        }
			
	        str+=" On Linedef "+string(line);
        
	        ldef.arg0	= arg[0];
	        ldef.arg1	= arg[1];
	        ldef.arg2	= arg[2];
	        ldef.arg3	= arg[3];
	        ldef.arg4	= arg[4];
	    }

		var front,back;
		front = buffer_read(wadbuff,buffer_s16);
		back = buffer_read(wadbuff,buffer_s16);

		ldef.right = front;//buffer_read(wadbuff,buffer_s16);
		ldef.left = back;//buffer_read(wadbuff,buffer_s16);
    
		if ldef.specialtype != 0{
			
			if WAD_FORMAT = "HEXEN" ldef.sector_tag = arg[0];
			
			trace("Created Switch Type "+string(ldef.specialtype)+" with Tag "+string(ldef.sector_tag)+" From Linedef "+string(line));
			//else if WAD_FORMAT = "HEXEN"
	        
			var DE_switch=instance_create_depth(0,0,0,ojbDESwitch);
			DE_switch.line = line;
			
			var v1 = ldef.startv;
			var v2 = v1+1;
			
			v1 = mapVertexes[| v1 ];
			v2 = mapVertexes[| v2 ];
			
			DE_switch.x =v1.x;// mean(v1.x,v2.x);
			DE_switch.y = v1.y;//mean(v1.y,v2.y);
			
			//with DE_switch{
			//	image_angle=point_direction(x,y,v2.x,v2.y);
			//	direction=image_angle;
			//	image_xscale=point_distance(x,y,v2.x,v2.y)/sprite_get_width(sprite_index);
			//	image_yscale=1;//0.25;
			//	//visible = true;
			//}
			
			DE_switch.specialtype = ldef.specialtype;
			DE_switch.tag = ldef.sector_tag;
			DE_switch.side = mapSidedefs[| front ];
			
		}
    
	    //};
    
	    // Bit Shift flags
	    //var flags=ds_map_find_value_fixed(ldef,"flags");
	    var flagmap = struct_copy(lineFlagType);
    
	    flagmap.blockall		= (ldef.flags & (1<<0))!=0;
	    flagmap.blockmonsters	= (ldef.flags & (1<<1))!=0;
	    flagmap.twosided		= (ldef.flags &(1<<2))!=0;
	    flagmap.pegupper		= (ldef.flags &(1<<3))!=0;
	    flagmap.peglower		= (ldef.flags &(1<<4))!=0;
	    flagmap.secret			= (ldef.flags &(1<<5))!=0;
	    flagmap.blocksound		= (ldef.flags &(1<<6))!=0;
	    flagmap.automaphide		= (ldef.flags &(1<<7))!=0;
	    flagmap.automapalways	= (ldef.flags &(1<<8))!=0;
    
	    ldef.flags = flagmap;
    
	    line+=1;
    
	    var lSides=ds_list_build();
	    ds_list_add(lSides,front);
	    ds_list_add(lSides,back);
	
		if back != -1{
			var bside=ds_list_find_value(mapSidedefs,back);
		    var backsector=bside.sector;
			
			trace("Line Back Data",back,"ldef",ldef);
			
		    bside.backsector = backsector;
		    ldef.backsector = backsector;
			
			//ds_list_add(lSides,ldef.left);
		}
			//ds_list_add(lSides,ldef.right);
    
	    ldef.sides = lSides;
		
		//Check linedef to see if it's part of a door, if it is populate some data.
		DE_isLineDoor(ldef);
		
	    ds_list_add(linedefs,ldef);
	    //show_debug_message("NOTICE: ["+level+'] LINEDEFS '+string( ds_list_size(linedefs) ));
	}

	wadlevel.linedefs=linedefs;

		//Now that all linedef data is loaded, parse any switches (linedefs with actions)			
	with ojbDESwitch DE_parseLineDefType();

	show_debug_message("NOTICE: ["+level+"] LINEDEFS "+string( ds_list_size(wadlevel.linedefs)) );



}

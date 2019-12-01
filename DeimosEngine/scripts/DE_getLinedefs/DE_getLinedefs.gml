var level=argument0,lump=argument1;
var linedefs=ds_list_build();
mapLinedefs = linedefs;
globalvar doors;
doors=ds_list_build();

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

//show_debug_message("NOTICE: Found Lump Size ["+ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"name")+"]: "+string(size));

buffer_seek(wadbuff,buffer_seek_start,pos);

var len=pos+size;
var line=0;
while(buffer_tell(wadbuff)<len){
    //ldef={
    var ldef=ds_map_build();
    ds_map_add(ldef,"start",buffer_read(wadbuff,buffer_s16));
    ds_map_add(ldef,"end",buffer_read(wadbuff,buffer_s16));
    ds_map_add(ldef,"flags",buffer_read(wadbuff,buffer_s16));
    
    if WAD_FORMAT == "DOOM"{
	    var type,ssect;
    
	    type=buffer_read(wadbuff,buffer_s16);
	    ssect=buffer_read(wadbuff,buffer_s16);
		
		//if ssect!=0{
			mapSectTags[|ssect] = type;
		//}
    
	    if DE_ldTypeIsDoor(type)==true{
			trace("Created Door Type "+string(type)+" on Sector "+string(ssect)+" From Linedef "+string(line));
	        
			door=instance_create_depth(0,0,0,door_control_obj);
			door.line = line;
			door.type = type;
			door.tag = ssect;
			
	    }
    
	    ds_map_add(ldef,"type",type);
	    ds_map_add(ldef,"sector",ssect);
    
    }else{
        var type,arg;
        type=buffer_read(wadbuff,buffer_s8);
        arg[0]=buffer_read(wadbuff,buffer_s8);
        arg[1]=buffer_read(wadbuff,buffer_s8);
        arg[2]=buffer_read(wadbuff,buffer_s8);
        arg[3]=buffer_read(wadbuff,buffer_s8);
        arg[4]=buffer_read(wadbuff,buffer_s8);
        
        var str="HF Linedef Special: ";
        str+=string(type);
        str+=". Arguments: "
        num=0;
        repeat 5{
            str+=string(arg[num])+","
            num++
        }
        str+=" On Linedef "+string(line);
        
        ds_map_add(ldef,"type",type);
        ds_map_add(ldef,"arg0",arg[0]);
        ds_map_add(ldef,"arg1",arg[1]);
        ds_map_add(ldef,"arg2",arg[2]);
        ds_map_add(ldef,"arg3",arg[3]);
        ds_map_add(ldef,"arg4",arg[4]);
    }
    
    ds_map_add(ldef,"right",buffer_read(wadbuff,buffer_s16));
    ds_map_add(ldef,"left",buffer_read(wadbuff,buffer_s16));
    
    //};
    
    // Bit Shift flags
    var flags=ds_map_find_value_fixed(ldef,"flags");
    var flagmap=ds_map_build();
    
    ds_map_add(flagmap,"block_all",(flags & (1<<0))!=0);
    ds_map_add(flagmap,"block_monsters",(flags & (1<<1))!=0);
    ds_map_add(flagmap,"twosided",(flags &(1<<2))!=0);
    ds_map_add(flagmap,"peg_upper",(flags &(1<<3))!=0);
    ds_map_add(flagmap,"peg_lower",(flags &(1<<4))!=0);
    ds_map_add(flagmap,"secret",(flags &(1<<5))!=0);
    ds_map_add(flagmap,"blocksound",(flags &(1<<6))!=0);
    ds_map_add(flagmap,"automap_hide",(flags &(1<<7))!=0);
    ds_map_add(flagmap,"automap_always",(flags &(1<<8))!=0);
    
    ds_map_replace(ldef,"flags",flagmap);
    
    line+=1;
    
    var sides=ds_list_build();
    ds_list_add(sides,ds_map_find_value_fixed(ldef,"right"));
    ds_list_add(sides,ds_map_find_value_fixed(ldef,"left"));
    
    ds_map_add(ldef,"sides",sides);
    ds_list_add(linedefs,ldef);
    //show_debug_message("NOTICE: ["+level+'] LINEDEFS '+string( ds_list_size(linedefs) ));
}

ds_map_add(wad_levels,"linedefs",linedefs);

show_debug_message("NOTICE: ["+level+"] LINEDEFS "+string( ds_list_size(ds_map_find_value_fixed(wad_levels,"linedefs")) ));

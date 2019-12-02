var level=argument0,lump=argument1;

mapThings=ds_list_build();

ds_map_add(wad_levels,"things",mapThings);

var pos=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"filepos");

var size=ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,lump),"size");

//show_debug_message("NOTICE: ["+level+'] sectors start '+string( pos ));
//show_debug_message("NOTICE: ["+level+'] sectors end '+string( size ));

buffer_seek(wadbuff,buffer_seek_start,pos);

var len=pos+size;
l=0;
while(buffer_tell(wadbuff)<len){
	
	//var thing =ds_map_build();
	
	var ID,X,Y,Z,ANGLE,TYPE,FLAGS,ACTION,ARG1,ARG2,ARG3,ARG4,ARG5;
		ID = 0;
	if WAD_FORMAT == "DOOM"{
		X = (buffer_read(wadbuff,buffer_s16))
		Y = (-999)
		Z = (-buffer_read(wadbuff,buffer_s16))
		ANGLE = (buffer_read(wadbuff,buffer_u16))
		TYPE = (buffer_read(wadbuff,buffer_u16))
		FLAGS = (buffer_read(wadbuff,buffer_u16))
		ACTION = undefined;
		ARG1 = undefined;
		ARG2 = undefined;
		ARG3 = undefined;
		ARG4 = undefined;
		ARG5 = undefined;
	}else{
		ID = (buffer_read(wadbuff,buffer_u16))
		X = (buffer_read(wadbuff,buffer_s16))
		Z = (-buffer_read(wadbuff,buffer_s16))
		Y = (-buffer_read(wadbuff,buffer_s16))
		ANGLE = (buffer_read(wadbuff,buffer_u16))
		TYPE = (buffer_read(wadbuff,buffer_u16))
		FLAGS = (buffer_read(wadbuff,buffer_u16))
		ACTION = (buffer_read(wadbuff,buffer_u8))
		ARG1 = (buffer_read(wadbuff,buffer_u8))
		ARG2 = buffer_read(wadbuff,buffer_u8)
		ARG3 =buffer_read(wadbuff,buffer_u8)
		ARG4 = buffer_read(wadbuff,buffer_u8)
		ARG5 = buffer_read(wadbuff,buffer_u8)
	}
	
	//ds_map_add(thing,"ID",ID)
	//ds_map_add(thing,"x",X)
	//ds_map_add(thing,"y",Y)
	//ds_map_add(thing,"z",Z)
	//ds_map_add(thing,"angle",ANGLE)
	//ds_map_add(thing,"type",TYPE)
	//ds_map_add(thing,"flags",FLAGS)
	//ds_map_add(thing,"action special",ACTION)
	//ds_map_add(thing,"action argument 1",ARG1)
	//ds_map_add(thing,"action argument 2",ARG2)
	//ds_map_add(thing,"action argument 3",ARG3)
	//ds_map_add(thing,"action argument 4",ARG4)
	//ds_map_add(thing,"action argument 5",ARG5)
	//ds_list_add(mapThings,thing);

	// Bit Shift flags
	//var flags=ds_map_find_value_fixed(thing,"flags");
	//var flagmap=ds_map_build();

	//CONTINUE HERE
	
	var skill1_2,skill3,skill4_5,deaf,mponly;
	
	skill1_2 = (FLAGS&(1<<0)!=0);
	skill3 = (FLAGS&(1<<1)!=0);
	skill4_5 = (FLAGS&(1<<2)!=0);
	deaf = (FLAGS&(1<<3)!=0);
	mponly = (FLAGS&(1<<4)!=0);

	//ds_map_add(flagmap,"skill1_2",	skill1_2);
	//ds_map_add(flagmap,"skill3",	skill3);
	//ds_map_add(flagmap,"skill4_5",	skill4_5);
	//ds_map_add(flagmap,"deaf",		deaf);
	//ds_map_add(flagmap,"mponly",	mponly);
	
	if l == 0 {
		x = X;
		y = Z;
		yaw = ANGLE;
		direction = yaw;
	}
	
	var addThing = false;
	
	if (skill1_2 && (DESkillLevel>=0)) addThing = true;
	if (skill3 && DESkillLevel>=2) addThing = true;
	if (skill4_5 && DESkillLevel>=3) addThing = true;
	if (mponly && !DENetPlay) addThing = false;
	
	if addThing == true{
		var _3Dspr = instance_create_depth(X,Z,0,DEBillboardV_obj);
	
		with _3Dspr{
			thingType = TYPE;
			event_user(0);
		}
	}

	//ds_map_replace(thing,"flags",flagmap);

	l+=1;

};
show_debug_message("NOTICE: ["+level+"] THINGS "+string( ds_list_size(mapThings) ));

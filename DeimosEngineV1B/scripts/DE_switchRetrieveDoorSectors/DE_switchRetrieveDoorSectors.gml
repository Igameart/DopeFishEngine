function DE_switchRetrieveDoorSectors() {

	var secs = mapSectors;
	var SSize = ds_list_size(secs);

	if DE_IdTypeIsRemoteDoor(type){

		for (var S = 0; S<SSize; S++){
			var Sect = secs[|S];
		
			//if tag!=-1
			if Sect[?"tag"] == tag{
		
				var dCheck = mapDoors[|S]
	
				if dCheck == undefined ||
				dCheck.object_index != door_sector_obj{
		
					var door = instance_create_depth(0,0,0,door_sector_obj);
					trace("Created Door For Sector:",S);
				
					ds_list_add(taggedSectors,door);
					door.owner = id;
					door.wait = WAIT;
					door.funcs = FUNC;
					door.doorSpeed = SPEED;
					door.sector = Sect;
					door.repeatable = (TRIG[1] == "R");
					with door event_user(0);
				
					mapDoors[|S] = door;
				
				}else{
					ds_list_add(taggedSectors,dCheck);
					trace("Remote Door For Sector Already Exists:",dCheck.tag);
				}
			}
		}
	
	}

	if DE_IdTypeIsLocalDoor(type){
		
		var linedef=ds_list_find_value(mapLinedefs,line);
	
		var Sect=ds_map_find_value(linedef,"bsect");
	
		//ds_map_print(linedef)
	
		var secNum = Sect;
		Sect = secs[|Sect]
		
		var dCheck = mapDoors[|secNum]
	
		if dCheck == undefined ||
		dCheck.object_index != door_sector_obj{
		
			var door = instance_create_depth(0,0,0,door_sector_obj);
			trace("Created Door For Sector:",secNum);
			ds_list_add(taggedSectors,door);
			door.owner = id;
			door.wait = WAIT;
			door.funcs = FUNC;
			door.doorSpeed = SPEED;
			door.sector = Sect;
			door.repeatable = (TRIG[1] == "R");
			with door event_user(0);
		
			mapDoors[|secNum] = door;
			
		}else{
			
			ds_list_add(taggedSectors,dCheck);
			trace("Local Door For Sector Already Exists:",dCheck.tag);
			
		}
	
	}

	taggedSectNum = ds_list_size(taggedSectors);

	trace("Door Controller Connected To "+string(taggedSectNum)+" Doors");



}

function DE_switchRetrieveDoorSectors() {
	
	var this = id;
	
	var secs = mapSectors;
	
	var tagList = mapTags[? tag ];

	if tagList == undefined return undefined;
	
	var SSize = ds_list_size(tagList);
	
	if DE_IdTypeIsRemoteDoor(specialtype){

		for (var S = 0; S<SSize; S++){
			
			var tagSec = tagList[| S ];
			
			var Sect = secs[| tagSec ];
		
			var dCheck = mapDoors[? tagSec ];
	
			if dCheck == undefined{
		
				var door = instance_create_depth(0,0,0,objDEDoorHandler);
				DEtrace("Created Door For Sector:",tagSec);
			
				ds_list_add(taggedSectors,door);
				door.tag = this.tag;
				door.wait = WAIT;
				door.funcs = FUNC;
				door.doorSpeed = SPEED;
				door.sector = Sect;
				door.repeatable = this.repeatable;
				
				with door event_user(0);
				
				mapDoors[? tagSec] = door;
				
			}else{
				//if ds_list_find_index(taggedSectors,dCheck) == undefined
					ds_list_add(this.taggedSectors,dCheck);
				DEtrace("Remote Door For Sector Already Exists:",dCheck.tag);
			}
		}
	
	}

	if DE_IdTypeIsLocalDoor(specialtype){
		
		var linedef=ds_list_find_value(mapLinedefs,line);
	
		var Sect=linedef.backsector;
	
		var secNum = Sect;
		Sect = secs[|Sect]
		
		var dCheck = mapDoors[? secNum ]
		
		//If is undefined, we've not created a controller for this sector, let's do it now
		if dCheck == undefined{
		
			var door = instance_create_depth(0,0,0,objDEDoorHandler);
			
			DEtrace("Created Door For Sector:",secNum);
			
			ds_list_add(taggedSectors,door);
			door.tag = this.tag;
			door.wait = WAIT;
			door.funcs = FUNC;
			door.doorSpeed = SPEED;
			door.sector = Sect;
			door.repeatable = (TRIG[1] == "R");
			this.repeatable = door.repeatable;
			with door event_user(0);
		
			mapDoors[? secNum ] = door;
			
		}else{
			//We've created a controller for this sector previously, if it's not on our list, add it!
			
			//if ds_list_find_index(taggedSectors,dCheck) == undefined
				ds_list_add(taggedSectors,dCheck);
			trace("Local Door For Sector Already Exists:",dCheck.tag);
			
		}
	
	}

	taggedSectNum = ds_list_size(taggedSectors);

	trace("Door Controller Connected To "+string(taggedSectNum)+" Doors");
	
}

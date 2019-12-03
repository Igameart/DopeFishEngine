/// @description

var secs = mapSectors;
var SSize = ds_list_size(secs);

if line!=-1{	//Let's define our collision info
		
	    var linedef=ds_list_find_value(mapLinedefs,line);
		
		var sVert,eVert;
		sVert = mapVertexes[| linedef[?"start"] ];
		eVert = mapVertexes[| linedef[?"end"] ];
		var x1,y1,x2,y2;
		x1 = sVert[?"x"];
		y1 = sVert[?"y"];
		x2 = eVert[?"x"];
		y2 = eVert[?"y"];
				
		x = x1; y = y1;
		image_xscale = point_distance(x1,y1,x2,y2) / 8;
		image_yscale = 0.25;
		image_angle = point_direction(x1,y1,x2,y2);
		
		if routine == DERoutines.DOOR{
			
			sprite_index = sprite_duplicate(sprite_index);
			image_yscale = 4;		
			//This is hacky, replace with proper line collisions
			sprite_set_offset(sprite_index,0,-8);
			
		}
		
}

if DE_IdTypeIsDoor(type){
	
	routine = DERoutines.DOOR;

	if DE_IdTypeIsRemoteDoor(type){

		for (var S = 0; S<SSize; S++){
			var Sect = secs[|S];
			if Sect[?"tag"] == tag{
		
				var dCheck = mapDoors[|S]
	
				if dCheck == undefined ||
				dCheck.object_index != door_sector_obj{
		
					var door = instance_create_depth(0,0,0,door_sector_obj);
					trace("Created Door For Sector:",S);
				
					ds_list_add(doorSectors,door);
				
					door.sector = Sect;
					with door event_user(0);
				
					mapDoors[|S] = door;
				
				}else{
					ds_list_add(doorSectors,dCheck);
					trace("Door For Sector Already Exists:",dCheck.tag);
				}
			}
		}
	
	}

	if DE_IdTypeIsLocalDoor(type){
		
		var linedef=ds_list_find_value(mapLinedefs,line);
	
		var Sect=ds_map_find_value(linedef,"bsect");
		var secNum = Sect;
		Sect = secs[|Sect]
		
		var dCheck = mapDoors[|secNum]
	
		if dCheck == undefined ||
		dCheck.object_index != door_sector_obj{
		
			var door = instance_create_depth(0,0,0,door_sector_obj);
			trace("Created Door For Sector:",secNum);
			ds_list_add(doorSectors,door);
			door.sector = Sect;
			with door event_user(0);
			mapDoors[|secNum] = door;
			
		}else{
			
			ds_list_add(doorSectors,dCheck);
			trace("Door For Sector Already Exists:",dCheck.tag);
			
		}
	
	}

	doorNum = ds_list_size(doorSectors);

	trace("Door Controller Connected To "+string(doorNum)+" Doors");
}
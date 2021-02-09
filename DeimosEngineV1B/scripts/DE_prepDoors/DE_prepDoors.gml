function DE_prepDoors() {
	var lines = mapLinedefs;//ds_map_find_value_fixed(wad_levels,"linedefs");
	var sides = mapSidedefs;//ds_map_find_value_fixed(wad_levels,"sidedefs");
	var sects = mapSectors;//ds_map_find_value_fixed(wad_levels,"sectors");

	var lSize = ds_list_size(lines);

	trace("Checking Linedefs for Doors");

	for (var L = 0; L < lSize; L++){
	
		var line = lines[|L];
	
		//var flags = line[?"flags"];
	
		//ds_map_print(flags);
	
		//var isDub = flags[?"twosided"];
	
		//if isDub{
		
			var back = line[?"left"];
		
			if back!=-1{
		
			back = sides[|back];
		
			var DoorSec = sects[|back[?"sector"]];
		
			if DoorSec != undefined{
			
				var dTag = DoorSec[?"tag"];
			
				if dTag == 0{
					if DE_IdTypeIsLocalDoor(line[?"type"])
						dTag = line[?"type"];
				}
				else dTag = mapSectTags[|dTag];
			
				if DE_IdTypeIsDoor(dTag)
				{
				
					var front = line[?"right"];
		
					front = sides[|front];
		
					var checkSec = sects[|front[?"sector"]];
		
					var DoorH = DoorSec[?"door height"];
			
					var checkH = checkSec[?"ceiling"]-4;
			
					if DoorH == undefined {
						DoorH = checkH;
					}else if DoorH>checkH DoorH = checkH;
		
					DoorSec[?"door height"] = DoorH;
				
					trace("Linedef is on Door:",L,"Door Tag is:",DoorSec[?"tag"]);
					trace("Sector Number:",back[?"sector"]);
					//ds_map_print(DoorSec);
				
				}
			
			}
		}
	}

	//Now that we've defined all door sector's height, we can set the height for door objects
	with door_sector_obj event_user(0);


}

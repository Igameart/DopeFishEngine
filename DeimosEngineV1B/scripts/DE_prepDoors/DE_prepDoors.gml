function DE_isLineDoor(line){
	
	var back = line[?"left"];
		
	if back!=-1{
		var sides = mapSidedefs;//ds_map_find_value_fixed(wad_levels,"sidedefs");
		var sects = mapSectors;//ds_map_find_value_fixed(wad_levels,"sectors");
		
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
				
				trace("Linedef is on Door, Door Tag is:",DoorSec[?"tag"]);
				trace("Sector Number:",back[?"sector"]);
			}
		}
	}
}

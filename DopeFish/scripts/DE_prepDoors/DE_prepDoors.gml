function DE_isLineDoor(line){
	
	var back = line.right;
		
	if back!=-1{
		var sides = mapSidedefs;//ds_map_find_value_fixed(wadlevel,"sidedefs");
		var sects = mapSectors;//ds_map_find_value_fixed(wadlevel,"sectors");
		
		back = sides[|back];
		
		var DoorSec = sects[| back.sector ];
		
		if DoorSec != undefined{
			
			var dTag = DoorSec.tag;
			
			if dTag == 0{
				if DE_IdTypeIsLocalDoor(line.specialtype)
					dTag = line.specialtype;
			}
			else dTag = mapSectTags[| dTag ];
			
			if DE_IdTypeIsDoor(dTag)
			{
				
				var front = line.left;
				
				if (front!=-1){
		
					front = sides[| front ];
		
					var checkSec = sects[| front.sector ];
		
					var DoorH = DoorSec.doorheight;
			
					var checkH = checkSec.ceilingz-4;
			
					if DoorH == undefined {
						DoorH = checkH;
					}else if DoorH>checkH DoorH = checkH;
		
					DoorSec.doorheight = DoorH;
				
					trace("Linedef is on Door, Door Tag is:",DoorSec.tag);
					trace("Sector Number:",back.sector);
				}
			}
		}
	}
}

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
		image_yscale = 6;
		image_angle = point_direction(x1,y1,x2,y2);
		
		sprite_index = sprite_duplicate(sprite_index);
		
		sprite_set_offset(sprite_index,0,0);
		
		trace("Door Placed At:",x1,y1,x2,y2,image_angle);
		
}

if DE_IdTypeIsRemoteDoor(type){

	for (var S = 0; S<SSize; S++){
		var Sect = secs[|S];
		if Sect[?"tag"] == tag{
			sector = Sect;
		}
	}
	
}

if DE_IdTypeIsLocalDoor(type){
		
	var linedef=ds_list_find_value(mapLinedefs,line);
	
	var Sec=ds_map_find_value(linedef,"bsect");
		
	sector=secs[|Sec];
}

//if mapDoors[|sector] == undefined mapDoors[|sector] = id; else instance_destroy();

doorHeight = sector[?"door height"] - sector[?"floor"];

doorPos = 0;//doorHeight;
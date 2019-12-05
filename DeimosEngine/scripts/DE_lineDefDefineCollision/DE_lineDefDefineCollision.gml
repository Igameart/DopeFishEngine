
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
		
		if TRIG[0] == "P" || TRIG[0] == "S" {//Push or Switch, extend collision range
			
			sprite_index = sprite_duplicate(sprite_index);
			image_yscale = 4;		
			//This is hacky, replace with proper line collisions
			sprite_set_offset(sprite_index,0,-8);
			
		}
		
}
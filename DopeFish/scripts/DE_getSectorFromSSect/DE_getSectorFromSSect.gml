/// @description DE_getSectorFromSSect(GLSSECT)
/// @param GLSSECT
function DE_getSectorFromSSect(argument0) {
	var lines = mapLinedefs;//ds_map_find_value_fixed(wadlevel,"linedefs");
	var sides = mapSidedefs;//ds_map_find_value_fixed(wadlevel,"sidedefs");

	if wadGLVersion !=-1{
		var glsegs = mapGLSegs;//ds_map_find_value_fixed(wadlevel,"glsegs");

		var gssect = mapGLSSects;//ds_map_find_value_fixed(wadlevel,"glssects");

		var polygon = ds_list_find_value_fixed(gssect,argument0);

		var count,start,sector;
		count=ds_map_find_value_fixed(polygon,"count");
		start=ds_map_find_value_fixed(polygon,"start");

		var k = 0;
		var linedef=65535;
		repeat (count) {
		    line = ds_list_find_value_fixed(glsegs,k+start);
        
		    linedef=(ds_map_find_value_fixed(line,"linedef"));
		    if linedef==65535{
		        k++;
		    }else{
		        var mline=ds_list_find_value_fixed(lines,linedef);
        
		        var side=ds_map_find_value_fixed(line,"side");
		        if side==0{
		            side = ds_map_find_value_fixed(mline,"right");
		        }else{
		            side = ds_map_find_value_fixed(mline,"left");
		        }
        
		        side = ds_list_find_value_fixed(sides,side);
		        sector = ds_map_find_value_fixed(side,"sector");
		        return sector;
		    }
		}
	}else{
	
		var segs = mapSegs;//ds_map_find_value_fixed(wadlevel,"glsegs");
		var ssect = mapSSectors;//ds_map_find_value_fixed(wadlevel,"glssects");

		var polygon = ds_list_find_value_fixed(ssect,argument0);

		var count,start,sector;
		count=ds_map_find_value_fixed(polygon,"count");
		start=ds_map_find_value_fixed(polygon,"start");

		var k = 0;
		var linedef=65535;
		repeat (count) {
		    var line = ds_list_find_value_fixed(segs,k+start);
        
		    linedef=(ds_map_find_value_fixed(line,"linedef"));
		    if linedef==65535{
		        k++;
		    }else{
		        var mline=ds_list_find_value_fixed(lines,linedef);
        
		        var side=ds_map_find_value_fixed(line,"side");
		        if side==0{
		            side = ds_map_find_value_fixed(mline,"right");
		        }else{
		            side = ds_map_find_value_fixed(mline,"left");
		        }
        
		        side = ds_list_find_value_fixed(sides,side);
		        sector = ds_map_find_value_fixed(side,"sector");
		        return sector;
		    }
		}
	}


}

/// @description DE_getSectorFromSSect(GLSSECT)
/// @param GLSSECT
function DE_getSectorFromSSect(GLSSECT) {
	var lines = mapLinedefs;//ds_map_find_value_fixed(wadlevel,"linedefs");
	var sides = mapSidedefs;//ds_map_find_value_fixed(wadlevel,"sidedefs");

	if wadGLVersion !=-1{
		var glsegs = mapGLSegs;//ds_map_find_value_fixed(wadlevel,"glsegs");

		var gssect = mapGLSSects;//ds_map_find_value_fixed(wadlevel,"glssects");

		var polygon = ds_list_find_value_fixed(gssect,GLSSECT);
		
		if !is_struct(polygon){
			trace("ERROR","GLSSect Not Found",GLSSECT);
		}
		var count,start,sector;
		count=polygon.count;
		start=polygon.start;

		var k = 0;
		var linedef=65535;
		repeat (count) {
		    line = ds_list_find_value_fixed(glsegs,k+start);
        
		    linedef=(line.linedef);
		    if linedef==65535{
		        k++;
		    }else{
		        var mline=ds_list_find_value_fixed( lines, linedef );
        
		        var side = (line.side);
		        if side == 0 {
		            side = (mline.right);
		        }else{
		            side = (mline.left);
		        }
        
		        side = ds_list_find_value(sides,side);
				
				//trace("NOTICE: Getting Side Sector:", line.side, mline.left, mline.right, side );
				
		        sector = ( side.sector );
		        return sector;
		    }
		}
	}else{
	
		var segs = mapSegs;//ds_map_find_value_fixed(wadlevel,"glsegs");
		var ssect = mapSSectors;//ds_map_find_value_fixed(wadlevel,"glssects");


		var polygon = ds_list_find_value(ssect,GLSSECT);
		
		if !is_struct(polygon){
			trace("ERROR","GLSSect Not Found",GLSSECT);
		}

		var count,start,sector;
		count=polygon.count;
		start=polygon.start;

		var k = 0;
		var linedef=65535;
		repeat (count) {
		    var line = ds_list_find_value_fixed(segs,k+start);
        
		    linedef=((line.linedef));
		    if linedef==65535{
		        k++;
		    }else{
		        var mline=ds_list_find_value_fixed(lines,linedef);
        
		        var side=(line.side);
		        if side==0{
		            side = (mline.right);
		        }else{
		            side = (mline.left);
		        }
        
		        side = ds_list_find_value_fixed(sides,side);
		        sector = (side.sector);
		        return sector;
		    }
		}
	}


}

function DE_findSectorAt(argument0, argument1, argument2) {

	var sects = wadlevel.sectors;
	var secnum;
	if argument2!=-1{
	    secnum=argument2;
	    var sect=ds_list_find_value_fixed(sects,secnum);
	    var colmap=sect.colmap;
		
		//if point_in_polygon(argument0,argument1,colmap) == true{
		//	return sect.sector;
		//}
    
		//if point_in_boundaries(argument0,argument1,sect){
		    for (var i=0;i<ds_list_size(colmap);i+=6){
		        var x0,y0,x1,y1,x2,y2;
		        x0=ds_list_find_value(colmap,i);
		        y0=ds_list_find_value(colmap,i+1);
		        x1=ds_list_find_value(colmap,i+2);
		        y1=ds_list_find_value(colmap,i+3);
		        x2=ds_list_find_value(colmap,i+4);
		        y2=ds_list_find_value(colmap,i+5);
        
		        if point_in_triangle(argument0,argument1,x0,y0,x1,y1,x2,y2){
		            return secnum;
		        }
        
		    //}
		}
    
	}else{
	    for (secnum=0;secnum<ds_list_size(sects);secnum++){
	        var sect=ds_list_find_value_fixed(sects,secnum);
	        var colmap=sect.colmap;
			
			//if point_in_polygon(argument0,argument1,colmap) == true return sect.sector;
			//if point_in_boundaries(argument0,argument1,sect){
		        for (var i=0;i<ds_list_size(colmap);i+=6){
		            var x0,y0,x1,y1,x2,y2;
		            x0=ds_list_find_value(colmap,i);
		            y0=ds_list_find_value(colmap,i+1);
		            x1=ds_list_find_value(colmap,i+2);
		            y1=ds_list_find_value(colmap,i+3);
		            x2=ds_list_find_value(colmap,i+4);
		            y2=ds_list_find_value(colmap,i+5);
            
		            if point_in_triangle(argument0,argument1,x0,y0,x1,y1,x2,y2){
		                return secnum;
		            }
            
		        }
			//}
	    }
	}
	return -1;

}

function DE_findSubsectorAt(x0, y0){//, ssCheck) {
	
	var ssCheck = undefined;
	if argument_count>2 ssCheck = argument[2];

	if !is_undefined(ssCheck) && ssCheck != -1{
		var __ssecs = mapSSecPVISTable[| DEcam.Subsector ];
	
		if (__ssecs!=undefined){
			
			var __ss = 0;
		
			repeat ds_list_size(__ssecs){
				var __ssec = __ssecs[| __ss++ ];
				
				var sect = ds_list_find_value_fixed(mapGLSSects,__ssec);
				
				if point_in_boundaries(x0,y0,sect){
				
					var colmap=(sect.colmap);
			
					if (colmap != undefined){
						//trace("Checking if inside polygon");
			
						if point_in_polygon(-x0,y0,colmap) == true return __ssec;
					}
				}
			}
			shader_reset();

		}
	}else{
		var sects = mapGLSSects;
		var secnum;
		for (secnum=0;secnum<ds_list_size(sects);secnum++){
		    var sect=ds_list_find_value_fixed(sects,secnum);
				
			if point_in_boundaries(x0,y0,sect){
			    var colmap=(sect.colmap);
				if (colmap != undefined){
					//trace("Checking if inside polygon");
					if point_in_polygon(-x0,y0,colmap) == true return secnum;
				}
			}
		}
	}
	return -1;

}

function DE_FindSectorFloorHeight(sCheck){
	//DEtrace(sCheck);
	var _flr = sCheck.floorz;
	//DEtrace("Floor Height",_flr);
	return _flr;
}

function DE_FindSectorCeilingHeight(sCheck){
	//DEtrace(sCheck);
	var _ceil = sCheck.ceilingz+sCheck.crush;
	//DEtrace("Ceiling Height",_ceil);
	return _ceil;
}
/// @description DE_findSectorAt(x,y,sector)
function DE_findSectorAt(argument0, argument1, argument2) {

	var sects = ds_map_find_value_fixed(wad_levels,"sectors");
	var secnum;
	if argument2!=-1{
	    secnum=argument2;
	    var sect=ds_list_find_value_fixed(sects,secnum);
	    var colmap=ds_map_find_value(sect,"colmap");
    
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
    
	}else{
	    for (secnum=0;secnum<ds_list_size(sects);secnum++){
	        var sect=ds_list_find_value_fixed(sects,secnum);
	        var colmap=ds_map_find_value(sect,"colmap");
        
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
	    }
	}
	return -1;



}

function DE_findSubSectorAt(x0, y0){//, ssCheck) {

	var sects = mapGLSSects;
	var secnum;
	    for (secnum=0;secnum<ds_list_size(sects);secnum++){
	        var sect=ds_list_find_value_fixed(sects,secnum);
	        var colmap=ds_map_find_value(sect,"colmap");
			
			if (colmap != undefined){
				//trace("Checking if inside polygon");
				//ds_list_print(colmap);
			
				if point_in_polygon(-x0,y0,colmap) == true return secnum;
			}

	    }
	return -1;

}
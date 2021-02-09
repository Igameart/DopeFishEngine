function DE_buildPatch() {

	var patch = argument[0];

	var patch_width = ds_map_find_value_fixed(patch,"width");
	var patch_height = ds_map_find_value_fixed(patch,"height");
	var xOffset = ds_map_find_value_fixed(patch,"o_left");
	var yOffset = ds_map_find_value_fixed(patch,"o_top");
	var data = ds_map_find_value_fixed(patch,"data");

	//ds_map_print(patch);

	var surf=surface_create(patch_width,patch_height);

	surface_set_target(surf);
	draw_clear_alpha(0,0);

	draw_set_alpha(1);
	var pal1;

	for(var h=0;h<patch_height;h++){
	    for(var w=0;w<patch_width;w++){
		
	        pal1=ds_grid_get(data,w,h);
		
	        //if pal1>=0{
	            var pal2=ds_list_find_value(wadPlaypal,0);
				if pal2 != undefined
		            var col=ds_list_find_value(pal2,pal1);
					if col!=undefined
			            draw_point_color(w,h,col);
					//}else trace("patch pixel position:",w,h);
	        //}
	    }
	}

	surface_reset_target();

	var data2=sprite_create_from_surface(surf,0,0,patch_width,patch_height,0,0,xOffset,yOffset);

	surface_free(surf);

	return data2;



}

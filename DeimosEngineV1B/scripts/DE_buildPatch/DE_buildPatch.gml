function DE_buildPatch(patch) {

	var patch_width = ds_map_find_value(patch,"width");
	var patch_height = ds_map_find_value(patch,"height");
	var xOffset = ds_map_find_value_fixed(patch,"o_left");
	var yOffset = ds_map_find_value_fixed(patch,"o_top");
	var data = ds_map_find_value_fixed(patch,"data");

	//ds_map_print(patch);
	if patch_width == undefined || patch_height == undefined return undefined
	
	var surf=surface_create(patch_width,patch_height);

	surface_set_target(surf);
	draw_clear_alpha(0,0);

	draw_set_alpha(1);
	var pal1;
	var pal2=ds_list_find_value(wadPlaypal,0);
	
	for(var h=0;h<patch_height;h++){
	    for(var w=0;w<patch_width;w++){
		
	        pal1=ds_grid_get(data,w,h);
		
			if pal1!=undefined
	        if pal1>=0{
		            //var col = DE_ColorMapGetColor(pal1);
					var col = ds_list_find_value(pal2,pal1);
					if col!=undefined
			            draw_point_color(w,h,col);
	        }
	    }
	}

	surface_reset_target();

	var data2=sprite_create_from_surface(surf,0,0,patch_width,patch_height,0,0,xOffset,yOffset);

	surface_free(surf);

	return data2;



}

function DE_buildPatchBuffer( patch ) {

	var patch_width = ds_map_find_value_fixed(patch,"width");
	var patch_height = ds_map_find_value_fixed(patch,"height");
	var xOffset = ds_map_find_value_fixed(patch,"o_left");
	var yOffset = ds_map_find_value_fixed(patch,"o_top");
	var data = ds_map_find_value_fixed(patch,"data");

	var surf=surface_create(patch_width,patch_height);

	var pBuffer = buffer_create( (patch_width*patch_height) * 32 ,buffer_fast,1)

	var pal2=ds_list_find_value_fixed(wadPlaypalRAW,0);
	var pal1;
	for(var h=0;h<patch_height;h++){
	    for(var w=0;w<patch_width;w++){
		
	        pal1=ds_grid_get(data,w,h)
	        var RGBA=ds_list_find_value_fixed(pal2,pal1);
			
			//var RGBA = DE_ColorMapGetColorValues(pal1);
		
			if pal1 = -1 || RGBA == undefined RGBA = [255,0,255,0];
			
			buffer_write(pBuffer,buffer_u8,RGBA[0]);
			buffer_write(pBuffer,buffer_u8,RGBA[1]);
			buffer_write(pBuffer,buffer_u8,RGBA[2]);
			buffer_write(pBuffer,buffer_u8,RGBA[3]);
	    }
	}

	buffer_set_surface(pBuffer,surf,0);

	var spr=sprite_create_from_surface(surf,0,0,patch_width,patch_height,0,0,xOffset,yOffset);
	
	buffer_delete(pBuffer);

	wadCompedTextures[? spr] = sprite_get_texture(spr,0);

	surface_free(surf);

	return spr;



}

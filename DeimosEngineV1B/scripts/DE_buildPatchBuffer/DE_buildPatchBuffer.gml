function DE_buildPatchBuffer() {

	var patch = argument[0];

	var patch_width = ds_map_find_value_fixed(patch,"width");
	var patch_height = ds_map_find_value_fixed(patch,"height");
	var xOffset = ds_map_find_value_fixed(patch,"o_left");
	var yOffset = ds_map_find_value_fixed(patch,"o_top");
	var data = ds_map_find_value_fixed(patch,"data");

	var surf=surface_create(patch_width,patch_height);

	var pBuffer = buffer_create( (patch_width*patch_height) * 32 ,buffer_fast,1)

	//var cyan=make_color_rgb(0,255,255);

	//surface_set_target(surf);
	//draw_clear_alpha(0,0);
	//surface_reset_target();

	var pal1;
	for(var h=0;h<patch_height;h++){
	    for(var w=0;w<patch_width;w++){
		
	        pal1=ds_grid_get(data,w,h)
	        var pal2=ds_list_find_value_fixed(wadPlaypalRAW,0);
	        var RGBA=ds_list_find_value_fixed(pal2,pal1);
		
			if pal1 = -1 RGBA = [0,255,255];
		
			//var RGBA = [color_get_red(col),color_get_green(col),color_get_blue(col),pal1!=-1];
			
			buffer_write(pBuffer,buffer_u8,RGBA[0]);
			buffer_write(pBuffer,buffer_u8,RGBA[1]);
			buffer_write(pBuffer,buffer_u8,RGBA[2]);
			buffer_write(pBuffer,buffer_u8,pal1!=-1);
	    }
	}

	buffer_set_surface(pBuffer,surf,0);

	var spr=sprite_create_from_surface(surf,0,0,patch_width,patch_height,0,0,xOffset,yOffset);

	wadCompedTextures[? spr] = sprite_get_texture(spr,0);

	surface_free(surf);

	return spr;



}

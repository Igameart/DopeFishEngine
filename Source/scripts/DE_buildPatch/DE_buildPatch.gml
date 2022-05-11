function DE_buildPatch(patch,pname) {

	var patch_width		= (patch.width);
	var patch_height	= (patch.height);
	var xOffset			= (patch.leftoff);
	var yOffset			= (patch.topoff);
	var data			= (patch.contents);
	
	var assetName = (pname)+"_p_spr";
	
	var asset = asset_get_index( assetName );
	
	trace("Looking for internal patch",assetName);
	
	var data2;

	if patch_width == 0 || patch_height == 0 return undefined
	
	var surf=surface_create(patch_width,patch_height);

	surface_set_target(surf);
	draw_clear_alpha(0,0);

	draw_set_alpha(1);
	var pal1;
	var pal2=ds_list_find_value(wadPlaypal,0);
	
	if DETexInternal && asset > -1 {
		trace( "NOTICE: Found Internal patch:", assetName );
		draw_sprite(asset,0,0,0);
	}else{
	
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
	}

	surface_reset_target();

	data2=sprite_create_from_surface(surf,0,0,patch_width,patch_height,0,0,xOffset,yOffset);
	surface_free(surf);

	return data2;

}

function DE_buildPatchBuffer( patch ) {

	var patch_width		= (patch.width);
	var patch_height	= (patch.height);
	var xOffset			= (patch.leftoff);
	var yOffset			= (patch.topoff);
	var data			= (patch.contents);

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

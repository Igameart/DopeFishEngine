function DE_buildFlat(argument0,pname) {

	//var dat=argument0;
	var patch_width=64;
	var patch_height=64;
	
	var assetName = (pname)+"_f_spr";
	
	//assetName = string_replace(assetName," ","");
	
	var asset = asset_get_index( assetName );
	
	trace("Looking for internal flat",assetName);
	
	/*if DETexInternal && asset > -1 {
		
		trace("Found internal flat", assetName);
		
		var _ox = sprite_get_xoffset(asset);
		var _oy = sprite_get_yoffset(asset);		
		
		var spr = tpageFlats.insertSprite(asset,0,_ox,_oy);
		return spr;
		
	}*/

	var surf=surface_create(patch_width,patch_height);

	surface_set_target(surf);

	draw_clear(c_gray);
	draw_set_alpha(1);
	var idx=0;
	var pal1;
	
	if DETexInternal && asset > -1 {
		draw_sprite(asset,0,0,0);
	}else{
		for(var h=0;h<patch_height;h++){
		    for(var w=0;w<patch_width;w++){
		        pal1=ds_list_find_value(argument0,idx++);
				var pal2=ds_list_find_value(wadPlaypal,0);
				var col=ds_list_find_value(pal2,pal1);
		        draw_point_color(w,h,col);
		    }
		}
	}

	surface_reset_target();
	
	var spr = tpageFlats.insertSurface(surf);//, 1, 64, 64);

	//var spr=sprite_create_from_surface(surf,0,0,patch_width,patch_height,0,0,0,0);

	return spr;



}

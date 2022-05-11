/// @description DE_preload_textures()
function DE_preload_textures() {

	ds_map_clear(pload_tex);

	var side;
	var sides = ds_list_size(mapSidedefs);
	
	var unique = 0;
	
	var tArea = 0;

	for (var k=0;k<sides;k++) {

	    side = mapSidedefs[|k];
	
	    var tex;
	
	    tex=side.lowtex;
	    if tex!="-"{
		if is_undefined(pload_tex[? tex]){
			unique++;
			pload_tex[? tex] = -1;
			//if !DETexInternal || !sprite_exists(asset_get_index( string_lower(tex)+"_spr")){
				var tt	= ds_map_find_value_fixed(textures,tex);
				tArea += tt.width * tt.height;
			//}else{
			//	tArea += sprite_get_width(asset_get_index( string_lower(tex)+"_spr")) * sprite_get_height(asset_get_index( string_lower(tex)+"_spr"));
			//}
			
			var sTex = wadSwitchTextures[?tex];
			if DE_textureIsSwitch(tex) && !is_undefined(sTex){
				unique++;
				pload_tex[? sTex] = -1;
				//if !DETexInternal || !sprite_exists(asset_get_index( string_lower(sTex)+"_spr")){
					var tt	= ds_map_find_value_fixed(textures,sTex);
					tArea += tt.width * tt.height;
				//}else{
				//	tArea += sprite_get_width(asset_get_index( string_lower(sTex)+"_spr")) * sprite_get_height(asset_get_index( string_lower(sTex)+"_spr"));
				//}
			}
		}
		}
    
	    tex=side.uptex;
	    if tex!="-"{
		if is_undefined(pload_tex[? tex]){
			unique++;
			pload_tex[? tex] = -1;
			//if !DETexInternal || !sprite_exists(asset_get_index( string_lower(tex)+"_spr")){
				var tt	= ds_map_find_value_fixed(textures,tex);
				tArea += tt.width * tt.height;
			//}else{
			//	tArea += sprite_get_width(asset_get_index( string_lower(tex)+"_spr")) * sprite_get_height(asset_get_index( string_lower(tex)+"_spr"));
			//}
			var sTex = wadSwitchTextures[?tex];
			if DE_textureIsSwitch(tex) && !is_undefined(sTex){
				unique++;
				pload_tex[? sTex] = -1;
				//if !DETexInternal || !sprite_exists(asset_get_index( string_lower(sTex)+"_spr")){
					var tt	= ds_map_find_value_fixed(textures,sTex);
					tArea += tt.width * tt.height;
				//}else{
				//	tArea += sprite_get_width(asset_get_index( string_lower(sTex)+"_spr")) * sprite_get_height(asset_get_index( string_lower(sTex)+"_spr"));
				//}
			}
		}
		}
	
	    tex=side.midtex;
	    if tex!="-"{
		if is_undefined(pload_tex[? tex]){
			unique++;
			pload_tex[? tex] = -1;
			//if !DETexInternal || !sprite_exists(asset_get_index( string_lower(tex))){
				var tt	= ds_map_find_value_fixed(textures,tex);
				tArea += tt.width * tt.height;
			//}else{
			//	tArea += sprite_get_width(asset_get_index( string_lower(tex)+"_spr")) * sprite_get_height(asset_get_index( string_lower(tex)+"_spr"));
			//}
			var sTex = wadSwitchTextures[?tex];
			if DE_textureIsSwitch(tex) && !is_undefined(sTex){
				unique++;
				pload_tex[? sTex] = -1;
				//if !DETexInternal || !sprite_exists(asset_get_index( string_lower(sTex)+"_spr")){
					var tt	= ds_map_find_value_fixed(textures,sTex);
					tArea += tt.width * tt.height;
				//}else{
				//	tArea += sprite_get_width( asset_get_index( string_lower(sTex)+"_spr")) * sprite_get_height(asset_get_index( string_lower(sTex)+"_spr"));
				//}
			}
		}
		}
    
	}
	
	trace("Preloading Textures", unique,nextPowTwo(ceil( sqrt( tArea ) ) ) );
	
	var scalex = nextPowTwo( ceil( sqrt( tArea ) ) );
	var scaley = scalex;
	
	
	var tpArea = scalex * scaley;
	var done = false;
	
	do{
		if scalex * (scaley / 2) >= tArea then scaley/= 2; else done = true;
	}until done;
	
	
	globalvar tpageTextures; tpageTextures = new TexPage(scalex, scaley, 1);

	for (var k=0;k<sides;k++) {

	    side = mapSidedefs[|k];
	
	    var tex;
	
	    tex=side.lowtex;
	    if tex!="-"{
			DE_buildTexture(tex);
			if DE_textureIsSwitch(tex){
				var sTex = wadSwitchTextures[?tex];
				DE_buildTexture(sTex);
			}
		}
    
	    tex=side.uptex;
	    if tex!="-"{
			DE_buildTexture(tex);
			if DE_textureIsSwitch(tex){
				var sTex = wadSwitchTextures[?tex];
				DE_buildTexture(sTex);
			}
		}
	
	    tex=side.midtex;
	    if tex!="-"{
			DE_buildTexture(tex);
			if DE_textureIsSwitch(tex){
				var sTex = wadSwitchTextures[?tex];
				DE_buildTexture(sTex);
			}
		}
    
	}


	tpageTextures.finalize();
	
	sprite_save(tpageTextures.sprite, 0, game_save_id+"/Textures.png" );
	globalvar tTextures; tTextures = sprite_get_texture(tpageTextures.sprite,0);

}

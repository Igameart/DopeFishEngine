/// @description DE_preload_flats();
function DE_preload_flats() {

	var sects = ds_map_find_value_fixed(wad_levels,"sectors");

	for (j = 0; j<ds_list_size(sects); j++ ){
    
	    sect = ds_list_find_value(sects,j);
    
	    var sect,ctex,ftex;
	    ftex=ds_map_find_value_fixed(sect,"tex_f");
	    ctex=ds_map_find_value_fixed(sect,"tex_c");
    
	    if ftex!="-" and ftex!="F_SKY1" and ftex!="F_SKY" and ftex!="F_SKY001"
	
	    if is_undefined(ds_map_find_value(pload_flats,ftex)){
		
	        trace("building floor flat: '"+ftex+"'");
		
	        var spr=flats_[?ftex];
		
	        trace("spr value: '"+string(spr)+"'");
		
	        if !is_undefined(spr){
	            var flat1=DE_buildFlat(spr);
				wadCompedTextures[? ftex] = sprite_get_texture(flat1,0);
	            ds_map_replace(pload_flats,ftex,flat1);
	        }
	    }
    
	    if ctex!=ftex
	    if ctex!="-" and ctex!="F_SKY1" and ctex!="F_SKY" and ctex!="F_SKY001"
	    if is_undefined(ds_map_find_value(pload_flats,ctex)){
		
	        trace("building ceiling flat: '"+ctex+"'");
		
			var spr=flats_[?ftex];
		
	        trace("spr value: '"+string(spr)+"'");
		
	        if !is_undefined(spr){
	            var flat1=DE_buildFlat(spr);   
				wadCompedTextures[? ctex] = sprite_get_texture(flat1,0);
	            ds_map_replace(pload_flats,ctex,flat1);
	        }
	    }

	}



}
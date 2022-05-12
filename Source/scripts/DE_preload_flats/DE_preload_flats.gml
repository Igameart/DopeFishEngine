/// @description DE_preload_flats();
function DE_preload_flats() {

	var sects = mapSectors;//wadlevel.sectors;
	
	var count = ds_list_size(sects);
	
	var unique = 0;
	
	for (var j = 0; j<count; j++ ){
    
	    sect = ds_list_find_value(sects,j);
    
	    var sect,ctex,ftex;
	    ftex=(sect.floorpicnum);
	    ctex=(sect.ceilingpicnum);
    
		if is_string(ftex)
	    if ftex!="-" and ftex!="F_SKY1" and ftex!="F_SKY" and ftex!="F_SKY001"
	    if is_undefined( pload_flats[? ftex ] ){
			pload_flats[? ftex ] = -1;
			unique++;
	    }
		
		if is_string(ctex)
	    if ctex!=ftex
	    if ctex!="-" and ctex!="F_SKY1" and ctex!="F_SKY" and ctex!="F_SKY001"
	    if is_undefined(pload_flats[? ctex ]){
			pload_flats[? ctex ] = -1;
			unique++;
	    }

	}
	
	trace("Preloading Flats", unique);
	
	var tArea = 66 * 66 * unique;
	
	var scalex = nextPowTwo(66 * ceil(sqrt(unique)));
	var scaley = scalex;
	
	
	//var tpArea = scalex * scaley;
	var done = false;
	
	do{
		if scalex * (scaley / 2) >= tArea then scaley/= 2; else done = true;
	}until done;
	
	
	globalvar tpageFlats; tpageFlats = new TexPage(scalex, scaley, 1);

	for (var j = 0; j<count; j++ ){
    
	    sect = ds_list_find_value(sects,j);
    
	    var sect,ctex,ftex;
	    ftex=(sect.floorpicnum);
	    ctex=(sect.ceilingpicnum);
    
		if is_string(ftex)
	    if ftex!="-" and ftex!="F_SKY1" and ftex!="F_SKY" and ftex!="F_SKY001"
	    if is_undefined( pload_flats[? ftex ] ) || pload_flats[? ftex ] = -1{
	        //trace("building floor flat: '"+ftex+"'");
		
	        var spr=flats_[? ftex ];
		
	        trace("spr value: '"+string(spr)+"'");
		
	        if !is_undefined(spr){
	            var flat1=DE_buildFlat(spr,ftex);
				//wadCompedFlats[? ftex] = sprite_get_texture(flat1,0);
	            pload_flats[? ftex] = flat1;
	        }
	    }
		
		if is_string(ctex)
	    if ctex!=ftex
	    if ctex!="-" and ctex!="F_SKY1" and ctex!="F_SKY" and ctex!="F_SKY001"
	    if is_undefined(pload_flats[? ctex ]) || pload_flats[? ctex ] = -1{
	        //trace("building ceiling flat: '"+ctex+"'");
		
			var spr=flats_[?ctex];
		
	        trace("spr value: '"+string(spr)+"'");
		
	        if !is_undefined(spr){
	            var flat1=DE_buildFlat(spr,ctex);   
				//wadCompedFlats[? ctex] = sprite_get_texture(flat1,0);
	            ds_map_replace(pload_flats,ctex,flat1);
	        }
	    }

	}
	
	tpageFlats.finalize();
	
	sprite_save(tpageFlats.sprite, 0, game_save_id+"/Flats.png" );
	globalvar tFlats; tFlats = sprite_get_texture(tpageFlats.sprite,0);
	//clipboard_set_text(game_save_id);
	
}

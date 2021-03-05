/// @description DE_preload_textures()
function DE_preload_textures() {

	ds_map_clear(pload_tex);

	var side;
	var sides = ds_list_size(mapSidedefs);

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



}

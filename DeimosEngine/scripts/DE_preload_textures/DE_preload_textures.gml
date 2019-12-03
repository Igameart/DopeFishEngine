/// @description DE_preload_textures()

ds_map_clear(pload_tex);

var side;
var sides = ds_list_size(mapSidedefs);

for (var k=0;k<sides;k++) {

    side = mapSidedefs[|k];
	
    var tex;
	
    tex=ds_map_find_value(side,"tex_l");
    if tex!="-"{
		DE_buildTexture(tex);
		if DE_textureIsSwitch(tex){
			var sTex = wadSwitchTextures[?tex];
			DE_buildTexture(sTex);
		}
	}
    
    tex=ds_map_find_value(side,"tex_u");
    if tex!="-"{
		DE_buildTexture(tex);
		if DE_textureIsSwitch(tex){
			var sTex = wadSwitchTextures[?tex];
			DE_buildTexture(sTex);
		}
	}
	
    tex=ds_map_find_value(side,"tex_m");
    if tex!="-"{
		DE_buildTexture(tex);
		if DE_textureIsSwitch(tex){
			var sTex = wadSwitchTextures[?tex];
			DE_buildTexture(sTex);
		}
	}
    
}

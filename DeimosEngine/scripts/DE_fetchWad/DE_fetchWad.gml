wad=argument[0];

if DE_getFile(wad)=true{
	
    DE_getHeader();
    DE_getDirectory();
    DE_getColorMaps();
    DE_getPatches();
    DE_getWallTextures();
    DE_getFlatTextures();
	DE_getSprites();
	
}

DE_thingTypes();

draw_set_font(fnt_d4);
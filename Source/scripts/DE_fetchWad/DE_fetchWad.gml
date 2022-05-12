function DE_fetchWad( __wad ) {
	wad = __wad;

	if DE_getFile(wad)=true{
	
	    DE_getHeader();
		if DE_getDirectory()==true{ //if wad is GL
			
		    DE_getColorMaps();
		    DE_getPatches();
		    DE_getWallTextures();
		    DE_getFlatTextures();
			DE_getSprites();
			DE_getMapInfo();
			DE_gameData();
			
		}else return false;	
		
	}

	draw_set_font(fnt_d4);
	return true;
}

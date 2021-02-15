function DE_fetchWad( __wad ) {
	wad = __wad;

	if DE_getFile(wad)=true{
	
	    DE_getHeader();
	
		var wadType = wadHeader[?"id"]

		//if wadType == "IWAD"{
		    DE_getDirectory();
		    DE_getColorMaps();
		    DE_getPatches();
		    DE_getWallTextures();
		    DE_getFlatTextures();
			DE_getSprites();
		//}
	
	}

	draw_set_font(fnt_d4);

}

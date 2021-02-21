function DE_parse() {
	/* COMMENTED OUT UNTIL ALL SCRIPTS POINTED TO ARE IMPLEMENTED
	var filename=argument0,level=argument1,data=argument2;
	//DE_view=new jDataView(data);
	//DE_wad={};
	DE_getHeader();
	DE_getDirectory();
	DE_getColorMaps();

	// Grab and return the Title Screen straight away
	//postMessage({titlescreen:DE_getPatch('TITLEPIC')});

	DE_buildHUDTextures();
	DE_buildFpWeaponsTextures();
	DE_getLevel(level);
	DE_getPatches();
	DE_getWallTextures();
	DE_getFlatTextures();
	DE_getAudioFiles();

	DE_buildLevel(level);
	DE_buildThings(level);

	//sectors only give half the story so this builds the second half
	DE_buildSubsectors(level);

	show_debug_message("NOTICE: Finished Parsing "+filename+ ". Transfering Data back from Worker Thread");

	/* The following code is just a debug message, unimportant
	postMessage({
	'atlas':DE_wad.atlas,
	'audio':DE_wad.audio,
	'bsplines':DE_wad.bsplinesdata,
	'bsplinesindices':DE_wad.bsplinesindices,
	'indices':DE_wad.indices,
	'filename':filename,
	'flatdata':DE_wad.flatdata,
	'flatindices':DE_wad.flatindices,
	'flatlas':DE_wad.flatlas,
	'fpw':DE_wad.fpw,
	'fpwatlas':DE_wad.fpwatlas,
	'hud':DE_wad.hud,
	'hudatlas':DE_wad.hudatlas,
	'mapdata':DE_wad.mapdata,
	'nodes':DE_wad.nodes,
	'sectors':DE_wad.sectors,
	'sky':DE_wad.sky,
	'spawnPos':DE_wad.spawnPos,
	'spawnDir':DE_wad.spawnDir,
	'sprites':DE_wad.sprites,
	'test':DE_wad.levels[level].test,
	'things':DE_wad.levels[level].things,
	'thingsatlas':DE_wad.thingsatlas,
	'worldbb':DE_wad.worldbb
	});*/



}

/* COMMENTED OUT UNTIL ALL SCRIPTS POINTED TO ARE IMPLEMENTED
var filename=argument0,level=argument1,data=argument2;
//wadLoader_view=new jDataView(data);
//wadLoader_wad={};
wadLoader_getHeader();
wadLoader_getDirectory();
wadLoader_getColorMaps();

// Grab and return the Title Screen straight away
//postMessage({titlescreen:wadLoader_getPatch('TITLEPIC')});

wadLoader_buildHUDTextures();
wadLoader_buildFpWeaponsTextures();
wadLoader_getLevel(level);
wadLoader_getPatches();
wadLoader_getWallTextures();
wadLoader_getFlatTextures();
wadLoader_getAudioFiles();

wadLoader_buildLevel(level);
wadLoader_buildThings(level);

//sectors only give half the story so this builds the second half
wadLoader_buildSubsectors(level);

show_debug_message("NOTICE: Finished Parsing "+filename+ ". Transfering Data back from Worker Thread");

/* The following code is just a debug message, unimportant
postMessage({
'atlas':wadLoader_wad.atlas,
'audio':wadLoader_wad.audio,
'bsplines':wadLoader_wad.bsplinesdata,
'bsplinesindices':wadLoader_wad.bsplinesindices,
'indices':wadLoader_wad.indices,
'filename':filename,
'flatdata':wadLoader_wad.flatdata,
'flatindices':wadLoader_wad.flatindices,
'flatlas':wadLoader_wad.flatlas,
'fpw':wadLoader_wad.fpw,
'fpwatlas':wadLoader_wad.fpwatlas,
'hud':wadLoader_wad.hud,
'hudatlas':wadLoader_wad.hudatlas,
'mapdata':wadLoader_wad.mapdata,
'nodes':wadLoader_wad.nodes,
'sectors':wadLoader_wad.sectors,
'sky':wadLoader_wad.sky,
'spawnPos':wadLoader_wad.spawnPos,
'spawnDir':wadLoader_wad.spawnDir,
'sprites':wadLoader_wad.sprites,
'test':wadLoader_wad.levels[level].test,
'things':wadLoader_wad.levels[level].things,
'thingsatlas':wadLoader_wad.thingsatlas,
'worldbb':wadLoader_wad.worldbb
});*/

function DE_gameData() {
	trace("Game Type:",DENAMESPACE);

	//DE_initMacros();
	DE_Info();

	switch DENAMESPACE{
		case DEnameSpaces.DOOM:
			DE_thingTypesDOOM();
			DE_switchTypesDoom();
		break;
		case DEnameSpaces.HERETIC:
			DE_thingTypesHeretic();
		break;
		case DEnameSpaces.HEXEN:
			DE_thingTypesHexen();
		break;
		case DEnameSpaces.STRIFE:
			DE_thingTypesStrife();
		break;
	}
	
	DE_parseDecoratePrep();
	DE_parseMapInfoPrep();

}

function DE_getLevelMusic(){
	
	switch DENAMESPACE{
		case DEnameSpaces.DOOM:
			return DE_levelMusicDOOM();
		break;
		case DEnameSpaces.HERETIC:
			return DE_levelMusicHeretic();
		break;
		case DEnameSpaces.HEXEN:
			return DE_levelMusicHexen();
		break;
		case DEnameSpaces.STRIFE:
			return DE_levelMusicDOOM();
		break;
		
	}
}

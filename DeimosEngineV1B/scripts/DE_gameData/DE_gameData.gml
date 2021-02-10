function DE_gameData() {
	trace("Game Type:",DENAMESPACE);

	DE_ThingMacros();

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


}

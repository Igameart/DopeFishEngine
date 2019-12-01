globalvar DEThingType;

enum DEThingDef{
	Version,
	Radius,
	Height,
	Sprite,
	Sequence,
	Class,
	Description
}

/*if WAD_FORMAT=="DOOM"{
	if string_count("heretic",wad)>0{
		DE_thingTypesHeretic();
	}else{
		DE_thingTypesDOOM();
	}
}else{
	DE_thingTypesHexen();
}*/

trace("Game Type:",DEGameType);

switch DEGameType{
	case DEGameTypes.DOOM: DE_thingTypesDOOM(); break;
	case DEGameTypes.HERETIC: DE_thingTypesHeretic(); break;
	case DEGameTypes.HEXEN: DE_thingTypesHexen(); break;
	case DEGameTypes.STRIFE: DE_thingTypesStrife(); break;
}
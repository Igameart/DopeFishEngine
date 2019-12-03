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

trace("Game Type:",DEGameType);

switch DEGameType{
	case DEGameTypes.DOOM:
		DE_thingTypesDOOM();
		DE_switchTypesDoom();
	break;
	case DEGameTypes.HERETIC:
		DE_thingTypesHeretic();
	break;
	case DEGameTypes.HEXEN:
		DE_thingTypesHexen();
	break;
	case DEGameTypes.STRIFE:
		DE_thingTypesStrife();
	break;
}
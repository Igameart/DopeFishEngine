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

if WAD_FORMAT=="DOOM"{
	if string_count("heretic",wad)>0{
		DE_thingTypesHeretic();
	}else{
		DE_thingTypesDOOM();
	}
}else{
	DE_thingTypesHexen();
}
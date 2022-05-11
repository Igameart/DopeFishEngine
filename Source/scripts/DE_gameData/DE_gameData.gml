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
	DE_loadFontDefs();
	
	trace("Game Info Title Music:", DE_fetchMusicByLabel(wadGameInfo.titlemusic) );

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

function DE_loadFontDefs(){
// Fonts used by the alternative HUD

globalvar HUDFONT_DOOM;
HUDFONT_DOOM = ds_map_build();
	HUDFONT_DOOM[? "-"] = "STTMINUS";
	HUDFONT_DOOM[? "%"] = "STTPRCNT";
	HUDFONT_DOOM[? "0"] = "STTNUM0";
	HUDFONT_DOOM[? "1"] = "STTNUM1";
	HUDFONT_DOOM[? "2"] = "STTNUM2";
	HUDFONT_DOOM[? "3"] = "STTNUM3";
	HUDFONT_DOOM[? "4"] = "STTNUM4";
	HUDFONT_DOOM[? "5"] = "STTNUM5";
	HUDFONT_DOOM[? "6"] = "STTNUM6";
	HUDFONT_DOOM[? "7"] = "STTNUM7";
	HUDFONT_DOOM[? "8"] = "STTNUM8";
	HUDFONT_DOOM[? "9"] = "STTNUM9";
	HUDFONT_DOOM[? "NOTRANSLATION"] = "109"	// don't touch the shadow color!

globalvar HUDFONT_RAVEN;
HUDFONT_RAVEN = ds_map_build();
	HUDFONT_RAVEN[? "-"]="NEGNUM";
	HUDFONT_RAVEN[? "0"]="IN0";
	HUDFONT_RAVEN[? "1"]="IN1";
	HUDFONT_RAVEN[? "2"]="IN2";
	HUDFONT_RAVEN[? "3"]="IN3";
	HUDFONT_RAVEN[? "4"]="IN4";
	HUDFONT_RAVEN[? "5"]="IN5";
	HUDFONT_RAVEN[? "6"]="IN6";
	HUDFONT_RAVEN[? "7"]="IN7";
	HUDFONT_RAVEN[? "8"]="IN8";
	HUDFONT_RAVEN[? "9"]="IN9";

globalvar INDEXFONT_RAVEN;
INDEXFONT_RAVEN = ds_map_build();
   INDEXFONT_RAVEN[? "0"] = "SMALLIN0";
   INDEXFONT_RAVEN[? "1"] = "SMALLIN1";
   INDEXFONT_RAVEN[? "2"] = "SMALLIN2";
   INDEXFONT_RAVEN[? "3"] = "SMALLIN3";
   INDEXFONT_RAVEN[? "4"] = "SMALLIN4";
   INDEXFONT_RAVEN[? "5"] = "SMALLIN5";
   INDEXFONT_RAVEN[? "6"] = "SMALLIN6";
   INDEXFONT_RAVEN[? "7"] = "SMALLIN7";
   INDEXFONT_RAVEN[? "8"] = "SMALLIN8";
   INDEXFONT_RAVEN[? "9"] = "SMALLIN9";

globalvar INDEXFONT_DOOM;
INDEXFONT_DOOM = ds_map_build();
   INDEXFONT_DOOM[? "0"] = "STYSNUM0";
   INDEXFONT_DOOM[? "1"] = "STYSNUM1";
   INDEXFONT_DOOM[? "2"] = "STYSNUM2";
   INDEXFONT_DOOM[? "3"] = "STYSNUM3";
   INDEXFONT_DOOM[? "4"] = "STYSNUM4";
   INDEXFONT_DOOM[? "5"] = "STYSNUM5";
   INDEXFONT_DOOM[? "6"] = "STYSNUM6";
   INDEXFONT_DOOM[? "7"] = "STYSNUM7";
   INDEXFONT_DOOM[? "8"] = "STYSNUM8";
   INDEXFONT_DOOM[? "9"] = "STYSNUM9";

globalvar INDEXFONT_STRIFE_YELLOW;
INDEXFONT_STRIFE_YELLOW = ds_map_build();
	INDEXFONT_STRIFE_YELLOW[? "%"] = "INVFONY%";
	INDEXFONT_STRIFE_YELLOW[? "0"] = "INVFONY0";
	INDEXFONT_STRIFE_YELLOW[? "1"] = "INVFONY1";
	INDEXFONT_STRIFE_YELLOW[? "2"] = "INVFONY2";
	INDEXFONT_STRIFE_YELLOW[? "3"] = "INVFONY3";
	INDEXFONT_STRIFE_YELLOW[? "4"] = "INVFONY4";
	INDEXFONT_STRIFE_YELLOW[? "5"] = "INVFONY5";
	INDEXFONT_STRIFE_YELLOW[? "6"] = "INVFONY6";
	INDEXFONT_STRIFE_YELLOW[? "7"] = "INVFONY7";
	INDEXFONT_STRIFE_YELLOW[? "8"] = "INVFONY8";
	INDEXFONT_STRIFE_YELLOW[? "9"] = "INVFONY9";

globalvar INDEXFONT_STRIFE_GREEN;
INDEXFONT_STRIFE_GREEN = ds_map_build();
	INDEXFONT_STRIFE_GREEN[? "%"] = "INVFONG%";
	INDEXFONT_STRIFE_GREEN[? "0"] = "INVFONG0";
	INDEXFONT_STRIFE_GREEN[? "1"] = "INVFONG1";
	INDEXFONT_STRIFE_GREEN[? "2"] = "INVFONG2";
	INDEXFONT_STRIFE_GREEN[? "3"] = "INVFONG3";
	INDEXFONT_STRIFE_GREEN[? "4"] = "INVFONG4";
	INDEXFONT_STRIFE_GREEN[? "5"] = "INVFONG5";
	INDEXFONT_STRIFE_GREEN[? "6"] = "INVFONG6";
	INDEXFONT_STRIFE_GREEN[? "7"] = "INVFONG7";
	INDEXFONT_STRIFE_GREEN[? "8"] = "INVFONG8";
	INDEXFONT_STRIFE_GREEN[? "9"] = "INVFONG9";

// Doom and Chex intermissions use special text glyphs. The Raven and Strife
// games just use the standard big font.

globalvar IntermissionFont_Doom;
IntermissionFont_Doom = ds_map_build();
	IntermissionFont_Doom[? "%"] = "WIPCNT";
	IntermissionFont_Doom[? ":"] = "WICOLON";
	IntermissionFont_Doom[? "0"] = "WINUM0";
	IntermissionFont_Doom[? "1"] = "WINUM1";
	IntermissionFont_Doom[? "2"] = "WINUM2";
	IntermissionFont_Doom[? "3"] = "WINUM3";
	IntermissionFont_Doom[? "4"] = "WINUM4";
	IntermissionFont_Doom[? "5"] = "WINUM5";
	IntermissionFont_Doom[? "6"] = "WINUM6";
	IntermissionFont_Doom[? "7"] = "WINUM7";
	IntermissionFont_Doom[? "8"] = "WINUM8";
	IntermissionFont_Doom[? "9"] = "WINUM9";
	IntermissionFont_Doom[? "-"] = "WIMINUS";
	IntermissionFont_Doom[? "/"] = "WISLASH";
}

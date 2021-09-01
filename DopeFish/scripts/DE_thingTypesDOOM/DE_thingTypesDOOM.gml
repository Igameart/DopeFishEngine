function DE_thingTypesDOOM() {
	var thing;

	// **** Doom, Doom II, Final Doom **** //

	// ******** MONSTERS *********

	thing = [];
	DEActor[68] = thing;
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "64"
	thing[@ DEThingDef.Height ]= "64"
	thing[@ DEThingDef.Sprite ]= "BSPI"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_ARACH"

	thing = [];
	DEActor[64] = thing;
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "20"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "VILE"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_ARCH"

	thing = [];
	DEActor[3003] = thing;
	thing[@ DEThingDef.Version ]= "S"
	thing[@ DEThingDef.Radius ]= "24"
	thing[@ DEThingDef.Height ]= "64"
	thing[@ DEThingDef.Sprite ]= "BOSS"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_BARON"

	thing = [];
	DEActor[3005] = thing;
	thing[@ DEThingDef.Version ]= "R"
	thing[@ DEThingDef.Radius ]= "31"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "HEAD"
	thing[@ DEThingDef.Sequence ]= "A+"
	thing[@ DEThingDef.Class ]= "MO*^"
	thing[@ DEThingDef.Description ]= "CC_CACO"

	thing = [];
	DEActor[72] = thing;
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "16"
	thing[@ DEThingDef.Height ]= "72"
	thing[@ DEThingDef.Sprite ]= "KEEN"
	thing[@ DEThingDef.Sequence ]= "A+"
	thing[@ DEThingDef.Class ]= "MO*^"
	thing[@ DEThingDef.Description ]= "Commander Keen"

	thing = [];
	DEActor[16] = thing;
	thing[@ DEThingDef.Version ]= "R"
	thing[@ DEThingDef.Radius ]= "40"
	thing[@ DEThingDef.Height ]= "110"
	thing[@ DEThingDef.Sprite ]= "CYBR"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_CYBER"

	thing = [];
	DEActor[3002] = thing;
	thing[@ DEThingDef.Version ]= "S"
	thing[@ DEThingDef.Radius ]= "30"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "SARG"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_DEMON"

	thing = [];
	DEActor[65] = thing;
	//41    
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "20"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "CPOS"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_HEAVY" 

	thing = [];
	DEActor[69] = thing;
	//41 45  
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "24"
	thing[@ DEThingDef.Height ]= "64"
	thing[@ DEThingDef.Sprite ]= "BOS2"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_HELL" 

	thing = [];
	DEActor[3001] = thing;
	//41 BB9    
	thing[@ DEThingDef.Version ]= "S"
	thing[@ DEThingDef.Radius ]= "20"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "TROO"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_IMP"

	thing = [];
	DEActor[3006] = thing;
	//41 BBE    
	thing[@ DEThingDef.Version ]= "R"
	thing[@ DEThingDef.Radius ]= "16"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "SKUL"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "M1O*^"
	thing[@ DEThingDef.Description ]= "CC_LOST" 

	thing = [];
	DEActor[67] = thing;
	//41 43   
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "48"
	thing[@ DEThingDef.Height ]= "64"
	thing[@ DEThingDef.Sprite ]= "FATT"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_MANCU" 

	thing = [];
	DEActor[71] = thing;
	//41 47 
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "31"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "PAIN"
	thing[@ DEThingDef.Sequence ]= "A+"
	thing[@ DEThingDef.Class ]= "MO*^"
	thing[@ DEThingDef.Description ]= "CC_PAIN" 

	thing = [];
	DEActor[66] = thing;
	//41 42   
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "20"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "SKEL"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_REVEN" 

	thing = [];
	DEActor[9] = thing;
	//41 9  
	thing[@ DEThingDef.Version ]= "S"
	thing[@ DEThingDef.Radius ]= "20"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "SPOS"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_SHOTGUN"

	thing = [];
	DEActor[58] = thing;
	//41 3A  
	thing[@ DEThingDef.Version ]= "S"
	thing[@ DEThingDef.Radius ]= "30"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "SARG"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "Spectre"

	thing = [];
	DEActor[7] = thing;
	//41 7  
	thing[@ DEThingDef.Version ]= "R"
	thing[@ DEThingDef.Radius ]= "128"
	thing[@ DEThingDef.Height ]= "100"
	thing[@ DEThingDef.Sprite ]= "SPID"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_SPIDER" 

	thing = [];
	DEActor[84] = thing;
	//41 54 
	thing[@ DEThingDef.Version ]= "2"
	thing[@ DEThingDef.Radius ]= "20"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "SSWV"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "Wolfenstein SS"

	thing = [];
	DEActor[3004] = thing;
	//41 BBC 
	thing[@ DEThingDef.Version ]= "S"
	thing[@ DEThingDef.Radius ]= "20"
	thing[@ DEThingDef.Height ]= "56"
	thing[@ DEThingDef.Sprite ]= "POSS"
	thing[@ DEThingDef.Sequence ]= "AB+"
	thing[@ DEThingDef.Class ]= "MO*"
	thing[@ DEThingDef.Description ]= "CC_ZOMBIE"

	// ******** WEAPONS *********
	thing = [];
	DEActor[			 2006 	] = thing;
	//41 BBC 				7D6 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BFUG"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ]= "BFG9000"

	thing = [];
	DEActor[			 2002 ] = thing;
	//41 BBC 				 7D2 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MGUN"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ]= "Chaingun"

	thing = [];
	DEActor[			 2005] = thing;
	//41 BBC 				 7D5 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CSAW"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP2"
	thing[@ DEThingDef.Description ]= "Chainsaw"

	thing = [];
	DEActor[			 2004 ] = thing;
	//41 BBC                 7D4 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PLAS"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ]= "Plasma gun"

	thing = [];
	DEActor[			 2003 ] = thing;
	//41 BBC                 7D3 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"LAUN"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ]= "Rocket launcher"

	thing = [];
	DEActor[			 2001 ] = thing;
	//41 BBC                 7D1 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SHOT"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ]= "Shotgun"

	thing = [];
	DEActor[			 82 ] = thing;
	//41 BBC                 52 
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SGN2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ]= "Super shotgun"

	// ******** PICKUPS *********
	thing = [];
	DEActor[			 2008 ] = thing;
	//41 BBC                 7D8 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SHEL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "4 shotgun shells"

	thing = [];
	DEActor[			 2048 ] = thing;
	//41 BBC                 800 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMMO"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Box of bullets"

	thing = [];
	DEActor[			 2046 ] = thing;
	//41 BBC                 7FE 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BROK"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Box of rockets"

	thing = [];
	DEActor[			 2049 ] = thing;
	//41 BBC                 801 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SBOX"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Box of shotgun shells"

	thing = [];
	DEActor[			 2007 ] = thing;
	//41 BBC                 7D7 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CLIP"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Clip"

	thing = [];
	DEActor[			 2047 ] = thing;
	//41 BBC                 7FF 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CELL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Energy cell"

	thing = [];
	DEActor[			 17 ] = thing;
	//41 BBC                 11 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CELP"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Energy cell pack"

	thing = [];
	DEActor[			 2010 ] = thing;
	//41 BBC                 7DA 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ROCK"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Rocket"

	thing = [];
	DEActor[			 2015 ] = thing;
	//41 BBC                 7DF 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BON2"
	thing[@ DEThingDef.Sequence ] =	"ABCDCB"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Armor bonus"

	thing = [];
	DEActor[			 2023 ] = thing;
	//41 BBC                 7E7 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PSTR"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Berserk"

	thing = [];
	DEActor[			 2026 ] = thing;
	//41 BBC                 7EA 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PMAP"
	thing[@ DEThingDef.Sequence ] =	"ABCDCB"
	thing[@ DEThingDef.Class ] =		"AP1"
	thing[@ DEThingDef.Description ]= "Computer area map"

	thing = [];
	DEActor[			 2014 ] = thing;
	//41 BBC                 7DE 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BON1"
	thing[@ DEThingDef.Sequence ] =	"ABCDCB"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Health bonus"

	thing = [];
	DEActor[			 2022 ] = thing;
	//41 BBC                 7E6 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PINV"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Invulnerability"

	thing = [];
	DEActor[			 2045 ] = thing;
	//41 BBC                 7FD 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PVIS"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Light amplification visor"

	thing = [];
	DEActor[			 83 ] = thing;
	//41 BBC                 53 
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MEGA"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Megasphere"

	thing = [];
	DEActor[			 2024 ] = thing;
	//41 BBC                 7E8 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PINS"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Partial invisibility"

	thing = [];
	DEActor[			 2013 ] = thing;
	//41 BBC                 7DD 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SOUL"
	thing[@ DEThingDef.Sequence ] =	"ABCDCB"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ]= "Supercharge"

	thing = [];
	DEActor[			 2018 ] = thing;
	//41 BBC                 7E2 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ARM1"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ]= "Armor"

	thing = [];
	DEActor[			 8 ] = thing;
	//41 BBC                 8 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BPAK"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Backpack"

	thing = [];
	DEActor[			 2012 ] = thing;
	//41 BBC                 7DC 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MEDI"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P3"
	thing[@ DEThingDef.Description ]= "Medikit"

	thing = [];
	DEActor[			 2019 ] = thing;
	//41 BBC                 7E3 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ARM2"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P2"
	thing[@ DEThingDef.Description ]= "Mega armor"

	thing = [];
	DEActor[			 2025 ] = thing;
	//41 BBC                 7E9 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SUIT"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Radiation shielding suit"

	thing = [];
	DEActor[			 2011 ] = thing;
	//41 BBC                 7DB 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"STIM"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P3"
	thing[@ DEThingDef.Description ]= "Stimpack"

	thing = [];
	DEActor[			 5 ] = thing;
	//41 BBC                 5 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BKEY"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Blue keycard"

	thing = [];
	DEActor[			 40 ] = thing;
	//41 BBC                 28 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BSKU"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Blue skull key"

	thing = [];
	DEActor[			 13 ] = thing;
	//41 BBC                 D 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"RKEY"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Red keycard"

	thing = [];
	DEActor[			 38 ] = thing;
	//41 BBC                 26 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"RSKU"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Red skull key"

	thing = [];
	DEActor[			 6 ] = thing;
	//41 BBC                 6 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"YKEY"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Yellow keycard"

	thing = [];
	DEActor[			 39 ] = thing;
	//41 BBC                 27 
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"YSKU"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ]= "Yellow skull key"

	// ******** OBSTACLES *********
	thing = [];                                                                        
	DEActor[			 47] = thing;
	//41 BBC 2F                                                                                     
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SMIT"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Brown stump"
                                                                                                
	thing = [];                                                                        
	DEActor[			 70] = thing;
	//41 BBC 46                                                                                     
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FCAN"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Burning barrel"
                                                                                                
	thing = [];                                                                        
	DEActor[			 43] = thing;
	//41 BBC 2B                                                                                     
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TRE1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Burnt tree"
                                                                                                
	thing = [];                                                                        
	DEActor[			 35] = thing;
	//41 BBC 23                                                                                     
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CBRA"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Candelabra"
                                                                                                
	thing = [];                                                                        
	DEActor[			 41] = thing;
	//41 BBC 29                                                                                     
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CEYE"
	thing[@ DEThingDef.Sequence ] =	"ABCB"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Evil eye"
                                                                                                
	thing = [];                                                                        
	DEActor[			 2035] = thing;
	//41 BBC 7F3                                                                                    
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"42"
	thing[@ DEThingDef.Sprite ] =		"BAR1"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ]= "Exploding barrel"
                                                                                                
	thing = [];                                                                        
	DEActor[			 28] = thing;
	//41 BBC 1C                                                                                     
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"POL2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Five skulls 'shish kebab'"
                                                                                                
	thing = [];                                                                        
	DEActor[			 42] = thing;
	//41 BBC 2A                                                                                     
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FSKU"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Floating skull"
                                                                                                
	thing = [];                                                                        
	DEActor[			 2028] = thing;
	//41 BBC 7EC                                                                                    
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"COLU"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Floor lamp"
                                                                                                
	thing = [];                                                                        
	DEActor[			 53] = thing;
	//41 BBC 35                                                                                     
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"52"
	thing[@ DEThingDef.Sprite ] =		"GOR5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging leg"
                                                                                                
	thing = [];                                                                        
	DEActor[			 52] = thing;
	//41 BBC 34                                                                                     
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"68"
	thing[@ DEThingDef.Sprite ] =		"GOR4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging pair of legs"
                                                                                                
	thing = [];                                                                        
	DEActor[			 78] = thing;
	//41 BBC 4E                                                                                     
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"HDB6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging torso, brain removed"
                                                                                                
	thing = [];                                                                        
	DEActor[			 75] = thing;
	//41 BBC 4B                                                                                     
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"HDB3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging torso, looking down"
                                                                                                
	thing = [];                                                                        
	DEActor[			 77] = thing;
	//41 BBC 4D                                                                                     
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"HDB5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging torso, looking up"
                                                                                                
	thing = [];                                                                        
	DEActor[			 76] = thing;
	//41 BBC 4C                                                                                     
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"HDB4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging torso, open skull"

	thing = [];                                                                             
	DEActor[			 50] = thing;
	//41 BBC 32                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"84"
	thing[@ DEThingDef.Sprite ] =		"GOR2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging victim, arms out"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 74] = thing;
	//41 BBC 4A                                                                                          
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"88"
	thing[@ DEThingDef.Sprite ] =		"HDB2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging victim, guts and brain removed"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 73] = thing;
	//41 BBC 49                                                                                          
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"88"
	thing[@ DEThingDef.Sprite ] =		"HDB1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging victim, guts removed"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 51] = thing;
	//41 BBC 33                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"84"
	thing[@ DEThingDef.Sprite ] =		"GOR3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging victim, one-legged"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 49] = thing;
	//41 BBC 31                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"68"
	thing[@ DEThingDef.Sprite ] =		"GOR1"
	thing[@ DEThingDef.Sequence ] =	"ABCB"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ]= "Hanging victim, twitching"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 25] = thing;
	//41 BBC 19                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"POL1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Impaled human"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 54] = thing;
	//41 BBC 36                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"32"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TRE2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Large brown tree"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 29] = thing;
	//41 BBC 1D                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"POL3"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Pile of skulls and candles"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 55] = thing;
	//41 BBC 37                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SMBT"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short blue firestick"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 56] = thing;
	//41 BBC 38                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SMGT"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short green firestick"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 31] = thing;
	//41 BBC 1F                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"COL2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short green pillar"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 36] = thing;
	//41 BBC 24                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"COL5"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short green pillar with beating heart"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 57] = thing;
	//41 BBC 39                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SMRT"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short red firestick"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 33] = thing;
	//41 BBC 21                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"COL4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short red pillar"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 37] = thing;
	//41 BBC 25                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"COL6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short red pillar with skull"

	thing = [];                                                                             
	DEActor[			 86] = thing;
	//41 BBC 56                                                                                          
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TLP2"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Short techno floor lamp"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 27] = thing;
	//41 BBC 1B                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"POL4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Skull on a pole"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 44] = thing;
	//41 BBC 2C                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TBLU"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Tall blue firestick"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 45] = thing;
	//41 BBC 2D                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TGRN"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Tall green firestick"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 30] = thing;
	//41 BBC 1E                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"COL1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Tall green pillar"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 46] = thing;
	//41 BBC 2E                                                                                          
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TRED"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Tall red firestick"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 32] = thing;
	//41 BBC 20                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"COL3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Tall red pillar"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 48] = thing;
	//41 BBC 30                                                                                          
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ELEC"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Tall techno column"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 85] = thing;
	//41 BBC 55                                                                                          
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TLMP"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Tall techno floor lamp"
                                                                                                     
	thing = [];                                                                             
	DEActor[			 26] = thing;
	//41 BBC 1A                                                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"POL6"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ]= "Twitching impaled human"

	// ******** DECORATIONS *********
	thing = [];                      
	DEActor[10] = thing;
	//41 BBC                 A                    
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"PLAY"         
	thing[@ DEThingDef.Sequence ] =	"W"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Bloody mess"          
                         
	thing = [];                       
	DEActor[12] = thing;
	//41 BBC                 C                     
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"PLAY"         
	thing[@ DEThingDef.Sequence ] =	"W"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Bloody mess"         
                         
	thing = [];                   
	DEActor[34] = thing;
	//41 BBC                 22                
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"CAND"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Candle"         
                         
	thing = [];                           
	DEActor[22] = thing;
	//41 BBC                 16                        
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"HEAD"         
	thing[@ DEThingDef.Sequence ] =	"L"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Dead cacodemon"         

	thing = [];                     
	DEActor[21] = thing;
	//41 BBC                 15                  
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"SARG"         
	thing[@ DEThingDef.Sequence ] =	"N"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Dead demon"          
                         
	thing = [];                            
	DEActor[18] = thing;
	//41 BBC                 12                         
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"POSS"         
	thing[@ DEThingDef.Sequence ] =	"L"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Dead former human"          
                         
	thing = [];                               
	DEActor[19] = thing;
	//41 BBC                 13                            
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"SPOS"         
	thing[@ DEThingDef.Sequence ] =	"L"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Dead former sergeant"          
                         
	thing = [];                   
	DEActor[20] = thing;
	//41 BBC                 14                
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"TROO"         
	thing[@ DEThingDef.Sequence ] =	"M"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Dead imp"          

	thing = [];                                     
	DEActor[23] = thing;
	//41 BBC                 17                                  
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"SKUL"         
	thing[@ DEThingDef.Sequence ] =	"K"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Dead lost soul (invisible)"          
                         
	thing = [];                      
	DEActor[15] = thing;
	//41 BBC                 F                    
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"PLAY"         
	thing[@ DEThingDef.Sequence ] =	"N"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Dead player"          
                         
	thing = [];                      
	DEActor[62] = thing;
	//41 BBC                 3E                   
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"52"         
	thing[@ DEThingDef.Sprite ] =		"GOR5"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ]= "Hanging leg"          
                         
	thing = [];                               
	DEActor[60] = thing;
	//41 BBC                 3C                            
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"68"         
	thing[@ DEThingDef.Sprite ] =		"GOR4"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ]= "Hanging pair of legs"          

	thing = [];                                   
	DEActor[59] = thing;
	//41 BBC                 3B                                
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"84"         
	thing[@ DEThingDef.Sprite ] =		"GOR2"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ]= "Hanging victim, arms out"          
                         
	thing = [];                                     
	DEActor[61] = thing;
	//41 BBC                 3D                                  
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"52"         
	thing[@ DEThingDef.Sprite ] =		"GOR3"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ]= "Hanging victim, one-legged"          
                         
	thing = [];                                    
	DEActor[63] = thing;
	//41 BBC                 3F                                 
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"68"         
	thing[@ DEThingDef.Sprite ] =		"GOR1"         
	thing[@ DEThingDef.Sequence ] =	"ABCB"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ]= "Hanging victim, twitching"          
                         
	thing = [];                        
	DEActor[79] = thing;
	//41 BBC                 4F                     
	thing[@ DEThingDef.Version ] =		"2"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"POB1"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Pool of blood"          

	thing = [];                        
	DEActor[80] = thing;
	//41 BBC                 50                     
	thing[@ DEThingDef.Version ] =		"2"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"POB2"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Pool of blood"          
                         
	thing = [];                                  
	DEActor[24] = thing;
	//41 BBC                 18                               
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"POL5"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Pool of blood and flesh"          
                         
	thing = [];                         
	DEActor[81] = thing;
	//41 BBC                 51                      
	thing[@ DEThingDef.Version ] =		"2"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"BRS1"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Pool of brains" 

	// ******** OTHER *********
	thing = [];                           
	DEActor[			 11] = thing;
	//41 BBC                 B                         
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"16"         
	thing[@ DEThingDef.Height ] =		"56"         
	thing[@ DEThingDef.Sprite ] =		"none"         
	thing[@ DEThingDef.Sequence ] =	"-"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Deathmatch start"          
                                                   
	thing = [];                           
	DEActor[			 89] = thing;
	//41 BBC                 59                        
	thing[@ DEThingDef.Version ] =		"2"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"32"         
	thing[@ DEThingDef.Sprite ] =		"none1"         
	thing[@ DEThingDef.Sequence ] =	"-"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Monster spawner"         
                                                   
	thing = [];                           
	DEActor[			 1] = thing;
	//41 BBC                 1                         
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"16"         
	thing[@ DEThingDef.Height ] =		"56"         
	thing[@ DEThingDef.Sprite ] =		"PLAY"         
	thing[@ DEThingDef.Sequence ] =	"A+"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Player 1 start"         
                                                   
	thing = [];                           
	DEActor[			 2] = thing;
	//41 BBC                 2                         
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"16"         
	thing[@ DEThingDef.Height ] =		"56"         
	thing[@ DEThingDef.Sprite ] =		"PLAY"         
	thing[@ DEThingDef.Sequence ] =	"A+"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Player 2 start"         
                                                   
	thing = [];                           
	DEActor[			 3] = thing;
	//41 BBC                 3                         
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"16"         
	thing[@ DEThingDef.Height ] =		"56"         
	thing[@ DEThingDef.Sprite ] =		"PLAY"         
	thing[@ DEThingDef.Sequence ] =	"A+"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ]= "Player 3 start"
                                         
	thing = [];                 
	DEActor[			 4] = thing;
	//41 BBC 4                               
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"56"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ]= "Player 4 start"
                                         
	thing = [];                 
	DEActor[			 88] = thing;
	//41 BBC 58                              
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BBRN"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O2*"
	thing[@ DEThingDef.Description ]= "Romero's head"
                                         
	thing = [];                 
	DEActor[			 87] = thing;
	//41 BBC 57                              
	thing[@ DEThingDef.Version ] =		"2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"none3"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ]= "Spawn spot"
                                         
	thing = [];                 
	DEActor[			 14] = thing;
	//41 BBC E                               
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none4"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ]= "Teleport landing" 


}

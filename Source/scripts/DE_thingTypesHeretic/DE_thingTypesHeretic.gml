function DE_levelMusicHeretic(){
	var Lump = "";
	switch DEMap{
		
		case "TITL": Lump = "MUS_TITL"; break;
		case "INTR": Lump = "MUS_INTR"; break;
		case "CPTD": Lump = "MUS_CPTD"; break;

		case "E1M1": Lump = "MUS_E1M1"; break;
		case "E1M2": Lump = "MUS_E1M2"; break;
		case "E1M3": Lump = "MUS_E1M3"; break;
		case "E1M4": Lump = "MUS_E1M4"; break;
		case "E1M5": Lump = "MUS_E1M5"; break;
		case "E1M6": Lump = "MUS_E1M6"; break;
		case "E1M7": Lump = "MUS_E1M7"; break;
		case "E1M8": Lump = "MUS_E1M8"; break;
		case "E1M9": Lump = "MUS_E1M9"; break;
		
		case "E2M1": Lump = "MUS_E2M1"; break;
		case "E2M2": Lump = "MUS_E2M2"; break;
		case "E2M3": Lump = "MUS_E2M3"; break;
		case "E2M4": Lump = "MUS_E2M4"; break;
		case "E2M5": Lump = "MUS_E1M4"; break;
		case "E2M6": Lump = "MUS_E2M6"; break;
		case "E2M7": Lump = "MUS_E2M7"; break;
		case "E2M8": Lump = "MUS_E2M8"; break;
		case "E2M9": Lump = "MUS_E2M9"; break;
		
		case "E3M1": Lump = "MUS_E1M1"; break;
		case "E3M2": Lump = "MUS_E3M2"; break;
		case "E3M3": Lump = "MUS_E3M3"; break;
		case "E3M4": Lump = "MUS_E1M6"; break;
		case "E3M5": Lump = "MUS_E1M3"; break;
		case "E3M6": Lump = "MUS_E1M2"; break;
		case "E3M7": Lump = "MUS_E1M5"; break;
		case "E3M8": Lump = "MUS_E1M9"; break;
		case "E3M9": Lump = "MUS_E2M6"; break;
		
		case "E4M1": Lump = "MUS_E1M6"; break;
		case "E4M2": Lump = "MUS_E1M2"; break;
		case "E4M3": Lump = "MUS_E1M3"; break;
		case "E4M4": Lump = "MUS_E1M4"; break;
		case "E4M5": Lump = "MUS_E1M5"; break;
		case "E4M6": Lump = "MUS_E1M1"; break;
		case "E4M7": Lump = "MUS_E1M7"; break;
		case "E4M8": Lump = "MUS_E1M8"; break;
		case "E4M9": Lump = "MUS_E1M9"; break;
		
		case "E5M1": Lump = "MUS_E2M1"; break;
		case "E5M2": Lump = "MUS_E2M2"; break;
		case "E5M3": Lump = "MUS_E2M3"; break;
		case "E5M4": Lump = "MUS_E2M4"; break;
		case "E5M5": Lump = "MUS_E1M4"; break;
		case "E5M6": Lump = "MUS_E2M6"; break;
		case "E5M7": Lump = "MUS_E2M7"; break;
		case "E5M8": Lump = "MUS_E2M8"; break;
		case "E5M9": Lump = "MUS_E2M9"; break;
		
		case "E6M1": Lump = "MUS_E3M2"; break;
		case "E6M2": Lump = "MUS_E3M3"; break;
		case "E6M3": Lump = "MUS_E1M6"; break;
	}
	//DEtrace("Found Music:",Lump);
	return Lump;
}
function DE_thingTypesHeretic() {

	// **** HERETIC **** //

	var thing;

	// ******** MONSTERS *********
	thing = [];                                                      
	DEActor[			 7] = thing;
	//41 BBC                 7                                                    
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"28"         
	thing[@ DEThingDef.Height ] =		"100"         
	thing[@ DEThingDef.Sprite ] =		"SRCR1"         
	thing[@ DEThingDef.Sequence ] =	"AB+"         
	thing[@ DEThingDef.Class ] =		"MO*"         
	thing[@ DEThingDef.Description ] = "D'Sparil"         
                                                                              
	thing = [];                                                      
	DEActor[			 15] = thing;
	//41 BBC                 F                                                    
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"16"         
	thing[@ DEThingDef.Height ] =		"68"         
	thing[@ DEThingDef.Sprite ] =		"WZRD"         
	thing[@ DEThingDef.Sequence ] =		"AB+"         
	thing[@ DEThingDef.Class ] =		"MO*^"         
	thing[@ DEThingDef.Description ] = "Disciple of D'Sparil"         
                                                                              
	thing = [];                                                      
	DEActor[			 5] = thing;
	//41 BBC                 5                                                    
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"16"         
	thing[@ DEThingDef.Height ] =		"36"         
	thing[@ DEThingDef.Sprite ] =		"IMPX"         
	thing[@ DEThingDef.Sequence ] =	"ABCB+"         
	thing[@ DEThingDef.Class ] =		"MO*^"         
	thing[@ DEThingDef.Description ] = "Fire gargoyle"         
                                                                              
	thing = [];                                                      
	DEActor[			 66] = thing;
	//41 BBC                 42                                                   
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"16"         
	thing[@ DEThingDef.Height ] =		"36"         
	thing[@ DEThingDef.Sprite ] =		"IMPX"         
	thing[@ DEThingDef.Sequence ] =	"ABCB+"         
	thing[@ DEThingDef.Class ] =		"MO*^"         
	thing[@ DEThingDef.Description ] = "Gargoyle"
                                                                    
	thing = [];                                            
	DEActor[			 68] = thing;
	//41 BBC                 44                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"MUMM"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Golem"
                                                                    
	thing = [];                                            
	DEActor[			 69] = thing;
	//41 BBC 45                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"MUMM"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Golem ghost"
                                                                    
	thing = [];                                            
	DEActor[			 6] = thing;
	//41 BBC 6                                                          
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"40"
	thing[@ DEThingDef.Height ] =		"72"
	thing[@ DEThingDef.Sprite ] =		"HEAD"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Iron lich"
                                                                    
	thing = [];                                            
	DEActor[			 9] = thing;
	//41 BBC 9                                                          
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"28"
	thing[@ DEThingDef.Height ] =		"100"
	thing[@ DEThingDef.Sprite ] =		"MNTR"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Maulotaur"
                                                                    
	thing = [];                                            
	DEActor[			 45] = thing;
	//41 BBC 2D                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"MUMM"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Nitrogolem"
                                                                    
	thing = [];                                            
	DEActor[			 46] = thing;
	//41 BBC 2E                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"MUMM"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Nitrogolem ghost"
                                                                    
	thing = [];                                            
	DEActor[			 92] = thing;
	//41 BBC 5C                                                         
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"70"
	thing[@ DEThingDef.Sprite ] =		"SNKE"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Ophidian"
                                                                    
	thing = [];                                            
	DEActor[			 90] = thing;
	//41 BBC 5A                                                         
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"CLNK"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Sabreclaw"
                                                                    
	thing = [];                                            
	DEActor[			 64] = thing;
	//41 BBC 40                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"24"
	thing[@ DEThingDef.Height ] =		"78"
	thing[@ DEThingDef.Sprite ] =		"KNIG"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Undead Warrior"
                                                                    
	thing = [];                                            
	DEActor[			 65] = thing;
	//41 BBC 41                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"24"
	thing[@ DEThingDef.Height ] =		"78"
	thing[@ DEThingDef.Sprite ] =		"KNIG"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Undead Warrior ghost"
                                                                    
	thing = [];                                            
	DEActor[			 70] = thing;
	//41 BBC 46                                                         
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"32"
	thing[@ DEThingDef.Height ] =		"74"
	thing[@ DEThingDef.Sprite ] =		"BEAS"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Weredragon"

	// ******** WEAPONS *********
	thing = [];                                           
	DEActor[53] = thing; 
	//41 BBC                 35
	thing[@ DEThingDef.Version ] =		"S"          
	thing[@ DEThingDef.Radius ] =		"20"          
	thing[@ DEThingDef.Height ] =		"16"          
	thing[@ DEThingDef.Sprite ] =		"WBLS"          
	thing[@ DEThingDef.Sequence ] =	"A"          
	thing[@ DEThingDef.Class ] =		"WP1"          
	thing[@ DEThingDef.Description ] = "Dragon Claw"          
                                                                   
	thing = [];                                           
	DEActor[2001] = thing; 
	//41 BBC                 7D1
	thing[@ DEThingDef.Version ] =		"S"          
	thing[@ DEThingDef.Radius ] =		"20"          
	thing[@ DEThingDef.Height ] =		"16"          
	thing[@ DEThingDef.Sprite ] =		"WBOW"          
	thing[@ DEThingDef.Sequence ] =	"A"          
	thing[@ DEThingDef.Class ] =		"WP1"          
	thing[@ DEThingDef.Description ] = "Ethereal Crossbow"          
                                                                   
	thing = [];                                           
	DEActor[2002] = thing; 
	//41 BBC                 7D2
	thing[@ DEThingDef.Version ] =		"R"          
	thing[@ DEThingDef.Radius ] =		"20"          
	thing[@ DEThingDef.Height ] =		"16"          
	thing[@ DEThingDef.Sprite ] =		"WMCE"          
	thing[@ DEThingDef.Sequence ] =	"A"          
	thing[@ DEThingDef.Class ] =		"WP1"          
	thing[@ DEThingDef.Description ] = "Firemace"          
                                                                   
	thing = [];                                           
	DEActor[2005] = thing; 
	//41 BBC                 7D5
	thing[@ DEThingDef.Version ] =		"S"          
	thing[@ DEThingDef.Radius ] =		"20"          
	thing[@ DEThingDef.Height ] =		"16"          
	thing[@ DEThingDef.Sprite ] =		"WGNT"          
	thing[@ DEThingDef.Sequence ] =	"A"          
	thing[@ DEThingDef.Class ] =		"WP2"          
	thing[@ DEThingDef.Description ] = "Gauntlets of the Necromancer"
                                                        
	thing = [];                                
	DEActor[2004] = thing;
	//41 BBC 7D4                                            
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WSKL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ] = "Hellstaff"
                                                        
	thing = [];                                
	DEActor[2003] = thing;
	//41 BBC 7D3                                            
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WPHX"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP1"
	thing[@ DEThingDef.Description ] = "Phoenix Rod"

	// ******** PICKUPS *********
	thing = [];                                             
	DEActor				[54] = thing;
	//41 BBC                 36
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"AMB1"         
	thing[@ DEThingDef.Sequence ] =	"ABC"         
	thing[@ DEThingDef.Class ] =		"P1"         
	thing[@ DEThingDef.Description ] = "Claw Orb"         
                                                                     
	thing = [];                                             
	DEActor				[12] = thing;
	//41 BBC                 C
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"AMG2"         
	thing[@ DEThingDef.Sequence ] =	"ABC"         
	thing[@ DEThingDef.Class ] =		"P1"         
	thing[@ DEThingDef.Description ] = "Crystal Geode"         
                                                                     
	thing = [];                                             
	DEActor				[55] = thing;
	//41 BBC                 37
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"AMB2"         
	thing[@ DEThingDef.Sequence ] =	"ABC"         
	thing[@ DEThingDef.Class ] =		"P1"         
	thing[@ DEThingDef.Description ] = "Energy Orb"         
                                                                     
	thing = [];                                             
	DEActor				[18] = thing;
	//41 BBC                 12
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"AMC1"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"P1"         
	thing[@ DEThingDef.Description ] = "Ethereal Arrows"
                                                           
	thing = [];                                   
	DEActor				[22] = thing;
	//41 BBC 16                                                
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMP1"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Flame Orb"
                                                           
	thing = [];                                   
	DEActor				[21] = thing;
	//41 BBC 15                                                
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMS2"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Greater Runes"
                                                           
	thing = [];                                   
	DEActor				[23] = thing;
	//41 BBC 17
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMP2"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Inferno Orb"
                                                           
	thing = [];                                   
	DEActor				[20] = thing;
	//41 BBC 14                                                
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMS1"
	thing[@ DEThingDef.Sequence ] =	"AB"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Lesser Runes"
                                                           
	thing = [];                                   
	DEActor				[13] = thing;
	//41 BBC D
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMM1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Mace Spheres"
                                                           
	thing = [];                                   
	DEActor				[16] = thing;
	//41 BBC 10                                                
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMM2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Pile of Mace Spheres"
                                                           
	thing = [];                                   
	DEActor				[19] = thing;
	//41 BBC 13
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMC2"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Quiver of Ethereal Arrows"
                                                           
	thing = [];                                   
	DEActor				[10] = thing;
	//41 BBC A                                                 
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMG1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Wand Crystal"

	thing = [];               
	DEActor				[8] = thing;
	//41 BBC                 8
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"BAGH"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"AP"         
	thing[@ DEThingDef.Description ] = "Bag of Holding"         
               
	thing = [];               
	DEActor				[36] = thing;
	//41 BBC                 24
	thing[@ DEThingDef.Version ] =		"R"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"ATLP"         
	thing[@ DEThingDef.Sequence ] =	"ABCB"         
	thing[@ DEThingDef.Class ] =		"AP"         
	thing[@ DEThingDef.Description ] = "Chaos Device"         
               
	thing = [];               
	DEActor				[35] = thing;
	//41 BBC                 23
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"SPMP"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"AP"         
	thing[@ DEThingDef.Description ] = "Map Scroll"         
               
	thing = [];               
	DEActor				[30] = thing;
	//41 BBC                 1E            
	thing[@ DEThingDef.Version ] =		"S"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"EGGC"         
	thing[@ DEThingDef.Sequence ] =	"ABCB"         
	thing[@ DEThingDef.Class ] =		"AP"         
	thing[@ DEThingDef.Description ] = "Morph Ovum"
     
	thing = [];     
	DEActor				[32] = thing;
	//41 BBC 20
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SPHL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Mystic Urn"
     
	thing = [];     
	DEActor				[82] = thing;
	//41 BBC 52                  
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PTN2"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Quartz Flask"
     
	thing = [];     
	DEActor				[84] = thing;
	//41 BBC 54                  
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"INVU"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Ring of Invincibility"
     
	thing = [];     
	DEActor				[75  ] = thing;
	//41 BBC 4B                  
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"INVS"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Shadowsphere"
     
	thing = [];     
	DEActor				[34  ] = thing;
	//41 BBC 22                  
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FBMB"
	thing[@ DEThingDef.Sequence ] =	"E+"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Timebomb of the Ancients"
     
	thing = [];     
	DEActor				[86  ] = thing;
	//41 BBC 56                  
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PWBK"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Tome of Power"
     
	thing = [];     
	DEActor				[33  ] = thing;
	//41 BBC 21                  
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TRCH"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Torch"
     
	thing = [];     
	DEActor				[83  ] = thing;
	//41 BBC 53                  
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SOAR"
	thing[@ DEThingDef.Sequence ] =	"ABCB"
	thing[@ DEThingDef.Class ] =		"AP"
	thing[@ DEThingDef.Description ] = "Wings of Wrath"

	thing = [];                           
	DEActor				[81] = thing;
	//41 BBC                 51
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"PTN1"    
	thing[@ DEThingDef.Sequence ] =	"ABC"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Crystal Vial"     
                                              
	thing = [];                           
	DEActor				[31] = thing;
	//41 BBC                 1F                        
	thing[@ DEThingDef.Version ] =		"R"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"SHD2"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Enchanted Shield"     
                                              
	thing = [];                           
	DEActor				[85] = thing;
	//41 BBC                 55                        
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"SHLD"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Silver Shield"     
                                              
	thing = [];                           
	DEActor				[79] = thing;
	//41 BBC                 4F                        
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"BKYY"    
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJ"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Blue key"
                                              
	thing = [];                      
	DEActor				[73] = thing;
	//41 BBC 49                                   
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AKYY"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJ"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Green key"
                                              
	thing = [];                      
	DEActor				[80] = thing;
	//41 BBC 50                                   
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CKYY"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHI"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Yellow key"

	// ******** OBSTACLES *********
	thing = [];                                      
	DEActor				[44] = thing;
	//41 BBC                 2C
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"12"    
	thing[@ DEThingDef.Height ] =		"32"    
	thing[@ DEThingDef.Sprite ] =		"BARL"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"O"    
	thing[@ DEThingDef.Description ] = "Barrel"     
                                                         
	thing = [];                                      
	DEActor				[76] = thing;
	//41 BBC                 4C
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"16"    
	thing[@ DEThingDef.Height ] =		"44"    
	thing[@ DEThingDef.Sprite ] =		"KFR1"    
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"    
	thing[@ DEThingDef.Class ] =		"O"    
	thing[@ DEThingDef.Description ] = "Fire brazier"     
                                                         
	thing = [];                                      
	DEActor				[51] = thing;
	//41 BBC                 33
	thing[@ DEThingDef.Version ] =		"R"    
	thing[@ DEThingDef.Radius ] =		"8"    
	thing[@ DEThingDef.Height ] =		"104"    
	thing[@ DEThingDef.Sprite ] =		"HCOR"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"O^"    
	thing[@ DEThingDef.Description ] = "Hanging corpse"     
                                                         
	thing = [];                                      
	DEActor				[40] = thing;
	//41 BBC                 28
	thing[@ DEThingDef.Version ] =		"R"    
	thing[@ DEThingDef.Radius ] =		"12"    
	thing[@ DEThingDef.Height ] =		"68"    
	thing[@ DEThingDef.Sprite ] =		"STCL"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"O^"    
	thing[@ DEThingDef.Description ] = "Large stalactite"
                                                         
	thing = [];                                 
	DEActor				[38] = thing;
	//41 BBC 26
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"STGL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Large stalagmite"
                                                         
	thing = [];                                 
	DEActor				[27] = thing;
	//41 BBC 1B
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"54"
	thing[@ DEThingDef.Sprite ] =		"SRTC"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Serpent torch"
                                                         
	thing = [];                                 
	DEActor				[29] = thing;
	//41 BBC 1D
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"34"
	thing[@ DEThingDef.Sprite ] =		"SMPL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Short grey pillar"
                                                         
	thing = [];                                 
	DEActor				[39] = thing;
	//41 BBC 27
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"36"
	thing[@ DEThingDef.Sprite ] =		"STCS"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Small stalactite"
                                                         
	thing = [];                                 
	DEActor				[37] = thing;
	//41 BBC 25
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"STGS"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Small stalagmite"
                                                         
	thing = [];                                 
	DEActor				[47] = thing;
	//41 BBC 2F
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"128"
	thing[@ DEThingDef.Sprite ] =		"BRPL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tall brown pillar"
                                                         
	thing = [];                                 
	DEActor				[87] = thing;
	//41 BBC 57
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"VLCO"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Volcano"

	// ******** DECORATIONS *********
	thing = [];                                                
	DEActor				[28] = thing;
	//41 BBC                 1C
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"60"    
	thing[@ DEThingDef.Sprite ] =		"CHDL"    
	thing[@ DEThingDef.Sequence ] =	"ABC"    
	thing[@ DEThingDef.Class ] =		"^"    
	thing[@ DEThingDef.Description ] = "Chandelier"     
                                                                   
	thing = [];                                                
	DEActor				[17] = thing;
	//41 BBC                 11
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"70"    
	thing[@ DEThingDef.Sprite ] =		"SKH1"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"^"    
	thing[@ DEThingDef.Description ] = "Hanging skull (long rope)"     
                                                                   
	thing = [];                                                
	DEActor				[24] = thing;
	//41 BBC                 18
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"60"    
	thing[@ DEThingDef.Sprite ] =		"SKH2"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"^"    
	thing[@ DEThingDef.Description ] = "Hanging skull (medium rope)"     
                                                                   
	thing = [];                                                
	DEActor				[25] = thing;
	//41 BBC                 19
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"45"    
	thing[@ DEThingDef.Sprite ] =		"SKH3"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"^"    
	thing[@ DEThingDef.Description ] = "Hanging skull (short rope)"
                                                                   
	thing = [];                                           
	DEActor				[26] = thing;
	//41 BBC 1A
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"35"
	thing[@ DEThingDef.Sprite ] =		"SKH4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Hanging skull (shortest rope)"
                                                                   
	thing = [];                                           
	DEActor				[49] = thing;
	//41 BBC 31
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"27"
	thing[@ DEThingDef.Sprite ] =		"MOS2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Moss 1 string"
                                                                   
	thing = [];                                           
	DEActor				[48] = thing;
	//41 BBC 30
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"23"
	thing[@ DEThingDef.Sprite ] =		"MOS1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Moss 2 strings"
                                                                   
	thing = [];                                           
	DEActor				[50] = thing;
	//41 BBC 32
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WTRH"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Wall torch"

	// ******** AMBIENT SOUNDS *********
	thing = [];                             
	DEActor				[1205] = thing;
	//41 BBC                 4B5
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"none"    
	thing[@ DEThingDef.Sequence ] =	"-"    
	thing[@ DEThingDef.Class ] =		"S"    
	thing[@ DEThingDef.Description ] = "Bells"     
                                                
	thing = [];                             
	DEActor				[1202] = thing;
	//41 BBC                 4B2
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"none"    
	thing[@ DEThingDef.Sequence ] =	"-"    
	thing[@ DEThingDef.Class ] =		"S"    
	thing[@ DEThingDef.Description ] = "Drops"     
                                                
	thing = [];                             
	DEActor				[1209] = thing;
	//41 BBC                 4B9
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"none"    
	thing[@ DEThingDef.Sequence ] =	"-"    
	thing[@ DEThingDef.Class ] =		"S"    
	thing[@ DEThingDef.Description ] = "Fast footsteps"     
                                                
	thing = [];                             
	DEActor				[1206] = thing;
	//41 BBC                 4B6
	thing[@ DEThingDef.Version ] =		"R"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"none"    
	thing[@ DEThingDef.Sequence ] =	"-"    
	thing[@ DEThingDef.Class ] =		"S"    
	thing[@ DEThingDef.Description ] = "Growl"
                                                
	thing = [];                        
	DEActor				[1204] = thing;
	//41 BBC 4B4                                    
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Heart beat"
                                                
	thing = [];                        
	DEActor				[1208] = thing;
	//41 BBC 4B8
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Laughter"
                                                
	thing = [];                        
	DEActor				[1207] = thing;
	//41 BBC 4B7
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Magic"
                                                
	thing = [];                        
	DEActor				[1200] = thing;
	//41 BBC 4B0
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Scream"
                                                
	thing = [];                        
	DEActor				[1203] = thing;
	//41 BBC 4B3
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Slow footsteps"
                                                
	thing = [];                        
	DEActor				[1201] = thing;
	//41 BBC 4B1
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Squish"
                                                
	thing = [];                        
	DEActor				[41] = thing;
	//41 BBC 29
	thing[@ DEThingDef.Version ] =		"R"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Waterfall"
                                                
	thing = [];                        
	DEActor				[42] = thing;
	//41 BBC 2A
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Wind"

	// ******** OTHER *********
	thing = [];                                                
	DEActor				[56] = thing;
	//41 BBC                 38
	thing[@ DEThingDef.Version ] =		"R"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"none1"    
	thing[@ DEThingDef.Sequence ] =	"-"    
	thing[@ DEThingDef.Class ] =		""    
	thing[@ DEThingDef.Description ] = "D'Sparil teleport spot"     
                                                                   
	thing = [];                                                
	DEActor				[11] = thing;
	//41 BBC                 B
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"none"    
	thing[@ DEThingDef.Sequence ] =	"-"    
	thing[@ DEThingDef.Class ] =		""    
	thing[@ DEThingDef.Description ] = "Deathmatch start"     
                                                                   
	thing = [];                                                
	DEActor				[94] = thing;
	//41 BBC                 5E
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"16"    
	thing[@ DEThingDef.Height ] =		"50"    
	thing[@ DEThingDef.Sprite ] =		"KGZ12"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"O"    
	thing[@ DEThingDef.Description ] = "Key gizmo (blue)"     
                                                                   
	thing = [];                                                
	DEActor				[95] = thing;
	//41 BBC                 5F                                             
	thing[@ DEThingDef.Version ] =		"S"    
	thing[@ DEThingDef.Radius ] =		"16"    
	thing[@ DEThingDef.Height ] =		"50"    
	thing[@ DEThingDef.Sprite ] =		"KGZ12"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"O"    
	thing[@ DEThingDef.Description ] = "Key gizmo (green)"
                                                                   
	thing = [];                                           
	DEActor				[96] = thing;
	//41 BBC 60                                                        
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"50"
	thing[@ DEThingDef.Sprite ] =		"KGZ12"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Key gizmo (yellow)"
                                                                   
	thing = [];                                           
	DEActor				[1] = thing;
	//41 BBC 1                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"56"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 1 start"
                                                                   
	thing = [];                                           
	DEActor				[2] = thing;
	//41 BBC 2                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"56"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 2 start"
                                                                   
	thing = [];                                           
	DEActor				[3] = thing;
	//41 BBC 3                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"56"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 3 start"
                                                                   
	thing = [];                                           
	DEActor				[4] = thing;
	//41 BBC 4                                                         
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"56"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 4 start"
                                                                   
	thing = [];                                           
	DEActor				[2035] = thing;
	//41 BBC 7F3                                                       
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"54"
	thing[@ DEThingDef.Sprite ] =		"PPOD"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Pod"
                                                                   
	thing = [];                                           
	DEActor				[43] = thing;
	//41 BBC 2B                                                        
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Pod generator"
                                                                   
	thing = [];                                           
	DEActor				[52] = thing;
	//41 BBC 34                                                        
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TGLT"
	thing[@ DEThingDef.Sequence ] =	"F+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Teleport glitter (blue)"
                                                                   
	thing = [];                                           
	DEActor				[74] = thing;
	//41 BBC 34 4A                                                     
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TGLT"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Teleport glitter (red)"
                                                                   
	thing = [];                                           
	DEActor				[14] = thing;
	//41 BBC 34 E                                                      
	thing[@ DEThingDef.Version ] =		"S"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none3"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Teleport landing"




}

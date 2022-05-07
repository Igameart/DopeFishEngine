function DE_levelMusicHexen(){
	var Lump = "";
	switch DEMap{
     case "MAP01": Lump = "WINNOWR";	break;
     case "MAP02": Lump = "JACHR";		break;
     case "MAP03": Lump = "SIMONR";		break;
     case "MAP04": Lump = "WUTZITR";	break;
     case "MAP05": Lump = "FALCONR";	break;
     case "MAP06": Lump = "LEVELR";		break;
     case "MAP07": Lump = "CHARTR";		break;
     case "MAP08": Lump = "SWAMPR";		break;
     case "MAP09": Lump = "DEEPR";		break;
     case "MAP10": Lump = "FUBASR";		break;
     case "MAP11": Lump = "GROVER";		break;
     case "MAP12": Lump = "FORTR";		break;
     case "MAP13": Lump = "CRYPTR";		break;
     case "MAP14": Lump = "SWAMPR";		break;
     case "MAP21": Lump = "FOOJAR";		break;
     case "MAP22": Lump = "SIXATER";	break;
     case "MAP23": Lump = "WOBABYR";	break;
     case "MAP24": Lump = "CRYPTR";		break;
     case "MAP25": Lump = "FANTAR";		break;
     case "MAP26": Lump = "BLECHR";		break;
     case "MAP27": Lump = "VOIDR";		break;
     case "MAP28": Lump = "CHAP_1R";	break;
     case "MAP29": Lump = "CHAP_2R";	break;
     case "MAP30": Lump = "CHAP_3R";	break;
     case "MAP31": Lump = "CHAP_4R";	break;
     case "MAP32": Lump = "CHIPPYR";	break;
     case "MAP33": Lump = "PERCR";		break;
     case "MAP34": Lump = "SECRETR";	break;
     case "MAP35": Lump = "BONESR";		break;
     case "MAP36": Lump = "OCTOR";		break;
     case "MAP37": Lump = "RITHMR";		break;
     case "MAP38": Lump = "STALKR";		break;
     case "MAP39": Lump = "BORKR";		break;
     case "MAP40": Lump = "CRUCIBR";	break;
	}
	//DEtrace("Found Music:",Lump);
	return string_upper(Lump);
}

function DE_thingTypesHexen() {
	var thing;

	// **** HEXEN **** //

	// ******** MONSTERS *********
	thing = [];                                           
	DEActor				[10060] = thing;
	//41 BBC                 274C
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"68"    
	thing[@ DEThingDef.Sprite ] =		"FDMN"    
	thing[@ DEThingDef.Sequence ] =	"XEFG+"    
	thing[@ DEThingDef.Class ] =		"MO*^"    
	thing[@ DEThingDef.Description ] = "Afrit"     
                                                              
	thing = [];                                           
	DEActor				[8080] = thing;
	//41 BBC                 1F90                                      
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"32"    
	thing[@ DEThingDef.Height ] =		"64"    
	thing[@ DEThingDef.Sprite ] =		"DEM2"    
	thing[@ DEThingDef.Sequence ] =	"AA+"    
	thing[@ DEThingDef.Class ] =		"MO*"    
	thing[@ DEThingDef.Description ] = "Brown chaos serpent"     
                                                              
	thing = [];                                           
	DEActor				[107] = thing;
	//41 BBC                 6B
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"64"    
	thing[@ DEThingDef.Sprite ] =		"CENT"    
	thing[@ DEThingDef.Sequence ] =	"AB+"    
	thing[@ DEThingDef.Class ] =		"MO*"    
	thing[@ DEThingDef.Description ] = "Centaur"     
                                                              
	thing = [];                                           
	DEActor				[114] = thing;
	//41 BBC                 72
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"22"    
	thing[@ DEThingDef.Height ] =		"65"    
	thing[@ DEThingDef.Sprite ] =		"BISH"    
	thing[@ DEThingDef.Sequence ] =	"A+"    
	thing[@ DEThingDef.Class ] =		"MO*^"    
	thing[@ DEThingDef.Description ] = "Dark bishop"
                                                              
	thing = [];                                      
	DEActor				[254] = thing;
	//41 BBC FE
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"65"
	thing[@ DEThingDef.Sprite ] =		"DRAG"
	thing[@ DEThingDef.Sequence ] =	"D+"
	thing[@ DEThingDef.Class ] =		"MO*^"
	thing[@ DEThingDef.Description ] = "Death wyvern"
                                                              
	thing = [];                                      
	DEActor				[10030] = thing;
	//41 BBC 272E
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"25"
	thing[@ DEThingDef.Height ] =		"68"
	thing[@ DEThingDef.Sprite ] =		"ETTN"
	thing[@ DEThingDef.Sequence ] =	"AA+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Ettin"
                                                              
	thing = [];                                      
	DEActor				[31] = thing;
	//41 BBC 1F
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"32"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"DEMN"
	thing[@ DEThingDef.Sequence ] =	"AA+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Green chaos serpent"
                                                              
	thing = [];                                      
	DEActor				[10080] = thing;
	//41 BBC 2760                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"40"
	thing[@ DEThingDef.Height ] =		"110"
	thing[@ DEThingDef.Sprite ] =		"SORC"
	thing[@ DEThingDef.Sequence ] =	"AAA+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Heresiarch"
                                                              
	thing = [];                                      
	DEActor				[10200] = thing;
	//41 BBC 27D8
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"65"
	thing[@ DEThingDef.Height ] =		"115"
	thing[@ DEThingDef.Sprite ] =		"KORX"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Korax"
                                                              
	thing = [];                                      
	DEActor				[10102] = thing;
	//41 BBC 2776
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"MAGE"
	thing[@ DEThingDef.Sequence ] =	"AAA+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Menelkir"
                                                              
	thing = [];                                      
	DEActor				[34] = thing;
	//41 BBC 22
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"55"
	thing[@ DEThingDef.Sprite ] =		"WRTH"
	thing[@ DEThingDef.Sequence ] =	"ABAB+"
	thing[@ DEThingDef.Class ] =		"MO*^"
	thing[@ DEThingDef.Description ] = "Reiver"
                                                              
	thing = [];                                      
	DEActor				[10011] = thing;
	//41 BBC 271B
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"68"
	thing[@ DEThingDef.Sprite ] =		"WRTH"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"M^"
	thing[@ DEThingDef.Description ] = "Reiver (Buried)"
                                                              
	thing = [];                                      
	DEActor				[115] = thing;
	//41 BBC 73
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"CENT"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Slaughtaur"
                                                              
	thing = [];                                      
	DEActor				[121] = thing;
	//41 BBC 79                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"32"
	thing[@ DEThingDef.Height ] =		"70"
	thing[@ DEThingDef.Sprite ] =		"SSPT"
	thing[@ DEThingDef.Sequence ] =	"H+"
	thing[@ DEThingDef.Class ] =		"MO"
	thing[@ DEThingDef.Description ] = "Stalker"
                                                              
	thing = [];                                      
	DEActor				[120] = thing;
	//41 BBC 78
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"32"
	thing[@ DEThingDef.Height ] =		"70"
	thing[@ DEThingDef.Sprite ] =		"SSPT"
	thing[@ DEThingDef.Sequence ] =	"H+"
	thing[@ DEThingDef.Class ] =		"MO"
	thing[@ DEThingDef.Description ] = "Stalker boss"
                                                              
	thing = [];                                      
	DEActor				[10101] = thing;
	//41 BBC 2775
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"CLER"
	thing[@ DEThingDef.Sequence ] =	"AAA+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Traductus"
                                                              
	thing = [];                                      
	DEActor				[8020] = thing;
	//41 BBC 1F54
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"75"
	thing[@ DEThingDef.Sprite ] =		"ICEY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Wendigo"
                                                              
	thing = [];                                      
	DEActor				[10100] = thing;
	//41 BBC 2774
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"AAA+"
	thing[@ DEThingDef.Class ] =		"MO*"
	thing[@ DEThingDef.Description ] = "Zedek"

	// ******** WEAPONS *********
	thing = [];                                         
	DEActor				[8040] = thing;
	//41 BBC                 1F68
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"WMLG"    
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"    
	thing[@ DEThingDef.Class ] =		"WP"    
	thing[@ DEThingDef.Description ] = "Arc of Death"     
                                                            
	thing = [];                                         
	DEActor				[21] = thing;
	//41 BBC                 15
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"WMS1"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"WP"    
	thing[@ DEThingDef.Description ] = "Bloodscourge (Skull)"     
                                                            
	thing = [];                                         
	DEActor				[23] = thing;
	//41 BBC                 17
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"WMS3"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"WP"    
	thing[@ DEThingDef.Description ] = "Bloodscourge (Stick)"     
                                                            
	thing = [];                                         
	DEActor				[22] = thing;
	//41 BBC                 16
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"WMS2"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"WP"    
	thing[@ DEThingDef.Description ] = "Bloodscourge (Stub)"
                                                            
	thing = [];                                    
	DEActor				[8009] = thing;
	//41 BBC 1F49
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WCFM"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Firestorm"
                                                            
	thing = [];                                    
	DEActor				[53] = thing;
	//41 BBC 35
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WMCS"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Frost Shards"
                                                            
	thing = [];                                    
	DEActor				[123] = thing;
	//41 BBC 7B
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WFHM"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Hammer of Retribution"
                                                            
	thing = [];                                    
	DEActor				[12] = thing;
	//41 BBC C                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WFR1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Quietus (Blade)"
                                                            
	thing = [];                                    
	DEActor				[13] = thing;
	//41 BBC D
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WFR2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Quietus (Cross)"
                                                            
	thing = [];                                    
	DEActor				[16] = thing;
	//41 BBC 10
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WFR3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Quietus (Hilt)"
                                                            
	thing = [];                                    
	DEActor				[10] = thing;
	//41 BBC A
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WCSS"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Serpent Staff"
                                                            
	thing = [];                                    
	DEActor				[8010] = thing;
	//41 BBC 1F4A
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WFAX"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Timon's Axe"
                                                            
	thing = [];                                    
	DEActor				[18] = thing;
	//41 BBC 12
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WCH1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Wraithverge (Arc)"
                                                            
	thing = [];                                    
	DEActor				[19] = thing;
	//41 BBC 13
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WCH2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Wraithverge (Cross)"
                                                            
	thing = [];                                    
	DEActor				[20] = thing;
	//41 BBC 14
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WCH3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"WP"
	thing[@ DEThingDef.Description ] = "Wraithverge (Shaft)"

	// ******** PICKUPS *********
	thing = [];                        
	DEActor				[122] = thing;
	//41 BBC                 7A
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"8"    
	thing[@ DEThingDef.Height ] =		"8"    
	thing[@ DEThingDef.Sprite ] =		"MAN1"    
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHI"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Blue mana"     
                                           
	thing = [];                        
	DEActor				[8004] = thing;
	//41 BBC                 1F44
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"8"    
	thing[@ DEThingDef.Height ] =		"8"    
	thing[@ DEThingDef.Sprite ] =		"MAN3"    
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJKLMNOP"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Combined mana"     
                                           
	thing = [];                        
	DEActor				[124] = thing;
	//41 BBC                 7C
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"8"    
	thing[@ DEThingDef.Height ] =		"8"    
	thing[@ DEThingDef.Sprite ] =		"MAN2"    
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJKLMNOP"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Green mana"     

	thing = [];
	DEActor				[10040] = thing;
	//41 BBC                 2738
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"TELO"    
	thing[@ DEThingDef.Sequence ] =	"ABCD"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Banishment Device"     
                                                                   
	thing = [];                                                
	DEActor				[8002] = thing;
	//41 BBC                 1F42
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"SPED"    
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Boots of Speed"     
                                                                   
	thing = [];                                                
	DEActor				[36] = thing;
	//41 BBC                 24
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"ATLP"    
	thing[@ DEThingDef.Sequence ] =	"ABCB"
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Chaos Device"     
                                                                   
	thing = [];                                                
	DEActor				[86] = thing;
	//41 BBC                 56
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"SUMN"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"P"    
	thing[@ DEThingDef.Description ] = "Dark Servant"
                                                                   
	thing = [];                                           
	DEActor				[10110] = thing;
	//41 BBC 277E
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BLST"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Disc of Repulsion"
                                                                   
	thing = [];
	DEActor				[8041] = thing;
	//41 BBC 1F69
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BRAC"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Dragonskin Bracers"
                                                                   
	thing = [];                                           
	DEActor				[8000] = thing;
	//41 BBC 1F40
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PSBG"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Fléchette"
                                                                   
	thing = [];                                           
	DEActor				[84] = thing;
	//41 BBC 54
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"INVU"
	thing[@ DEThingDef.Sequence ] =	"ABCD"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Icon of the Defender"
                                                                   
	thing = [];                                           
	DEActor				[8003] = thing;
	//41 BBC 1F43
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BMAN"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Krater of Might"
                                                                   
	thing = [];                                           
	DEActor				[10120] = thing;
	//41 BBC 2788                                                      
	thing[@ DEThingDef.Version ] =		"D2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"HRAD"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJKLMNOP"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Mystic Ambit Incant"
                                                                   
	thing = [];                                           
	DEActor				[32] = thing;
	//41 BBC 20
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SPHL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Mystic Urn"
                                                                   
	thing = [];                                           
	DEActor				[30] = thing;
	//41 BBC 1E
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PORK"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Porkalator"
                                                                   
	thing = [];                                           
	DEActor				[82] = thing;
	//41 BBC 52
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"PTN2"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Quartz Flask"
                                                                   
	thing = [];                                           
	DEActor				[33] = thing;
	//41 BBC 21
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TRCH"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Torch"
                                                                   
	thing = [];                                           
	DEActor				[83] = thing;
	//41 BBC 53
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"SOAR"
	thing[@ DEThingDef.Sequence ] =	"ABCB"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Wings of Wrath"

	thing = [];                                                            
	DEActor				[8008] = thing;
	//41 BBC                 1F48                                                       
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"ARM4"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"P1"    
	thing[@ DEThingDef.Description ] = "Amulet of Warding"     
                                                                               
	thing = [];                                                            
	DEActor				[81] = thing;
	//41 BBC                 51                                                         
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"PTN1"    
	thing[@ DEThingDef.Sequence ] =	"ABC"    
	thing[@ DEThingDef.Class ] =		"P2"    
	thing[@ DEThingDef.Description ] = "Crystal Vial"     
                                                                               
	thing = [];                                                            
	DEActor				[8006] = thing;
	//41 BBC                 1F46                                                       
	thing[@ DEThingDef.Version ] =		"D"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"ARM2"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"P1"    
	thing[@ DEThingDef.Description ] = "Falcon Shield"     
                                                                               
	thing = [];                                                            
	DEActor				[8005] = thing;
	//41 BBC                 1F45                                                       
	thing[@ DEThingDef.Version ] =		"C"    
	thing[@ DEThingDef.Radius ] =		"20"    
	thing[@ DEThingDef.Height ] =		"16"    
	thing[@ DEThingDef.Sprite ] =		"ARM1"    
	thing[@ DEThingDef.Sequence ] =	"A"    
	thing[@ DEThingDef.Class ] =		"P1"    
	thing[@ DEThingDef.Description ] = "Mesh Armor"
                                                                               
	thing = [];                                                       
	DEActor				[8007] = thing;
	//41 BBC 1F47                                                                  
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ARM3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P1"
	thing[@ DEThingDef.Description ] = "Platinum Helm"
                                                                               
	thing = [];                                                       
	DEActor				[8032] = thing;
	//41 BBC 1F60                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Axe Key"
                                                                               
	thing = [];                                                       
	DEActor				[8200] = thing;
	//41 BBC 2008                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEYB"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Castle Key"
                                                                               
	thing = [];                                                       
	DEActor				[8031] = thing;
	//41 BBC 1F5F                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Cave Key"
                                                                               
	thing = [];                                                       
	DEActor				[9021] = thing;
	//41 BBC 233D                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGR4"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Clock Gear (Bronze in Steel)"
                                                                               
	thing = [];                                                       
	DEActor				[9019] = thing;
	//41 BBC 233B                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGR2"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Clock Gear (Bronze)"
                                                                               
	thing = [];                                                       
	DEActor				[9020] = thing;
	//41 BBC 233C                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGR3"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Clock Gear (Steel in Bronze)"
                                                                               
	thing = [];                                                       
	DEActor				[9018] = thing;
	//41 BBC 233A                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGER"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Clock Gear (Steel)"
                                                                               
	thing = [];                                                       
	DEActor				[9007] = thing;
	//41 BBC 232F                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ABK1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Daemon Codex"
                                                                               
	thing = [];                                                       
	DEActor				[8035] = thing;
	//41 BBC 1F63                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Dungeon Key"
                                                                               
	thing = [];                                                       
	DEActor				[8034] = thing;
	//41 BBC 1F62                                                                  
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Emerald Key"
                                                                               
	thing = [];                                                       
	DEActor				[9005] = thing;
	//41 BBC 232D                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGMG"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Emerald Planet 1"
                                                                               
	thing = [];                                                       
	DEActor				[9009] = thing;
	//41 BBC 2331                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGG2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Emerald Planet 2"
                                                                               
	thing = [];                                                       
	DEActor				[8033] = thing;
	//41 BBC 1F61                                                                  
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Fire Key"
                                                                               
	thing = [];                                                       
	DEActor				[9014] = thing;
	//41 BBC 2336                                                                  
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ASK2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Flame Mask"
                                                                               
	thing = [];                                                       
	DEActor				[9015] = thing;
	//41 BBC 2337                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AFWP"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Glaive Seal"
                                                                               
	thing = [];                                                       
	DEActor				[9003] = thing;
	//41 BBC 232B                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ABGM"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Heart of D'Sparil"
                                                                               
	thing = [];                                                       
	DEActor				[9016] = thing;
	//41 BBC 2338                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ACWP"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Holy Relic"
                                                                               
	thing = [];                                                       
	DEActor				[8038] = thing;
	//41 BBC 1F66                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY9"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Horn Key"
                                                                               
	thing = [];                                                       
	DEActor				[9008] = thing;
	//41 BBC 2330                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ABK2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Liber Oscura"
                                                                               
	thing = [];                                                       
	DEActor				[9004] = thing;
	//41 BBC 232C                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGMR"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Ruby Planet"
                                                                               
	thing = [];                                                       
	DEActor				[8037] = thing;
	//41 BBC 1F65                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY8"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Rusty Key"
                                                                               
	thing = [];                                                       
	DEActor				[9006] = thing;
	//41 BBC 232E                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGMB"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Sapphire Planet 1"
                                                                               
	thing = [];                                                       
	DEActor				[9010] = thing;
	//41 BBC 2332                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AGB2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Sapphire Planet 2"
                                                                               
	thing = [];                                                       
	DEActor				[9017] = thing;
	//41 BBC 2339                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"AMWP"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Sigil of the Magus"
                                                                               
	thing = [];                                                       
	DEActor				[8036] = thing;
	//41 BBC 1F64                                                                  
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY7"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Silver Key"
                                                                               
	thing = [];                                                       
	DEActor				[8030] = thing;
	//41 BBC 1F5E                                                                  
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEY1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Steel Key"
                                                                               
	thing = [];                                                       
	DEActor				[8039] = thing;
	//41 BBC 1F67                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"KEYA"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Swamp Key"
                                                                               
	thing = [];                                                       
	DEActor				[9002] = thing;
	//41 BBC 232A                                                                  
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"ASKU"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"P"
	thing[@ DEThingDef.Description ] = "Yorick's Skull"

	// ******** BOSTACLES *********
	thing = [];                                                      
	DEActor				[8100] = thing;
	//41 BBC                 1FA4                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"BARL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Barrel"
                                                                              
	thing = [];                                                      
	DEActor				[77] = thing;
	//41 BBC                 4D                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"120"
	thing[@ DEThingDef.Sprite ] =		"BNR1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Battle rag banner"
                                                                              
	thing = [];                                                      
	DEActor				[8065] = thing;
	//41 BBC                 1F81                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"56"
	thing[@ DEThingDef.Height ] =		"120"
	thing[@ DEThingDef.Sprite ] =		"BBLL"
	thing[@ DEThingDef.Sequence ] =	"F+"
	thing[@ DEThingDef.Class ] =		"O*^"
	thing[@ DEThingDef.Description ] = "Bell"
                                                                              
	thing = [];                                                      
	DEActor				[99] = thing;
	//41 BBC                 63                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"40"
	thing[@ DEThingDef.Sprite ] =		"RKBK"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Black rock"
                                                                              
	thing = [];                                                      
	DEActor				[8061] = thing;
	//41 BBC 1F7D                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"6"
	thing[@ DEThingDef.Height ] =		"35"
	thing[@ DEThingDef.Sprite ] =		"BRTR"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJKLM"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Brazier with flame"
                                                                              
	thing = [];                                                      
	DEActor				[8051] = thing;
	//41 BBC 1F73                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"GAR8"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Bronze gargoyle (short)"
                                                                              
	thing = [];                                                      
	DEActor				[8047] = thing;
	//41 BBC 1F6F                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"108"
	thing[@ DEThingDef.Sprite ] =		"GAR4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Bronze gargoyle (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[97] = thing;
	//41 BBC 61                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"17"
	thing[@ DEThingDef.Height ] =		"72"
	thing[@ DEThingDef.Sprite ] =		"RKBL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Brown rock (large)"
                                                                              
	thing = [];                                                      
	DEActor				[98] = thing;
	//41 BBC 62                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"50"
	thing[@ DEThingDef.Sprite ] =		"RKBS"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Brown rock (small)"
                                                                              
	thing = [];                                                      
	DEActor				[8069] = thing;
	//41 BBC 1F85                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"26"
	thing[@ DEThingDef.Sprite ] =		"CDRN"
	thing[@ DEThingDef.Sequence ] =	"BCDEFGH"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Cauldron (lit)"
                                                                              
	thing = [];                                                      
	DEActor				[8070] = thing;
	//41 BBC 1F86                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"26"
	thing[@ DEThingDef.Sprite ] =		"CDRN"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Cauldron (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[8049] = thing;
	//41 BBC 1F71                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"GAR6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Dark lava gargoyle (short)"
                                                                              
	thing = [];                                                      
	DEActor				[8045] = thing;
	//41 BBC 1F6D                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"108"
	thing[@ DEThingDef.Sprite ] =		"GAR2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Dark lava gargoyle (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[24] = thing;
	//41 BBC 18                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"96"
	thing[@ DEThingDef.Sprite ] =		"TRE1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Dead tree"
                                                                              
	thing = [];                                                      
	DEActor				[8062] = thing;
	//41 BBC 1F7E                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"180"
	thing[@ DEThingDef.Sprite ] =		"TRDT"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Destructible tree"
                                                                              
	thing = [];                                                      
	DEActor				[8068] = thing;
	//41 BBC                 1F84                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"11"
	thing[@ DEThingDef.Height ] =		"130"
	thing[@ DEThingDef.Sprite ] =		"XMAS"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Evergreen tree"
                                                                              
	thing = [];                                                      
	DEActor				[80] = thing;
	//41 BBC                 50                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"100"
	thing[@ DEThingDef.Sprite ] =		"TRE6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Gnarled tree 1"
                                                                              
	thing = [];                                                      
	DEActor				[87] = thing;
	//41 BBC                 57                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"22"
	thing[@ DEThingDef.Height ] =		"100"
	thing[@ DEThingDef.Sprite ] =		"TRE7"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Gnarled tree 2"
                                                                              
	thing = [];                                                      
	DEActor				[8103] = thing;
	//41 BBC                 1FA7                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"72"
	thing[@ DEThingDef.Sprite ] =		"BCKT"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Hanging bucket"
                                                                              
	thing = [];                                                      
	DEActor				[71] = thing;
	//41 BBC 47                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"6"
	thing[@ DEThingDef.Height ] =		"75"
	thing[@ DEThingDef.Sprite ] =		"CPS3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Hanging corpse"
                                                                              
	thing = [];                                                      
	DEActor				[76] = thing;
	//41 BBC 4C                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"STT5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Ice gargoyle (short)"
                                                                              
	thing = [];                                                      
	DEActor				[73] = thing;
	//41 BBC 49                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"108"
	thing[@ DEThingDef.Sprite ] =		"STT3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Ice gargoyle (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[93] = thing;
	//41 BBC 5D                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"66"
	thing[@ DEThingDef.Sprite ] =		"ICM1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Ice spike (large)"
                                                                              
	thing = [];                                                      
	DEActor				[94] = thing;
	//41 BBC 5E                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"5"
	thing[@ DEThingDef.Height ] =		"50"
	thing[@ DEThingDef.Sprite ] =		"ICM2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Ice spike (medium)"
                                                                              
	thing = [];                                                      
	DEActor				[95] = thing;
	//41 BBC 5F                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"ICM3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Ice spike (small)"
                                                                              
	thing = [];                                                      
	DEActor				[96] = thing;
	//41 BBC 60                                                                   
	thing[@ DEThingDef.Version ] =		"D1"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"8"
	thing[@ DEThingDef.Sprite ] =		"ICM4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Ice spike (tiny)"
                                                                              
	thing = [];                                                      
	DEActor				[89] = thing;
	//41 BBC 59                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"66"
	thing[@ DEThingDef.Sprite ] =		"ICT1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Icicle (large)"
                                                                              
	thing = [];                                                      
	DEActor				[90] = thing;
	//41 BBC 5A                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"5"
	thing[@ DEThingDef.Height ] =		"50"
	thing[@ DEThingDef.Sprite ] =		"ICT2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Icicle (medium)"
                                                                              
	thing = [];                                                      
	DEActor				[91] = thing;
	//41 BBC 5B                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"ICT3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Icicle (small)"
                                                                              
	thing = [];                                                      
	DEActor				[92] = thing;
	//41 BBC 5C                                                                   
	thing[@ DEThingDef.Version ] =		"D1"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"8"
	thing[@ DEThingDef.Sprite ] =		"ICT4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Icicle (tiny)"
                                                                              
	thing = [];                                                      
	DEActor				[61] = thing;
	//41 BBC                 3D                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"92"
	thing[@ DEThingDef.Sprite ] =		"CPS1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Impaled corpse"
                                                                              
	thing = [];                                                      
	DEActor				[8067] = thing;
	//41 BBC                 1F83                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"60"
	thing[@ DEThingDef.Sprite ] =		"IRON"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Iron maiden"
                                                                              
	thing = [];                                                      
	DEActor				[25] = thing;
	//41 BBC                 19                                                   
	thing[@ DEThingDef.Version ] =		"D1"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"128"
	thing[@ DEThingDef.Sprite ] =		"TRE1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Leafless tree"
      
	thing = [];                                                      
	DEActor				[8050] = thing;
	//41 BBC                 1F72                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"GAR7"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Light lava gargoyle (short)"
                                                                              
	thing = [];                                                      
	DEActor				[8046] = thing;
	//41 BBC 1F6E                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"108"
	thing[@ DEThingDef.Sprite ] =		"GAR3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Light lava gargoyle (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[108] = thing;
	//41 BBC 6C                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"11"
	thing[@ DEThingDef.Height ] =		"95"
	thing[@ DEThingDef.Sprite ] =		"CPS4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Lynched corpse"
                                                                              
	thing = [];                                                      
	DEActor				[109] = thing;
	//41 BBC 6D                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"100"
	thing[@ DEThingDef.Sprite ] =		"CPS5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Lynched corpse (heartless)"
                                                                              
	thing = [];                                                      
	DEActor				[8042] = thing;
	//41 BBC 1F6A                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"80"
	thing[@ DEThingDef.Sprite ] =		"FBUL"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFG"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Minotaur statue (lit)"
                                                                              
	thing = [];                                                      
	DEActor				[8043] = thing;
	//41 BBC 1F6B                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"80"
	thing[@ DEThingDef.Sprite ] =		"FBUL"
	thing[@ DEThingDef.Sequence ] =	"H"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Minotaur statue (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[60] = thing;
	//41 BBC 3C                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"52"
	thing[@ DEThingDef.Sprite ] =		"SWMV"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Mossy dead tree"
                                                                              
	thing = [];                                                      
	DEActor				[15] = thing;
	//41 BBC F                                                                    
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"RCK4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Mossy rock (large)"
                                                                              
	thing = [];                                                      
	DEActor				[26] = thing;
	//41 BBC 1A                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"150"
	thing[@ DEThingDef.Sprite ] =		"TRE2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Mossy tree 1"
                                                                              
	thing = [];                                                      
	DEActor				[27] = thing;
	//41 BBC 1B                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"120"
	thing[@ DEThingDef.Sprite ] =		"TRE3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Mossy tree 2"
                                                                              
	thing = [];                                                      
	DEActor				[9012] = thing;
	//41 BBC 2334                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"40"
	thing[@ DEThingDef.Sprite ] =		"GMPD"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Pedestal of D'Sparil"
                                                                              
	thing = [];                                                      
	DEActor				[103] = thing;
	//41 BBC 67                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"54"
	thing[@ DEThingDef.Sprite ] =		"VASE"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Pillar with vase"
                                                                              
	thing = [];                                                      
	DEActor				[105] = thing;
	//41 BBC                 69                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"25"
	thing[@ DEThingDef.Sprite ] =		"POT2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Pot (medium)"
                                                                              
	thing = [];                                                      
	DEActor				[106] = thing;
	//41 BBC                 6A                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"25"
	thing[@ DEThingDef.Sprite ] =		"POT3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Pot (short)"
                                                                              
	thing = [];                                                      
	DEActor				[104] = thing;
	//41 BBC                 68                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"POT1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Pot (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[8044] = thing;
	//41 BBC                 1F6C                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"108"
	thing[@ DEThingDef.Sprite ] =		"GAR1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Rusty gargoyle (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[8102] = thing;
	//41 BBC 1FA6                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"40"
	thing[@ DEThingDef.Sprite ] =		"SHB2"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Shrub (large)"
                                                                              
	thing = [];                                                      
	DEActor				[8101] = thing;
	//41 BBC 1FA5                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"24"
	thing[@ DEThingDef.Sprite ] =		"SHB1"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Shrub (small)"
                                                                              
	thing = [];                                                      
	DEActor				[110] = thing;
	//41 BBC 6E                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"35"
	thing[@ DEThingDef.Sprite ] =		"CPS6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Sitting corpse"
                                                                              
	thing = [];                                                      
	DEActor				[8060] = thing;
	//41 BBC 1F7C                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"5"
	thing[@ DEThingDef.Height ] =		"10"
	thing[@ DEThingDef.Sprite ] =		"FSKL"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHI"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Skull with flame"
                                                                              
	thing = [];                                                      
	DEActor				[52] = thing;
	//41 BBC 34                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"66"
	thing[@ DEThingDef.Sprite ] =		"SLC1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Stalactite (large)"
                                                                              
	thing = [];                                                      
	DEActor				[56] = thing;
	//41 BBC 38                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"6"
	thing[@ DEThingDef.Height ] =		"50"
	thing[@ DEThingDef.Sprite ] =		"SLC2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Stalactite (medium)"
                                                                              
	thing = [];                                                      
	DEActor				[57] = thing;
	//41 BBC 39                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"40"
	thing[@ DEThingDef.Sprite ] =		"SLC3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O^"
	thing[@ DEThingDef.Description ] = "Stalactite (small)"
                                                                              
	thing = [];                                                      
	DEActor				[49] = thing;
	//41 BBC 31                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"48"
	thing[@ DEThingDef.Sprite ] =		"SGM1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Stalagmite (large)"
                                                                              
	thing = [];                                                      
	DEActor				[50] = thing;
	//41 BBC 32                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"6"
	thing[@ DEThingDef.Height ] =		"40"
	thing[@ DEThingDef.Sprite ] =		"SGM2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Stalagmite (medium)"
                                                                              
	thing = [];                                                      
	DEActor				[51] = thing;
	//41 BBC 33                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"36"
	thing[@ DEThingDef.Sprite ] =		"SGM3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Stalagmite (small)"
                                                                              
	thing = [];                                                      
	DEActor				[48] = thing;
	//41 BBC 30                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"138"
	thing[@ DEThingDef.Sprite ] =		"SGMP"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Stalagmite pillar"
                                                                              
	thing = [];                                                      
	DEActor				[8052] = thing;
	//41 BBC                 1F74                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"GAR9"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Steel gargoyle (short)"
                                                                              
	thing = [];                                                      
	DEActor				[8048] = thing;
	//41 BBC                 1F70                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"108"
	thing[@ DEThingDef.Sprite ] =		"GAR5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Steel gargoyle (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[74] = thing;
	//41 BBC                 4A                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"STT4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Stone gargoyle (short)"
                                                                              
	thing = [];                                                      
	DEActor				[72] = thing;
	//41 BBC                 48                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"14"
	thing[@ DEThingDef.Height ] =		"108"
	thing[@ DEThingDef.Sprite ] =		"STT2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Stone gargoyle (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[8064] = thing;
	//41 BBC 1F80                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"72"
	thing[@ DEThingDef.Sprite ] =		"SUIT"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Suit of armor"
                                                                              
	thing = [];                                                      
	DEActor				[78] = thing;
	//41 BBC 4E                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"180"
	thing[@ DEThingDef.Sprite ] =		"TRE4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tall tree 1"

	thing = [];                                                      
	DEActor				[79] = thing;
	//41 BBC 4F                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"15"
	thing[@ DEThingDef.Height ] =		"180"
	thing[@ DEThingDef.Sprite ] =		"TRE5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tall tree 2"
                                                                              
	thing = [];                                                      
	DEActor				[69] = thing;
	//41 BBC 45                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"46"
	thing[@ DEThingDef.Sprite ] =		"TMS7"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tombstone (Brian P)"
                                                                              
	thing = [];                                                      
	DEActor				[66] = thing;
	//41 BBC 42                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"52"
	thing[@ DEThingDef.Sprite ] =		"TMS4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tombstone (Brian R)"
                                                                              
	thing = [];                                                      
	DEActor				[63] = thing;
	//41 BBC 3F                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"46"
	thing[@ DEThingDef.Sprite ] =		"TMS1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tombstone (RIP)"
                                                                              
	thing = [];                                                      
	DEActor				[64] = thing;
	//41 BBC 40                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"46"
	thing[@ DEThingDef.Sprite ] =		"TMS2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tombstone (Shane)"
                                                                              
	thing = [];                                                      
	DEActor				[67] = thing;
	//41 BBC 43                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"52"
	thing[@ DEThingDef.Sprite ] =		"TMS5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tombstone (cross circle)"
                                                                              
	thing = [];                                                      
	DEActor				[65] = thing;
	//41 BBC 41                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"46"
	thing[@ DEThingDef.Sprite ] =		"TMS3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tombstone (slimy)"
                                                                              
	thing = [];                                                      
	DEActor				[68] = thing;
	//41 BBC 44                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"8"
	thing[@ DEThingDef.Height ] =		"46"
	thing[@ DEThingDef.Sprite ] =		"TMS6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tombstone (small cross)"
                                                                              
	thing = [];                                                      
	DEActor				[88] = thing;
	//41 BBC 58                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"25"
	thing[@ DEThingDef.Sprite ] =		"LOGG"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tree log"
                                                                              
	thing = [];                                                      
	DEActor				[29] = thing;
	//41 BBC                 1D                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"STM2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tree stump (bare)"
                                                                              
	thing = [];                                                      
	DEActor				[28] = thing;
	//41 BBC                 1C                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"12"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"STM1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Tree stump (burned)"
                                                                              
	thing = [];                                                      
	DEActor				[116] = thing;
	//41 BBC                 74                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"TWTR"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Twined torch (lit)"
                                                                              
	thing = [];                                                      
	DEActor				[117] = thing;
	//41 BBC                 75                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"TWTR"
	thing[@ DEThingDef.Sequence ] =	"I"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Twined torch (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[5] = thing;
	//41 BBC 5                                                                    
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"STTW"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Winged statue"
                                                                              
	thing = [];                                                      
	DEActor				[9011] = thing;
	//41 BBC 2333                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"10"
	thing[@ DEThingDef.Height ] =		"62"
	thing[@ DEThingDef.Sprite ] =		"STWN"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Yorick's statue"

	// ******** DECORATIONS *********
	thing = [];                                                                
	DEActor				[119] = thing;
	//41 BBC                 77                                                             
	thing[@ DEThingDef.Version ] =		"C"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"CNDL"         
	thing[@ DEThingDef.Sequence ] =	"ABC"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "3 Candles (lit)"         
                                                                                        
	thing = [];                                                                
	DEActor				[8066] = thing;
	//41 BBC                 1F82                                                           
	thing[@ DEThingDef.Version ] =		"C"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"CAND"         
	thing[@ DEThingDef.Sequence ] =	"ABCDE"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "Blue candle (lit)"         
                                                                                        
	thing = [];                                                                
	DEActor				[100] = thing;
	//41 BBC                 64                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"RBL1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Brick rubble (large)"
                                                                              
	thing = [];                                                      
	DEActor				[102] = thing;
	//41 BBC                 66                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"RBL3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Brick rubble (medium)"
                                                                              
	thing = [];                                                      
	DEActor				[101] = thing;
	//41 BBC                 65                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"RBL2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Brick rubble (small)"
                                                                              
	thing = [];                                                      
	DEActor				[8504] = thing;
	//41 BBC                 2138                                                 
	thing[@ DEThingDef.Version ] =		"C1"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Candle w/o web (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[8502] = thing;
	//41 BBC                 2136                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Candle with web (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[8072] = thing;
	//41 BBC                 1F88                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"CHNS"
	thing[@ DEThingDef.Sequence ] =	"B"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Chain (long)"
                                                                              
	thing = [];                                                      
	DEActor				[8071] = thing;
	//41 BBC                 1F87                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"CHNS"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Chain (short)"
                                                                              
	thing = [];                                                      
	DEActor				[8074] = thing;
	//41 BBC                 1F8A                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"CHNS"
	thing[@ DEThingDef.Sequence ] =	"D"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Chain with large hook"
                         
	thing = [];                                                                
	DEActor				[8075] = thing;
	//41 BBC 1F8B                                                                           
	thing[@ DEThingDef.Version ] =		"C"         
	thing[@ DEThingDef.Radius ] =		"4"         
	thing[@ DEThingDef.Height ] =		"32"         
	thing[@ DEThingDef.Sprite ] =		"CHNS"         
	thing[@ DEThingDef.Sequence ] =	"E"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ] = "Chain with small hook"         
                                                                                        
	thing = [];                                                                
	DEActor				[8076] = thing;
	//41 BBC 1F8C                                                                           
	thing[@ DEThingDef.Version ] =		"C"         
	thing[@ DEThingDef.Radius ] =		"4"         
	thing[@ DEThingDef.Height ] =		"32"         
	thing[@ DEThingDef.Sprite ] =		"CHNS"         
	thing[@ DEThingDef.Sequence ] =	"F"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ] = "Chain with spike ball"         
                                                                                        
	thing = [];                                                                
	DEActor				[17] = thing;
	//41 BBC 11                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"60"
	thing[@ DEThingDef.Sprite ] =		"CDLR"
	thing[@ DEThingDef.Sequence ] =	"ABC"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Chandelier (lit)"
                                                                              
	thing = [];                                                      
	DEActor				[8063] = thing;
	//41 BBC 1F7F                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"60"
	thing[@ DEThingDef.Sprite ] =		"CDLR"
	thing[@ DEThingDef.Sequence ] =	"D"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Chandelier (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[8507] = thing;
	//41 BBC 213B                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST8"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Goblet (short)"
                                                                              
	thing = [];                                                      
	DEActor				[8508] = thing;
	//41 BBC 213C                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST9"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Goblet (silver)"
                                                                              
	thing = [];                                                      
	DEActor				[8505] = thing;
	//41 BBC 2139                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Goblet (spilled)"
                                                                              
	thing = [];                                                      
	DEActor				[8506] = thing;
	//41 BBC 213A                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST7"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Goblet (tall)"
                                                                              
	thing = [];                                                      
	DEActor				[8503] = thing;
	//41 BBC 2137                                                                 
	thing[@ DEThingDef.Version ] =		"C1"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Gray candle (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[58] = thing;
	//41 BBC                 3A                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"MSS1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Hanging moss 1"
                         
	thing = [];                                                                
	DEActor				[59] = thing;
	//41 BBC                 3B                                                             
	thing[@ DEThingDef.Version ] =		"D"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"24"         
	thing[@ DEThingDef.Sprite ] =		"MSS2"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ] = "Hanging moss 2"         
                                                                                        
	thing = [];                                                                
	DEActor				[8073] = thing;
	//41 BBC                 1F89                                                           
	thing[@ DEThingDef.Version ] =		"C"         
	thing[@ DEThingDef.Radius ] =		"4"         
	thing[@ DEThingDef.Height ] =		"32"         
	thing[@ DEThingDef.Sprite ] =		"CHNS"         
	thing[@ DEThingDef.Sequence ] =	"C"         
	thing[@ DEThingDef.Class ] =		"^"         
	thing[@ DEThingDef.Description ] = "Hook with heart"         
                                                                                        
	thing = [];                                                                
	DEActor				[8077] = thing;
	//41 BBC                 1F8D                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"4"
	thing[@ DEThingDef.Height ] =		"32"
	thing[@ DEThingDef.Sprite ] =		"CHNS"
	thing[@ DEThingDef.Sequence ] =	"G"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Hook with skull"
                                                                              
	thing = [];                                                      
	DEActor				[10503] = thing;
	//41 BBC                 2907                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FFLG"
	thing[@ DEThingDef.Sequence ] =	"AAABCDEFGHIJKLMNOP"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Large flame"
                                                                              
	thing = [];                                                      
	DEActor				[10502] = thing;
	//41 BBC                 2906                                                 
	thing[@ DEThingDef.Version ] =		"D1"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FFLG"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJKLMNOP"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Large flame (timed)"
                                                                              
	thing = [];                                                      
	DEActor				[39] = thing;
	//41 BBC                 27                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MSH1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Large mushroom 1"
                                                                              
	thing = [];                                                      
	DEActor				[40] = thing;
	//41 BBC                 28                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MSH2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Large mushroom 2"
                                                                              
	thing = [];                                                      
	DEActor				[8509] = thing;
	//41 BBC                 213D                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST0"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Meat cleaver"
                                                                              
	thing = [];                                                      
	DEActor				[41] = thing;
	//41 BBC                 29                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MSH3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Medium mushroom"
                                                                              
	thing = [];                                                      
	DEActor				[8501] = thing;
	//41 BBC 2135                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Metal beer stein"

	thing = [];                                                                
	DEActor				[9] = thing;
	//41 BBC 9                                                                              
	thing[@ DEThingDef.Version ] =		"D"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"RCK3"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "Mossy rock (medium)"         
                                                                                        
	thing = [];                                                                
	DEActor				[7] = thing;
	//41 BBC 7                                                                              
	thing[@ DEThingDef.Version ] =		"D"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"RCK2"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "Mossy rock (small)"         
                                                                                        
	thing = [];                                                                
	DEActor				[6] = thing;
	//41 BBC 6                                                                    
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"RCK1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Mossy rock (tiny)"
                                                                              
	thing = [];                                                      
	DEActor				[111] = thing;
	//41 BBC 6F                                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"BDPL"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Pool of blood"
                                                                              
	thing = [];                                                      
	DEActor				[62] = thing;
	//41 BBC 3E                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"CPS2"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Sleeping corpse"
                                                                              
	thing = [];                                                      
	DEActor				[10501] = thing;
	//41 BBC 2905                                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FFSM"
	thing[@ DEThingDef.Sequence ] =	"AAABCDE"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Small flame"
                                                                              
	thing = [];                                                      
	DEActor				[10500] = thing;
	//41 BBC 2904                                                                 
	thing[@ DEThingDef.Version ] =		"D1"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FFSM"
	thing[@ DEThingDef.Sequence ] =	"ABCCDE"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Small flame (timed)"
                                                                              
	thing = [];                                                      
	DEActor				[42] = thing;
	//41 BBC 2A                                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MSH4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Small mushroom 1"
                                                                              
	thing = [];                                                      
	DEActor				[44] = thing;
	//41 BBC                 2C                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MSH5"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Small mushroom 2"
                                                                              
	thing = [];                                                      
	DEActor				[45] = thing;
	//41 BBC                 2D                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"MSH6"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Small mushroom 3"
                         
	thing = [];                                                                
	DEActor				[46] = thing;
	//41 BBC                 2E                                                             
	thing[@ DEThingDef.Version ] =		"C"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"MSH7"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "Small mushroom 4"         
                                                                                        
	thing = [];                                                                
	DEActor				[47] = thing;
	//41 BBC                 2F                                                             
	thing[@ DEThingDef.Version ] =		"X"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"MSH8"         
	thing[@ DEThingDef.Sequence ] =	"A"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "Small mushroom 5"         
                                                                                        
	thing = [];                                                                
	DEActor				[37] = thing;
	//41 BBC                 25                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"STM3"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Tree stump 1"
                                                                              
	thing = [];                                                      
	DEActor				[38] = thing;
	//41 BBC                 26                                                   
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"STM4"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Tree stump 2"
                                                                              
	thing = [];                                                      
	DEActor				[54] = thing;
	//41 BBC                 36                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WLTR"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGH"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Wall torch (lit)"
                                                                              
	thing = [];                                                      
	DEActor				[55] = thing;
	//41 BBC                 37                                                   
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"WLTR"
	thing[@ DEThingDef.Sequence ] =	"I"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Wall torch (unlit)"
                                                                              
	thing = [];                                                      
	DEActor				[8500] = thing;
	//41 BBC                 2134                                                 
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TST1"
	thing[@ DEThingDef.Sequence ] =	"A"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Wooden beer stein"

	// ******** AMBIENT SOUNDS *********
	thing = [];                                    
	DEActor				[1403] = thing;
	//41 BBC                 57B                                
	thing[@ DEThingDef.Version ] =		"D1"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"none"         
	thing[@ DEThingDef.Sequence ] =	"-"         
	thing[@ DEThingDef.Class ] =		"S"         
	thing[@ DEThingDef.Description ] = "Creak"         
                                                            
	thing = [];                                    
	DEActor				[1408] = thing;
	//41 BBC                 580                                
	thing[@ DEThingDef.Version ] =		"D1"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"none"         
	thing[@ DEThingDef.Sequence ] =	"-"         
	thing[@ DEThingDef.Class ] =		"S"         
	thing[@ DEThingDef.Description ] = "Earth"         
                                                            
	thing = [];                                    
	DEActor				[1401] = thing;
	//41 BBC 579                                      
	thing[@ DEThingDef.Version ] =		"D1"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Heavy"
                                                  
	thing = [];                          
	DEActor				[1407] = thing;
	//41 BBC 57F                                      
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Ice"
                                                  
	thing = [];                          
	DEActor				[1405] = thing;
	//41 BBC 57D                                      
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Lava"
                                                  
	thing = [];                          
	DEActor				[1402] = thing;
	//41 BBC 57A                                      
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Metal"
                                                  
	thing = [];                          
	DEActor				[1409] = thing;
	//41 BBC 581                                      
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Metal2"
                                                  
	thing = [];                          
	DEActor				[1404] = thing;
	//41 BBC 57C                                      
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Silence"
                                                  
	thing = [];                          
	DEActor				[1400] = thing;
	//41 BBC 578                                      
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Stone"
                                                  
	thing = [];                          
	DEActor				[1406] = thing;
	//41 BBC 57E                                      
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Water"
                                                  
	thing = [];                          
	DEActor				[1410] = thing;
	//41 BBC 582                                      
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		"S"
	thing[@ DEThingDef.Description ] = "Wind"

	// ******** OTHER *********
	thing = [];                                                             
	DEActor				[10225] = thing;
	//41 BBC                 27F1                                                        
	thing[@ DEThingDef.Version ] =		"C"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"none1"         
	thing[@ DEThingDef.Sequence ] =	"-"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "Bat spawner"         
                                                                                     
	thing = [];                                                             
	DEActor				[11] = thing;
	//41 BBC                 B                                                           
	thing[@ DEThingDef.Version ] =		"D"         
	thing[@ DEThingDef.Radius ] =		"20"         
	thing[@ DEThingDef.Height ] =		"16"         
	thing[@ DEThingDef.Sprite ] =		"none"         
	thing[@ DEThingDef.Sequence ] =	"-"         
	thing[@ DEThingDef.Class ] =		""         
	thing[@ DEThingDef.Description ] = "Deathmatch start"         
                                                                                     
	thing = [];                                                             
	DEActor				[10003] = thing;
	//41 BBC 2713                                                              
	thing[@ DEThingDef.Version ] =		"D2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FOGL"
	thing[@ DEThingDef.Sequence ] =	"ABCDE"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Fog patch (large)"
                                                                           
	thing = [];                                                   
	DEActor				[10002] = thing;
	//41 BBC 2712                                                              
	thing[@ DEThingDef.Version ] =		"D2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FOGM"
	thing[@ DEThingDef.Sequence ] =	"ABCDE"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Fog patch (medium)"
                                                                           
	thing = [];                                                   
	DEActor				[10001] = thing;
	//41 BBC 2711                                                              
	thing[@ DEThingDef.Version ] =		"D2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"FOGS"
	thing[@ DEThingDef.Sequence ] =	"ABCDE"
	thing[@ DEThingDef.Class ] =		"^"
	thing[@ DEThingDef.Description ] = "Fog patch (small)"
                                                                           
	thing = [];                                                   
	DEActor				[10000] = thing;
	//41 BBC 2710                                                              
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none3"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Fog spawner"
                                                                           
	thing = [];                                                   
	DEActor				[118] = thing;
	//41 BBC 76                                                                
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"32"
	thing[@ DEThingDef.Height ] =		"2"
	thing[@ DEThingDef.Sprite ] =		"TLGL"
	thing[@ DEThingDef.Sequence ] =	"AAA+"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Glitter bridge"
                                                                           
	thing = [];                                                   
	DEActor				[113] = thing;
	//41 BBC 71                                                                
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none4"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Leaf spawner"
                                                                           
	thing = [];                                                   
	DEActor				[9001] = thing;
	//41 BBC 2329                                                              
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Map spot"
                                                                           
	thing = [];                                                   
	DEActor				[9013] = thing;
	//41 BBC 2335                                                              
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Map spot (gravity)"
                                                                           
	thing = [];                                                   
	DEActor				[1] = thing;
	//41 BBC 1                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 1 start"
                                                                           
	thing = [];                                                   
	DEActor				[2] = thing;
	//41 BBC 2                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 2 start"
                                                                           
	thing = [];                                                   
	DEActor				[3] = thing;
	//41 BBC 3                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 3 start"
                                                                           
	thing = [];                                                   
	DEActor				[4] = thing;
	//41 BBC 4                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 4 start"
                                                                           
	thing = [];                                                   
	DEActor				[9100] = thing;
	//41 BBC 238C                                                              
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 5 start"
                                                                           
	thing = [];                                                   
	DEActor				[9101] = thing;
	//41 BBC 238D                                                              
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 6 start"
                                                                           
	thing = [];                                                   
	DEActor				[9102] = thing;
	//41 BBC 238E                                                              
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 7 start"
                                                                           
	thing = [];                                                   
	DEActor				[9103] = thing;
	//41 BBC 238F                                                              
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"16"
	thing[@ DEThingDef.Height ] =		"64"
	thing[@ DEThingDef.Sprite ] =		"PLAY"
	thing[@ DEThingDef.Sequence ] =	"A+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Player 8 start"
                                                                           
	thing = [];                                                   
	DEActor				[8104] = thing;
	//41 BBC 1FA8                                                              
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"6"
	thing[@ DEThingDef.Height ] =		"20"
	thing[@ DEThingDef.Sprite ] =		"SHRM"
	thing[@ DEThingDef.Sequence ] =	"AB+"
	thing[@ DEThingDef.Class ] =		"O*"
	thing[@ DEThingDef.Description ] = "Poisonous mushroom"
                                                                           
	thing = [];                                                   
	DEActor				[3000] = thing;
	//41 BBC BB8                                                               
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Polyobject anchor"
                                                                           
	thing = [];                                                   
	DEActor				[3001] = thing;
	//41 BBC BB9                                                               
	thing[@ DEThingDef.Version ] =		"X"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Polyobject start spot"
                                                                           
	thing = [];                                                   
	DEActor				[3002] = thing;
	//41 BBC BBA                                                               
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Polyobject start spot (crush)"
                                                                           
	thing = [];                                                   
	DEActor				[10090] = thing;
	//41 BBC                 276A                                              
	thing[@ DEThingDef.Version ] =		"C"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"128"
	thing[@ DEThingDef.Sprite ] =		"TSPK"
	thing[@ DEThingDef.Sequence ] =	"AAA+"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Spike Down"
                                                                           
	thing = [];                                                   
	DEActor				[10091] = thing;
	//41 BBC                 276B                                              
	thing[@ DEThingDef.Version ] =		"D2"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"128"
	thing[@ DEThingDef.Sprite ] =		"TSPK"
	thing[@ DEThingDef.Sequence ] =	"AAA+"
	thing[@ DEThingDef.Class ] =		"O"
	thing[@ DEThingDef.Description ] = "Spike Up"
                                                                           
	thing = [];                                                   
	DEActor				[14] = thing;
	//41 BBC E                                                                 
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"none5"
	thing[@ DEThingDef.Sequence ] =	"-"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Teleport landing"
                                                                           
	thing = [];                                                   
	DEActor				[140] = thing;
	//41 BBC 8C                                                                
	thing[@ DEThingDef.Version ] =		"D"
	thing[@ DEThingDef.Radius ] =		"20"
	thing[@ DEThingDef.Height ] =		"16"
	thing[@ DEThingDef.Sprite ] =		"TSMK"
	thing[@ DEThingDef.Sequence ] =	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	thing[@ DEThingDef.Class ] =		""
	thing[@ DEThingDef.Description ] = "Teleport smoke"


}

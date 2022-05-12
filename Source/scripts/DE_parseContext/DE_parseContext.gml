
function dchar(str,pos){
	return string_char_at(str,pos);
}

function isalpha(char){
	return (char == string_letters(char));
}

function isdigit( char ){
	if char == undefined return false;
	return ( char == string_digits(char));
	
}

function getToken( list ){
	
	var token = list[| 0];
	if token!=undefined{
		ds_list_delete(list,0);
		//trace("Getting Token",token);
	}
	return token;
	
}

function peekLastToken( list ){
	var pos = ds_list_size(list)-1;
	var token = list[| pos];
	return token;
}

function isStateDeclaration( str ){
	if string_char_at( str, string_length(str) ) == ":" return true;
	return false;
}

function DE_decorateDefineSequence( list, token, code ){
		
	if ds_list_size(code)>=2{
		
		var sprite = token;
		var frames = getToken(code);
		frames = string_to_array(frames);
		var tics = real(getToken(code));
		var script = getToken(code);
		var goto = null;
		var act = null;
	
		if script != undefined{
			var asset = asset_get_index(script);
			if script_get_name(asset) == script{
				var argz = "";
				if ds_list_size( code )>0{
					repeat ds_list_size( code ) argz += getToken(code);
				}
				if argz == "" argz += "None"
				trace("Sequence Callback Found:",script,"Arguments: "+argz );
				act = struct_copy(actionf_t);
				act.acp1 = asset_get_index(script);
			}
		}
		
		var dmisc1 = 0,dmisc2 = 0;
		
		var struct = newState_t(sprite,frames,tics,act,goto,dmisc1,dmisc2);
		trace("Created New State Structure",struct);
		array_push(list,struct);
	
	}else{
		var goto = undefined;
		switch token{
			case "loop":
				trace("Defining sequence goto",global.DEstatesPos);
				goto = global.DEstatesPos
			break;
			case "goto":
				goto = getToken(code);
				trace("Defining sequence goto",goto);
			break;
			case "stop":
				trace("Sequence has no goto and ends here");
				goto = null;
			break;
		}
		
		list[ array_length(list)-1 ].nextstate = goto;
		trace("State Structure Next State Defined:",list[ array_length(list)-1 ]);
	}	
}

function DE_actorSaveProperty( code, token ){
	
	//Setting some flags, decrate doesnt come with a true value, so add it in post.
	if (ds_list_size(code) == 0){
		with global.currentActor{
			switch token{
				case "Monster":
				trace("Setting Flags For Monster");
				SHOOTABLE = true;
				COUNTKILL = true;
				SOLID = true;
				CANPUSHWALLS = true;
				CANUSEWALLS = true;
				ACTIVATEMCROSS = true;
				CANPASS = true;
				ISMONSTER = true;
				return;
				break;
				
				case "Projectile":
				trace("Setting Flags For Projectile");
				NOBLOCKMAP = true;
				NOGRAVITY = true;
				DROPOFF = true;
				MISSILE = true;
				ACTIVATEIMPACT = true;
				ACTIVATEPCROSS = true;
				NOTELEPORT = true;
				BLOODSPLATTER = true;
				return;
				break;
			}
		}
	}
	if ( dchar(token,1) == "+" || ds_list_size(code) == 0 ){
		entry = true;
	}
	else{
		if !isdigit(token){
			if ( ds_list_size(code) == 1 ){//Code is ``variable entry`` so set struct var to the info that follows
				var entry = getToken(code);
				
				if DE_isStringLabel(entry){
					entry = DE_fetchLocalizationByLabel(entry);
					entry = entry[0];
				}
				
				if isdigit(entry) entry = real(entry);
				
			}else{
				entry = [];
				repeat ds_list_size(code){
					var dat = code[| 0 ];
					array_push(entry,dat);
					ds_list_delete(code,0);
				}
			}
		}
	}
	
	trace("Setting Actor Property",string_letters(token),entry);
	variable_struct_set(global.currentActor,string_letters(token),entry);
	
}

function DE_isStringLabel( _string ){
	
	var _val = string_pos("\"$",_string) == 1;
	//if _val trace("Var is Label:",_string);
	return _val;
}

function DE_advanceParseMode(token){
	
	if token == undefined{
		
		DEparseMode = "NULL";
		
	}else
	switch string_lower(token){
		case "actor":
			global.currentActor = struct_copy(ACTORstruct);
		break;
		case "map":
			global.currentActor = struct_copy(MAPINFOstruct);
		break;
		case "episode":
			global.currentActor = struct_copy(wadEpisode);
			ds_list_add(wadGameInfo.episodes,global.currentActor );	
			//trace("Discovered New Episode");
		break;
		case "":
			
		break;
	}
	
	array_push(global.parseModeList,DEparseMode);
	DEparseMode = string_upper(token);
	//DEtrace("Advancing Parse Mode",DEparseMode);
}

function DE_retreatParseMode(){
	
	array_delete(global.parseModeList,array_length(global.parseModeList),1);
	
	if DEparseMode == "EPISODEDEFAULT"{
		trace("Episode Content",string(global.currentActor));
	}
	
	DEparseMode = array_pop(global.parseModeList);
	if DEparseMode == undefined DEparseMode = "NULL";
	
	//trace("Retreating Parse Mode",DEparseMode);
}

function DE_parseDecoratePrep(){
	trace("Loading Decorate Lump");
	if wadDecorate == noone return false;
	DEparseMode = "NULL";
	global.parseModeList = [];
	var pos = 0;
	repeat ds_list_size(wadDecorate){
		var str = wadDecorate[| pos ];
		DE_parseLine(str,"DECORATE");
		pos++;
	}
}

function DE_parseMapInfoPrep(){
	
	trace("Loading Mapinfo Lump");
	if wadMapInfo == noone return false;
	DEparseMode = "NULL";
	DEtrace("Parsing Map Info");
	global.parseModeList = [];
	var pos = 0;
	repeat ds_list_size(wadMapInfo){
		var str = wadMapInfo[| pos ];
		DE_parseLine(str,"MAPINFO");
		pos++;
	}
	
}

function DE_parseLanguagePrep(){
	trace("Loading Lanugage Lump");
	if wadLanguage == noone return false;
	DEparseMode = "NULL";
	global.parseModeList = [];
	global.currentData = "";
	var pos = 0;
	repeat ds_list_size(wadLanguage){
		var str = wadLanguage[| pos ];
		DE_parseLine(str,"LANGUAGE");
		pos++;
	}
}

function DE_fetchMusicByLabel( _string ){
	var entry = DE_fetchLocalizationByLabel(_string);
	entry = "D_"+string_upper(entry);
	return entry;
}

function DE_fetchLocalizationByLabel( _string ){
	if is_array(_string){
		_string = _string[ floor(random( array_length(_string) - 0.5 ) ) ]; 
	}
	var tmpString = string_replace( _string,"\$","");
	
	if string_char_at(tmpString,1) == "*"{
		tmpString = string_copy(tmpString,2,string_length(tmpString));
	}
	
	tmpString = string_copy(tmpString,1,string_length(tmpString));
	
	trace("Fetching Label", tmpString );
	
	var _langDat = wadLocalization[? "enu" ];
	var _tmpDat = _langDat[? tmpString ];
	
	//trace("Label Found",_tmpDat);
	
	if is_array(_tmpDat){
		_tmpDat = _tmpDat[ floor(random( array_length(_tmpDat) - 0.5 ) ) ]; 
	}
	
	return _tmpDat;
}

function DE_parseLine( str, lump ){

	var code = string_split_as_code(str);
	do{
		
		if ds_list_size(code) == 0 exit; //ditto.
		
		var token = getToken(code);
			
		if token == "" exit;//This line is blank, skip it.
		
		if ( token == undefined ) break;
		
		if (token == "}"){
			DE_retreatParseMode();
		}
		else{
		
		switch lump{
			case "LANGUAGE":
				DE_parseLanguage( token, code );
			break;
			case "DECORATE":
				DE_parseDecorate( token, code );
			break;
			case "MAPINFO":
				DE_parseMapInfo( token, code );
			break;
		}
		
		if lump != "LANGUAGE"//Language lump has no parse modes
		if DEparseMode == "NULL"
			DE_advanceParseMode(token);
		
	}
		
	}until ds_list_size(code) == 0;
	
	ds_list_destroy(code);
}

function DE_parseDecorate( token, code ){
	switch DEparseMode{
				
		case "ACTOR":
			
			if isalpha(token){
				trace("Adding New Class To Actor Database",token);
				global.currentActor.class = token;
				wadClasses[? token ] = global.currentActor;
			}
				
			if isdigit( token ){
				trace("Assigning Class Id Number",real(token));
				DEActor[ real(token) ] = global.currentActor;
			}
				
			if token == "{"{
				trace("Setting Parse Mode To Actor Default");
				DE_advanceParseMode("ACTORDEFAULT");
			}
					
		break;
				
		case "ACTORDEFAULT":
			
			if (token == "States" ){
						
				DE_advanceParseMode("ACTORSTATES");
				global.currentActor.States = ds_map_build();
						
			}else{
						
				DE_actorSaveProperty(code,token);
						
			}
				
		break;
				
		case "ACTORSTATES":
			if token!="{"
			if ( isStateDeclaration(token) ){
						
				global.DEstatesPos = string_copy(token,1,string_length(token)-1);
						
				global.currentActor.States[? global.DEstatesPos ] = [];
						
				trace("Defining Actor State:", global.DEstatesPos);
			}else{
					
				var stateList = global.currentActor.States[? global.DEstatesPos ];
					
				DE_decorateDefineSequence( stateList, token, code );
					
			}
		break;
				
	}
}

function DE_parseLanguage( token, code ){
	
	if DEparseMode == "NULL"{
		if token == "["{
			global.currentActor = ds_map_build();
			var entries = "";
			do{
				token = getToken(code);
				if token!="]"{
					entries += token + " ";
					wadLocalization[? token ] = global.currentActor;
				}
			}until ds_list_size(code)==0;
			trace("Configuring Localizations: ", entries );
		}
		var first = string_char_at(token,1);
		if first!=""
		if first == "$" || isdigit(first) || isalpha(first){
						
			trace("Adding Localization Entry : < "+token+" >");
			var Name = token;
			global.currentEntry = [];
			global.currentActor[? Name ] = global.currentEntry;
			var _str = Name;
			var _token = getToken(code);
			if _token == "="{
				if ds_list_size(code) > 0 {//Single Line Multi Entry: Easy Mode
					do{
						var entry = getToken(code);
									
						if entry == ";" exit;
									
						entry = string_copy(entry,2,string_length(entry)-2);
									
						_str += "\n"+entry;
						array_push(global.currentEntry,entry);
									
						trace("Loading Localization Data",entry);
					}until ds_list_size(code) < 1;
								
				}else{//Multi Line Entry: Hard Mode
					global.currentData = Name;
					DEparseMode = Name;
					//trace("Multi Line Entry",global.currentData);
				}
			}
		}
					
	}else{
		if token != ";"{
						
			global.currentData += "\n"+token;
			array_push(global.currentEntry,token);
									
			//trace("Loading Localization Data",token);
						
			if ds_list_size(code)>0{//Let's check for multiple entries on each line still
				do{
					var entry = getToken(code);
					if entry == ";"{
						trace("Loading Localization Data",global.currentData);
						DEparseMode = "NULL";
						exit;
					}
					entry = string_copy(entry,2,string_length(entry)-2);
					global.currentData += "\n"+entry;
					array_push(global.currentEntry,entry);
				}until ds_list_size(code) == 0;
			}
		}else{
						
			trace("Loading Localization Data",global.currentData);
			DEparseMode = "NULL";
						
		}
	}
}
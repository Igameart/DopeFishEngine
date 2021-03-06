
function dchar(str,pos){
	return string_char_at(str,pos);
}

function isalpha(char){
	return (char == string_letters(char));
}

function isdigit( char ){
	return ( char == string_digits(char));
}

function getToken( list ){
	
	var token = list[| 0];
	if token!=undefined{
		ds_list_delete(list,0);
		trace("Getting Token",token);
	}
	return token;
	
}

function isStateDeclaration( str ){
	if string_char_at( str, string_length(str) ) == ":" return true;
	return false;
}

function DE_defineSequence( list, token, code ){
		
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
				DEtrace("Sequence Callback Found:",script,"Arguments: "+argz );
				act = struct_copy(actionf_t);
				act.acp1 = asset_get_index(script);
			}
		}
		
		var dmisc1 = 0,dmisc2 = 0;
		
		var struct = newState_t(sprite,frames,tics,act,goto,dmisc1,dmisc2);
		DEtrace("Created New State Structure",struct);
		array_push(list,struct);
	
	}else{
		var goto = undefined;
		switch token{
			case "loop":
				DEtrace("Defining sequence goto",global.DEstatesPos);
				goto = global.DEstatesPos
			break;
			case "goto":
				goto = getToken(code);
				DEtrace("Defining sequence goto",goto);
			break;
			case "stop":
				DEtrace("Sequence has no goto and ends here");
				goto = null;
			break;
		}
		
		list[ array_length(list)-1 ].nextstate = goto;
		DEtrace("State Structure Next State Defined:",list[ array_length(list)-1 ]);
	}	
}

function DE_actorSaveProperty( code, token ){
	
	//Setting some flags, decrate doesnt come with a true value, so add it in post.
	if (ds_list_size(code) == 0){
		with global.currentActor{
			switch token{
				case "Monster":
				DEtrace("Setting Flags For Monster");
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
				DEtrace("Setting Flags For Projectile");
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
	
	DEtrace("Setting Actor Property",string_letters(token),entry);
	variable_struct_set(global.currentActor,string_letters(token),entry);
	
}

function DE_advanceParseMode(token){
	if token == undefined{
		
		DEparseMode = "NULL";
		
	}else
	switch string_lower(token){
		case "actor":
			global.currentActor = struct_copy(ACTORstruct);
		break;
	}
	
	DEparseMode = string_upper(token);
	trace("Advancing Parse Mode",DEparseMode);
	array_push(global.parseModeList,DEparseMode);
}

function DE_retreatParseMode(){
	DEparseMode = array_pop(global.parseModeList);
	array_delete(global.parseModeList,array_length(global.parseModeList),1);
}

function DE_parseDecorate(  ){
	global.parseModeList = [];
	var pos = 0;
	repeat ds_list_size(wadDecorate){
		var str = wadDecorate[| pos ];
		DE_parseLine(str);
		pos++;
	}
	
}

function DE_parseLine( str ){

	var code = string_split_as_code(str);
	
	do{
		
		var token = getToken(code);
		
		if ( token == undefined ) break;
		
		if (token == "}"){
			DE_retreatParseMode();
		}
		else{
		
			switch DEparseMode{
				
				case "ACTOR":
			
					if isalpha(token){
						DEtrace("Adding New Class To Actor Database",token);
						global.currentActor.class = token;
						wadClasses[? token ] = global.currentActor;
					}
				
					if isdigit( token ){
						DEtrace("Assigning Class Id Number",real(token));
						DEActor[ real(token) ] = global.currentActor;
					}
				
					if token == "{"{
						DEtrace("Setting Parse Mode To Actor Default");
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
						
						DEtrace("Defining Actor State:", global.DEstatesPos);
					}else{
					
						var stateList = global.currentActor.States[? global.DEstatesPos ];
					
						DE_defineSequence( stateList, token, code );
					
					}
				break;
				
			}
			
			if DEparseMode == "NULL"
				DE_advanceParseMode(token);
		
		}
		
	}until ds_list_size(code) == 0;
	
	ds_list_destroy(code);
}

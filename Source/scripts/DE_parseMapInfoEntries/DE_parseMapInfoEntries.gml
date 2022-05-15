

function DE_parseMapInfo( token, code ){

if DEparseMode == "MAPINFO"
	DE_advanceParseMode(token);
	
	switch DEparseMode{
				
		case "GAMEINFO":
			DE_parseMapInfoGameInfo( token, code );
		break;
		case "EPISODE":
			DE_parseMapInfoEpisode( token, code );
		break;
		case "EPISODEDEFAULT":
			DE_parseProperties( token, code );
		break;
		case "MAP":
			DE_parseMapInfoMap( token, code );
		break;
		case "MAPDEFAULT":
			DE_parseProperties( token, code );
		break;
				
	}
}

function DE_parseMapInfoMap( token, code ){
	
	if token == "{"{
		wadGameInfo.maps[? global.currentActor.lumpname ] = global.currentActor;
		//trace("NOTICE: Map Name",global.currentActor.lumpname, global.currentActor.name);
		DEparseMode = "MAPDEFAULT";//Silently advance to a new parse mode, do not add to stack so retreating works properly.
	}else{
		global.currentActor.lumpname = (token);
		var _token = getToken(code);
		if !is_undefined(_token){
		if DE_isLookupLabel(_token){
			global.currentActor.name = (_token);
		}else
			global.currentActor.name = (_token);
			if _token == "lookup"{
				_token = getToken(code);
				global.currentActor.name = "$"+(_token);
			}
			trace(global.currentActor.name);
		}
	}

}

function DE_parseMapInfoEpisode( token, code ){
	
	var _token = getToken(code);
	
	if token == "{"{
		DEparseMode = "EPISODEDEFAULT";//Silently advance to a new parse mode, do not add to stack so retreating works properly.
	}else{
	
		global.currentActor.maplump = string_upper(token);
		//trace("Episode Starting Map",string_upper(token));
		
		if !is_undefined(_token){
			if isalpha(_token){
				if token == "teaser"{
					global.currentActor.teaserlump = string_upper(_token);
					//trace("Episode Teaser Map",string_upper(_token));
				}
			}
		}
	}
}

function DE_parseProperties( token, code ){
	
	var Name = token;
	
	var _token = getToken(code);
	
	if _token == "="{
		if ds_list_size(code) > 1 {//Single Line Multi Entry: Easy Mode
			global.currentEntry = [];
			do{
				var entry = getToken(code);
				
				entry = DE_propertyProcess(entry);
				
				array_push(global.currentEntry,entry);
									
			}until ds_list_size(code) < 1;
			DE_setStructProperty(global.currentActor,Name,global.currentEntry);
			trace("Setting Property",DEparseMode,Name,global.currentEntry);
		}else{
			var entry = getToken(code);
			
			entry = DE_propertyProcess(entry);
			trace("Setting Property",DEparseMode,Name,entry);
			DE_setStructProperty(global.currentActor,Name,entry);
		}
	}
	if (_token == undefined){ //Single Entry properties default to trueentry = DE_propertyProcess(entry);
		trace("Setting Property",DEparseMode,Name,"TRUE");
		DE_setStructProperty(global.currentActor,Name,true);
	}

}

function DE_parseMapInfoEpisodeDefault( token, code ){
	
	var Name = token;
	
	var _token = getToken(code);
	
	if _token == "="{
		if ds_list_size(code) > 1 {//Single Line Multi Entry: Easy Mode
			global.currentEntry = [];
			do{
				var entry = getToken(code);
				
				entry = DE_propertyProcess(entry);
				
				array_push(global.currentEntry,entry);
									
			}until ds_list_size(code) < 1;
			DE_setStructProperty(global.currentActor,Name,global.currentEntry);
			trace("Setting Episode Property",Name,global.currentEntry);
		}else{
			var entry = getToken(code);
			
			entry = DE_propertyProcess(entry);
			trace("Setting Episode Property",Name,entry);
			DE_setStructProperty(global.currentActor,Name,entry);
		}
	}

}

function DE_parseMapInfoGameInfo( token, code ){
	
	var Name = token;
	var _token = getToken(code);
	if _token == "="{
		if ds_list_size(code) > 1 {//Single Line Multi Entry: Easy Mode
			
			global.currentEntry = [];
			do{
				var entry = getToken(code);
				
				entry = DE_propertyProcess(entry);
				
				array_push(global.currentEntry,entry);
									
			}until ds_list_size(code) < 1;
			
			DE_setStructProperty(wadGameInfo,Name,global.currentEntry);
			trace("Setting GameInfo Property",Name,global.currentEntry);
			
		}else{
			var entry = getToken(code);
			
			entry = DE_propertyProcess(entry);
			trace("Setting GameInfo Property",Name,entry);
			DE_setStructProperty(wadGameInfo,Name,entry);
		}
	}

}

function DE_setStructProperty( struct, name, val ){
	
	if variable_struct_exists(struct,name)
		variable_struct_remove(struct,name);
		
	variable_struct_set(struct,name,val);
	
	//DEtrace("Setting Struct Property",name,variable_struct_get(struct,name));
	
}

function DE_propertyProcess( entry ){
	
	//if entry is a string of numbers, make real
	if isdigit(entry){
		
		entry = real(entry);
		
	}else{
		
		var len = string_length(entry);
		//if surrounded in quotations, remove them for ease of use.
		if string_char_at( entry, 1 ) == "\"" && string_char_at(entry,len) == "\"" {
			entry = string_copy(entry,2,string_length(entry)-2);
			trace("Processing Property For String Entry",entry);
		}
		
	}
	
	return entry;
}
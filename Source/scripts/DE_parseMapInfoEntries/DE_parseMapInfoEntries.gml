

function DE_parseMapInfo( token, code ){

if DEparseMode == "MAPINFO"
//if (token == "gameinfo" )
	DE_advanceParseMode(token);
	
	switch DEparseMode{
				
		case "GAMEINFO":
			
			DE_parseMapInfoGameInfo( token, code );
					
		break;
				
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
		}else{
			var entry = getToken(code);
			
			entry = DE_propertyProcess(entry);
			
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
/// @description Fetch Wad

if DE_fetchWad(WAD){
	
	draw_set_font(_GamesFonts[selMode]);

	loading = false;

	var wadType = wadHeader.id
	
	if WAD_EPISODIC == false{
		mapName = "MAP01"
	}

	_wadDat = ""

	if wadType == "PWAD"{
		_wadDat = "* warning *\n\n* "+wadType+"s may fail *\nin this version\n of dopefish!\n\n";
	}

	//_wadDat += "wad stats\n\n"
	
	if !is_undefined(wadGameInfo.name){
		var _tmpName = string_wordwrap_width(wadGameInfo.name,164,"\n",true);
		_wadDat += _tmpName+"\n\n";
	}
	
	if !is_undefined(wadGameInfo.game){
		var _tmpName = (wadGameInfo.game);
		_wadDat += _tmpName+"\n\n";
	}
	_wadDat+= "* * * * * * * * * *\n\n"
			
	var L = 16+1;
	var SL = 0;
	var str,spaces;
			
	str = "level format:"+WAD_FORMAT;
	
	SL = string_length(str);
	
	spaces = ""; repeat (L-SL) spaces+=" ";
	
	str = "level format  "+spaces+" "+WAD_FORMAT;
	
	_wadDat +=str+"\n\n";
							  
	str="wad entries:"+string(wadHeader.numlumps);
	
	SL = string_length(str);
	
	spaces = ""; repeat (L-SL) spaces+=" ";
	
	str="wad entries  "+spaces+" "+string(wadHeader.numlumps);
	
	_wadDat+=str+"\n\n";
							  
	str="textures:"+string(ds_map_size(textures));
	
	SL = string_length(str);
	
	spaces = ""; repeat (L-SL) spaces+=" ";
	
	str = "textures "+spaces+" "+string(ds_map_size(textures));
	
	_wadDat+=str+"\n\n";
							  
	str="flats:"+string(ds_map_size(flats_));
	
	SL = string_length(str);
	
	spaces = ""; repeat (L-SL) spaces+=" ";
	
	str = "flats "+spaces+" "+string(ds_map_size(flats_));
	
	_wadDat+=str+"\n\n";
							  
	str="sprites:"+string(ds_map_size(wadSprites));
	
	SL = string_length(str);
	
	spaces = ""; repeat (L-SL) spaces+=" ";
	
	str = "sprites "+spaces+" "+string(ds_map_size(wadSprites));
	
	_wadDat+=str+"\n\n";

}
/// @description Fetch Wad

DE_fetchWad(WAD);
loading = false;

var wadType = wadHeader[?"id"]

if wadType == "IWAD"{

	_wadDat = "wad stats\n\n"
	_wadDat+= "* * * * * * * * * *\n\n\n"
			
	var L = 16+1;
	var SL = 0;
	var str,spaces;
			
	str = "level format:"+WAD_FORMAT;
	
	SL = string_length(str);
	
	spaces = ""; repeat (L-SL) spaces+=" ";
	
	str = "level format  "+spaces+" "+WAD_FORMAT;
	
	_wadDat +=str+"\n\n";
							  
	str="wad entries:"+string(wadHeader[?"numlumps"]);
	
	SL = string_length(str);
	
	spaces = ""; repeat (L-SL) spaces+=" ";
	
	str="wad entries  "+spaces+" "+string(wadHeader[?"numlumps"]);
	
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

}else{
	_wadDat = "* warning *\n\nunsupported format! \n\n\n* "+wadType+" *\n\n may fail \nin this version\n of dopefish!";
}
function DE_getSky(num){
	if is_struct(wadGameInfo.maps[? DEMap ]){
		var sky = (num == 0)?wadGameInfo.maps[? DEMap ].sky1 : wadGameInfo.maps[? DEMap ].sky2;
		if !is_array(sky) return sky else return sky[0];
	}
}

function DE_textureIsSky( name ){
	
	if name == wadGameInfo.skyflatname return true;
	
	return false;	
}

function DE_loadSkyTextures(){
	//Most maps only use one sky, so let's get that to work for now.
	var sky = DE_getSky(0);
	wadGameInfo.skyTexture = DE_buildSingleTexture(sky);
	
	if !is_undefined(wadGameInfo.skyTexture)
		sprite_save(wadGameInfo.skyTexture,0,"SKYTEX.png");
	
}

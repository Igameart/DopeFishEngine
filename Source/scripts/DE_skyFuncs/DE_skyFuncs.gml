function DE_getSky(num){
	var sky = (num == 0)?wadGameInfo.maps[? DEMap ].sky1 : wadGameInfo.maps[? DEMap ].sky2;
	if !is_array(sky) return sky else return sky[0];
}

function DE_textureIsSky( name ){
	
	/*switch name{
		case "F_SKY": return true;
		case "F_SKY1": return true;
		case "F_SKY2": return true;
		case "F_SKY3": return true;
		case "F_SKY4": return true;
		case "F_SKY001": return true;
	}*/
	
	if name == wadGameInfo.skyflatname return true;
	
	//if name == "-" return true;
	
	return false;	
}

function DE_loadSkyTextures(){
	//Most maps only use one sky, so let's get that to work for now.
	var sky = DE_getSky(0);
	wadGameInfo.skyTexture = DE_buildSingleTexture(sky);
	sprite_save(wadGameInfo.skyTexture,0,"SKYTEX.png");
}

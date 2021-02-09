function DE_prepSwitch() {
	var sPos = undefined;


	if DE_textureIsSwitch(side[?"tex_l"]) sPos = "tex_l";
	if DE_textureIsSwitch(side[?"tex_m"]) sPos = "tex_m";
	if DE_textureIsSwitch(side[?"tex_u"]) sPos = "tex_u";

	switchIndex = sPos;

	if sPos!=undefined{
		var sTex = side[?switchIndex];
	
		trace("Switch Object Has Switch Texture",sPos,sTex);
		switchTex[0] = sTex;
		switchTex[1] = wadSwitchTextures[? sTex ];
	
	}


}

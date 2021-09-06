function DE_prepSwitch() {
	var sPos = undefined;
	
	if !is_struct(side) return false;

	if DE_textureIsSwitch(side.lowtex)	sPos = "lowtex";
	if DE_textureIsSwitch(side.midtex)	sPos = "midtex";
	if DE_textureIsSwitch(side.uptex)	sPos = "uptex";

	if sPos!=undefined{

		switchIndex = sPos;
		var sTex;
		switch sPos{
			case "lowtex": sTex = side.lowtex; break;
			case "midtex": sTex = side.midtex; break;
			case "uptex": sTex = side.uptex; break;
		}
	
		trace("Switch Object Has Switch Texture",sPos,sTex);
		switchTex[0] = sTex;
		switchTex[1] = wadSwitchTextures[? sTex ];
	
	}


}

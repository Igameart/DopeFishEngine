function DE_textureIsSwitch() {
	
	var tex = argument[0];

	if ds_exists(wadSwitchTextures,ds_type_map){
	if wadSwitchTextures[?tex]!=undefined || ds_map_find_entry(wadSwitchTextures,tex)!=undefined{
		return true;
	}
	return false;
	}
	return false;


}

var tex = argument[0];

if wadSwitchTextures[?tex]!=undefined || ds_map_find_entry(wadSwitchTextures,tex)!=undefined{
	return true;
}
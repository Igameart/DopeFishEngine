/// @description DE_getPatch(patch,poff){
/// @param patch
/// @param poff
function DE_getPatch(argument0) {

	var pname=argument0;
	//var patchname=patch;

	var patch=ds_map_find_value(wadPatches,pname);

	//patch isn't loaded, let's see if it can be
	if is_undefined(patch){
		patch = DE_readPatch(pname);
	}

	if !is_undefined(patch){
		//if !is_undefined(patch){
		//show_debug_message("NOTICE: Building patch "+patchname+" width: "+string(patch_width)+","+string(patch_height));
	
		var data2=DE_buildPatch(patch);//data,patch_width,patch_height);
	
		//sprite_save(data2,0,patchname+".png");
		return data2;
	}
	//}



}

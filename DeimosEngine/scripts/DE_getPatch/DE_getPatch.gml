/// @description DE_getPatch(patch,poff){
/// @param patch
/// @param poff

var patch=argument0;
//var patchname=patch;

patch=ds_map_find_value(wadPatches,patch);
if !is_undefined(patch){
	//if !is_undefined(patch){
	//show_debug_message("NOTICE: Building patch "+patchname+" width: "+string(patch_width)+","+string(patch_height));
	var data2=DE_buildPatch(patch);//data,patch_width,patch_height);
	//sprite_save(data2,0,patchname+".png");
	return data2;
}
//}

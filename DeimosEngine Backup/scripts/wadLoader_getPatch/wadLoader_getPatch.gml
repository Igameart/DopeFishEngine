/// @description wadLoader_getPatch(patch,poff){
/// @param patch
/// @param poff

var patch=argument0;
var patchname=patch;

patch=ds_map_find_value(wadPatches,patch);
if !is_undefined(patch){
//if !is_undefined(patch){

patch_width=ds_map_find_value_fixed(patch,"width");
patch_height=ds_map_find_value_fixed(patch,"height");

var data = ds_map_find_value_fixed(patch,"data");

//show_debug_message("NOTICE: Building patch "+patchname+" width: "+string(patch_width)+","+string(patch_height));

patch_data=data;

var data2=wadLoader_buildPatch(data,patch_width,patch_height);
//sprite_save(data2,0,patchname+".png");

return data2;
}
//}

var lump=argument0;
/*
for(l=0;l<ds_list_size(wadDirectory);l+=1)
	if(ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"name")=lump)
	return ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,l),"filepos");*/
var ofs = wadDirectoryOfs[? lump ];

if ofs != undefined{
	return ofs;//ds_map_find_value_fixed(ds_list_find_value_fixed(wadDirectory,ofs),"filepos");
}
return -1;

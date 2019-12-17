/// @description 
var cMsect;
cMsect=DE_findSectorAt(x,y,Msect);

if cMsect!=Msect{
    if !is_undefined(cMsect){
        secZ=ds_map_find_value_fixed(ds_list_find_value_fixed(mapSectors,cMsect),"floor");
		secL=ds_map_find_value_fixed(ds_list_find_value_fixed(mapSectors,cMsect),"lightlevel");
        Msect=cMsect;
    }
};
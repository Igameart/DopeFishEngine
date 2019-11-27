/// @description 

var cMsect;
cMsect=YYD_get_sector(x,y,Msect);

trace(Msect,cMsect);

if cMsect!=Msect{
    if !is_undefined(cMsect){
        secZ=ds_map_find_value_fixed(ds_list_find_value_fixed(mapSectors,cMsect),"floor");
        Msect=cMsect;
    }
};
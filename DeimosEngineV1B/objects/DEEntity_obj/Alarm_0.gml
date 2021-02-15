/// @description 
var cMsect;
cMsect=DE_findSectorAt(x,y,Msect);

if cMsect!=Msect{
	
    if !is_undefined(cMsect){
        secZ	= ds_map_find_value_fixed(ds_list_find_value_fixed(mapSectors,cMsect),"floor");
		secC	= ds_map_find_value_fixed(ds_list_find_value_fixed(mapSectors,cMsect),"ceiling");
		secL	= ds_map_find_value_fixed(ds_list_find_value_fixed(mapSectors,cMsect),"lightlevel");
        Msect	= cMsect;
    }
	
	z = secZ;

	if !entGrounded{
		if !entMonster{
			z = secC-yOff;
		}
	}
	
	secColor = 1;
	if secL!=undefined{
		secColor = secL/255;
	}
	
};
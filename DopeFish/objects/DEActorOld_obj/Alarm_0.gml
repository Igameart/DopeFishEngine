/// @description

//DE_loadActorData();

var cMsect;
cMsect=DE_findSectorAt(x,y,Sector);

if cMsect!=Sector{
	
    if !is_undefined(cMsect){
        secZ	= (ds_list_find_value_fixed(mapSectors,cMsect).floorz);
		secC	= (ds_list_find_value_fixed(mapSectors,cMsect).ceilingz);
		secFL	= (ds_list_find_value_fixed(mapSectors,cMsect).floorshade );
		secCL	= (ds_list_find_value_fixed(mapSectors,cMsect).ceilingshade );
        Sector	= cMsect;
    }
	
	z += secZ;

	if !entGrounded{
		if !ISMONSTER{
			z = secC-yOff;
		}
	}
	
	secColor = 1;
	if secL!=undefined{
		secColor = secFL/255;
	}
	
};

Mssect=DE_findSubacksectororAt(x,y);//,Mssect);
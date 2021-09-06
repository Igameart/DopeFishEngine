/// @description Insert description here

xx=1;
yy=0;
zz=0;
zspeed=0;
Sector=-1;
Subsector=-1;
secF=0;
secC=0;
jumping = false;
jumpVal = 0;
jumpStr = 40;
Height = 32;
HeadRoom = 4;

var cMsect;
cMsect=DE_findSectorAt(x,y,Sector);

if cMsect!=Sector{
    if !is_undefined(cMsect){
        var sects = wadlevel.sectors;
        z=ds_list_find_value_fixed(sects,cMsect).floorz;
    }
};

var sects=ds_map_find_value_fixed(wad_levels,"sectors");

if line!=-1{
    var lines=ds_map_find_value_fixed(wad_levels,"linedefs");
    var linedef=ds_list_find_value(lines,line);
    var sector=ds_map_find_value_fixed(linedef,"sector");
    
    if sector==0{
        sector=ds_map_find_value(linedef,"bsect");
    }
    
    if beg==0{
    beg=1;
    if (ds_list_find_index(doors,sector)==-1){
        ds_list_add(doors,sector)
    }else instance_destroy();
    }

}
time++;

var sec=ds_list_find_value(sects,sector);

if sec!=undefined
	ds_map_replace(sec,"crush",-(32*sin(time/64)-32));


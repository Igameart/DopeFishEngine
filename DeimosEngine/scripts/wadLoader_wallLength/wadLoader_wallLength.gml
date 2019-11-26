var x1,y1,x2,y2;

x1 = ds_map_find_value_fixed(argument0,"x");
y1 = ds_map_find_value_fixed(argument0,"y");

x2 = ds_map_find_value_fixed(argument1,"x");
y2 = ds_map_find_value_fixed(argument1,"y");

return point_distance(x1,y1,x2,y2);

while ds_list_size(ds_lists)>0{
    ds_map_destroy(ds_list_find_value_fixed(ds_lists,0));
    ds_list_delete(ds_lists,0);
}
ds_list_destroy(ds_lists);

while ds_list_size(ds_maps)>0{
    ds_map_destroy(ds_list_find_value_fixed(ds_maps,0));
    ds_list_delete(ds_maps,0);
}
ds_list_destroy(ds_maps);

while ds_list_size(ds_grids)>0{
    ds_grid_destroy(ds_list_find_value_fixed(ds_grids,0));
    ds_list_delete(ds_grids,0);
}
ds_list_destroy(ds_grids);

buffer_delete(wadbuff);

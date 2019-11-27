did=0;

//display_reset(4,1);

test_surf=surface_create(1,1);

ds_data_init();

var WAD = get_open_filename("GL IWAD|*.wad", "GLDOOM.wad");

DeimosEngineInit(WAD,Mapper_obj);

MAP=get_string("Enter Map Name:","E1M1");

DE_LoadMap(MAP);




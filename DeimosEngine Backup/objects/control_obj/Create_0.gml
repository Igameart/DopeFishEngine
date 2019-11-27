did=0;
globalvar bgspr;
globalvar flat1;

test_surf=surface_create(1,1);

ds_data_init();

var WAD = get_open_filename("GL IWAD|*.wad", "GLDOOM.wad");

flat1=0;

DeimosEngineInit(WAD,Mapper_obj);

MAP=get_string("Enter Map Name:","E1M1");

var start_time=current_time;

DE_LoadMap(MAP);

var end_time=current_time;

buffer_delete(wadbuff);

globalvar time_taken; time_taken=(end_time-start_time);

YYD_vbuffer_format_define();



///Generate the vbuffers for each sub sector

var gssects = mapGLSSects;//ds_map_find_value(wad_levels,"glssects");

if !is_undefined(gssects){

    show_debug_message("************ NOTICE: "+string(ds_list_size(gssects))+" SubSectors");

    for (j = 0; j<ds_list_size(gssects); j++ ){
        YYD_Build_GLSS(j);
    }
    
	YYD_GLSS_build_walls();
	trace("Done Building Walls");
}


did=0;

//display_reset(4,1);

test_surf=surface_create(1,1);

ds_data_init();

var WAD = get_open_filename("GL IWAD|*.wad", "GLDOOM.wad");

DeimosEngineInit(WAD,Mapper_obj);

MAP=get_string("Enter Map Name:","E1M1");

var start_time=current_time;

DE_LoadMap(MAP);

var end_time=current_time;

globalvar time_taken; time_taken=(end_time-start_time);

/*var WAD = get_open_filename("GL IWAD|*.wad", "GLDOOM.wad");

flat1=0;

if wadLoader_getFile(WAD)=true{
    wadLoader_getHeader();
    wadLoader_getDirectory();
    wadLoader_getColorMaps();
    wadLoader_getPatches();
    wadLoader_getWallTextures();
    wadLoader_getFlatTextures();
}

MAP=get_string("Enter Map Name:","E1M1");

var start_time=current_time;
wadLoader_getLevel(MAP);
var LEV = wadLoader_getLumpNum(MAP)
wadLoader_getLinedefs(MAP,LEV+LINEDEFOFS);
wadLoader_getVertexes(MAP,LEV+VERTEXESOFS);
wadLoader_getSidedefs(MAP,LEV+SIDEDEFOFS);
wadLoader_getSectors(MAP,LEV+SECTORSOFS);
wadLoader_getThings(MAP,LEV+THINGSOFS);
wadLoader_getGLVerts(MAP,LEV+GL_VERTOFS);
wadLoader_getGLSegs(MAP,LEV+GL_SEGSOFS);
wadLoader_getGLSSect(MAP,LEV+GL_SSECTOFS);

wadLoader_preload_flats();
wadLoader_preload_patches();

var end_time=current_time;

buffer_delete(wadbuff);

globalvar time_taken; time_taken=(end_time-start_time);*/

YYD_vbuffer_format_define();



///Generate the vbuffers for each sub sector

var gssects = ds_map_find_value(wad_levels,"glssects");

if !is_undefined(gssects){

    show_debug_message("************ NOTICE: "+string(ds_list_size(gssects))+" SubSectors");

    for (j = 0; j<ds_list_size(gssects); j++ ){
        YYD_Build_GLSS(j);
    }
    
YYD_GLSS_build_walls();
}


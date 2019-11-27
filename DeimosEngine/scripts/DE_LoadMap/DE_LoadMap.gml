var _map = argument[0];

var start_time=current_time;

wadLoader_getLevel(_map);
var LEV = wadLoader_getLumpNum(_map)
wadLoader_getLinedefs(_map,LEV+LINEDEFOFS);
wadLoader_getVertexes(_map,LEV+VERTEXESOFS);
wadLoader_getSidedefs(_map,LEV+SIDEDEFOFS);
wadLoader_getSectors(_map,LEV+SECTORSOFS);
wadLoader_getThings(_map,LEV+THINGSOFS);
wadLoader_getGLVerts(_map,LEV+GL_VERTOFS);
wadLoader_getGLSegs(_map,LEV+GL_SEGSOFS);
wadLoader_getGLSSect(_map,LEV+GL_SSECTOFS);
wadLoader_getGLNodes(_map,LEV+GL_NODESOFS);

wadLoader_preload_flats();
wadLoader_preload_patches();

buffer_delete(wadbuff);

var end_time=current_time;

globalvar time_taken; time_taken=(end_time-start_time)/1000;

YYD_vbuffer_format_define();

///Generate the vbuffers for each sub sector

var gssects = ds_map_find_value(wad_levels,"glssects");

if !is_undefined(gssects){

    show_debug_message("************ NOTICE: "+string(ds_list_size(gssects))+" SubSectors");

    for (j = 0; j<ds_list_size(gssects); j++ ){
        DE_BuildGLSSect(j);
    }
    
	DE_BuildWalls();
}
var _map = argument[0];

var start_time=current_time;

DE_getLevel(_map);
var LEV = DE_getLumpNum(_map)
DE_getLinedefs(_map,LEV+LINEDEFOFS);
DE_getVertexes(_map,LEV+VERTEXESOFS);
DE_getSidedefs(_map,LEV+SIDEDEFOFS);
DE_getSectors(_map,LEV+SECTORSOFS);
DE_getGLVerts(_map,LEV+GL_VERTOFS);
DE_getGLSegs(_map,LEV+GL_SEGSOFS);
DE_getGLSSect(_map,LEV+GL_SSECTOFS);
DE_getGLNodes(_map,LEV+GL_NODESOFS);
DE_getThings(_map,LEV+THINGSOFS);

DE_preload_flats();
DE_preload_patches();

buffer_delete(wadbuff);

var end_time=current_time;

globalvar time_taken; time_taken=(end_time-start_time)/1000;

DE_vbufferFormatDefine();

///Generate the vbuffers for each sub sector

var gssects = ds_map_find_value(wad_levels,"glssects");

if !is_undefined(gssects){

    show_debug_message("************ NOTICE: "+string(ds_list_size(gssects))+" SubSectors");

    for (j = 0; j<ds_list_size(gssects); j++ ){
        DE_buildGLSSect(j);
    }
    
	DE_buildWalls();
}
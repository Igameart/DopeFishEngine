var _map = argument[0];

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
function DE_loadMap( _map ) {

	DEMap = _map;

	var start_time=current_time;

	DE_getLevel(_map);
	
	var LEV = DE_getLumpNum(_map);
	
	if LEV == undefined return false;
	
	DE_getVertexes(_map,LEV+VERTEXESOFS);
	DE_getGLVerts(_map,LEV+GL_VERTOFS);
	DE_getSectors(_map,LEV+SECTORSOFS);
	DE_getSidedefs(_map,LEV+SIDEDEFOFS);
	DE_getLinedefs(_map,LEV+LINEDEFOFS);
	//DE_getReject(_map,LEV+REJECTOFS);
	
	//show_message_async("wadGLVersion: "+string(wadGLVersion));

	if wadGLVersion!=-1{
		DE_getGLSegs(_map,LEV+GL_SEGSOFS);
		DE_getGLSSect(_map,LEV+GL_SSECTOFS);
		DE_getGLNodes(_map,LEV+GL_NODESOFS);
		DE_getGLPVIS(_map,LEV+GL_PVSOFS);
	}else{
		DE_getSegs(_map,LEV+SEGSOFS);
		DE_getSsectors(_map,LEV+SSECTORSOFS);
		DE_getNodes(_map,LEV+NODESOFS);
	}

	DE_getThings(_map,LEV+THINGSOFS);

	DE_preload_flats();
	DE_preload_patches();

	var end_time=current_time;

	time_taken=(end_time-start_time)/1000;

	globalvar pload_tex;
	pload_tex=ds_map_build();

	DE_vbufferFormatDefine();

	if wadGLVersion!=-1{

		///Generate the vbuffers for each GL Subsector
		var gssects = mapGLSSects;

		if !is_undefined(gssects){

		    trace("************ NOTICE: "+string(ds_list_size(gssects))+" Subsectors");

		    for (var j = 0; j<ds_list_size(gssects); j++ ){
		        DE_buildGLSSect(j);
		    }
	
		}
	}else{

		///Generate the vbuffers for each Subsector
		var ssects = mapSSectors;

		if !is_undefined(ssects){

		    trace("************ NOTICE: "+string(ds_list_size(ssects))+" Subsectors");

		    for (var j = 0; j<ds_list_size(ssects); j++ ){
		        DE_buildSSector(j);
		    }
	
		}
	}
	
	
	trace("Building Walls");
    
	DE_buildWallsCollisions();
	DE_buildGLSegs();
	
	trace("Loading Textures");
	
	DE_preload_textures();

}

function DE_renderSubmit() {
	texture_set_repeat(true);

	shader_set(shd_GLSSect);
	shader_set_uniform_f(u_fogColorG,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
	shader_set_uniform_f(u_fogMaxDistG,f_far*0.9);
	shader_set_uniform_f(u_fogMinDistG,f_near);

	var ssects;
	if wadGLVersion !=-1{
		ssects = mapGLSSects;//ds_map_find_value_fixed(wad_levels,"glssects");
	}else{
		ssects = mapSSectors;
	}

	//trace("Subsectors to Render:",ds_list_size(bspSSectCache));

	for (var j = 0; j<ds_list_size(bspSSectCache); j++ ){
    
		var ssectNum = bspSSectCache[|j];
	    var ssect = ds_list_find_value_fixed(ssects,ssectNum);
	    DE_renderSSect(ssect);

	}
	shader_reset();

	shader_set(shd_Sidedef);
	shader_set_uniform_f(u_fogColorS,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
	shader_set_uniform_f(u_fogMaxDistS,f_far*0.9);
	shader_set_uniform_f(u_fogMinDistS,f_near);

	for (var j = 0; j<ds_list_size(bspLineCache); j++ ){
	
		var line = bspLineCache[|j];
		DE_renderGLSeg(line);

	}

	shader_reset();


}

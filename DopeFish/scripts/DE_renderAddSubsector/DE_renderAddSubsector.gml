function DE_renderAddSubacksectoror() {
	var ssectNum = argument[0];


	texture_set_repeat(true);

	shader_set(shd_GLSSect);
	shader_set_uniform_f(u_fogColorG,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
	shader_set_uniform_f(u_fogMaxDistG,f_far*0.9);
	shader_set_uniform_f(u_fogMinDistG,f_near);

	var ssects;

	ssects = mapGLSSects;


	var ssect = ds_list_find_value_fixed(ssects,ssectNum);
	DE_renderSSect(ssect);

	shader_reset();


	//var sub = mapGLSSects[|ssectNum];

	/*
	var count = sub[?"count"];
	var line = sub[?"start"];

	while (count--)
	{
		var _seg = mapGLSegs[|line];
	
		if (_seg[?"linedef"] >= 0)
		{
			DE_renderAddLine(line);
		}
	
		line++;
	
	}*/

	//ds_list_add(bspSSectCache,ssectNum);


}

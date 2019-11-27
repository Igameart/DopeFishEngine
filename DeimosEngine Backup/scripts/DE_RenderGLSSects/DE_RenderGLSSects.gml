
shader_set(shd_GLSSect);
shader_set_uniform_f(u_fogColorG,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
shader_set_uniform_f(u_fogMaxDistG,f_far*0.9);
shader_set_uniform_f(u_fogMinDistG,f_near);

//DE_RenderBSPNode(numGLNodes-1);

for (j = 0; j<ds_list_size(mapGLSSects); j++ ){
    
    DE_RenderGLSSect(j);

}

shader_reset();
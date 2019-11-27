
if did==0{
    DE_preload_textures()
    d3d_set_perspective(true);
    d3d_set_hidden(true);
    d3d_set_culling(true);
    texture_set_repeat(true);
    did=1;
	
    d3d_start();///Start 3d drawing
    draw_set_alpha_test(true);
    draw_set_alpha_test_ref_value(128);
}


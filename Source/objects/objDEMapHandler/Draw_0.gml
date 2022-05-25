/// @description Render Map


with DEcam{
	d3d_set_projection_ext(x,y,z+PLAYER_HEIGHT,x+cam_x,y+cam_y,z+PLAYER_HEIGHT+cam_z, 0,0,1, 80,__view_get( e__VW.WView, 0 )/__view_get( e__VW.HView, 0 ),0.2,f_far);
}

window_set_caption("Made With GameMaker - FPS: "+string(floor(fps)));

//DE_renderWorld();

texture_set_repeat(false);
	
var ww = surface_get_width(application_surface);
var hh = surface_get_height(application_surface);

shader_set_uniform_f(u_fogColorG,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
shader_set_uniform_f(u_fogMaxDistG,f_far*0.9);
shader_set_uniform_f(u_fogMinDistG,f_near);
		
shader_set_uniform_f(shader_get_uniform(shd_GLSSect,"u_res"),ww,hh);
		
var samp = shader_get_sampler_index(shd_GLSSect,"u_skySampler");
texture_set_stage(samp, surface_get_texture(skyhandler.skysurf));
		
shader_set_uniform_f(u_sectAtlasScale, tpageFlats.width, tpageFlats.height );
	
DE_renderBSPNode( mapGLNodes[| ds_list_size(mapGLNodes)-1 ] );

shader_reset();


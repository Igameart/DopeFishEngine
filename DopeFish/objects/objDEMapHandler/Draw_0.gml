/// @description Render Map

with DEcam{
	d3d_set_projection_ext(x,y,z+PLAYER_HEIGHT,x+cam_x,y+cam_y,z+PLAYER_HEIGHT+cam_z, 0,0,1, 80,__view_get( e__VW.WView, 0 )/__view_get( e__VW.HView, 0 ),0.2,f_far);
}

window_set_caption("FPS: "+string(fps_real));

DE_renderWorld();
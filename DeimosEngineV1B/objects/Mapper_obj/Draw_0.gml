/// @description Draw the Background & Do Projection

d3d_set_projection_ext(x,y,z+eyes,x+cam_x,y+cam_y,z+eyes+cam_z, 0,0,1, 65,__view_get( e__VW.WView, 0 )/__view_get( e__VW.HView, 0 ),0.2,f_far);

window_set_caption("FPS: "+string(fps_real));

DE_renderWorld();
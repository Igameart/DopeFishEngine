/// @description

var ww,hh;

ww = surface_get_width(application_surface);
hh = surface_get_height(application_surface);

var ss = ww / 320;

var diff = ( (200*1.2) - (hh / ss) )*.833333;

if !surface_exists(skysurf){
	skysurf = surface_create(ww,hh);
}else{
	ww = surface_get_width(skysurf);
	hh = surface_get_height(skysurf);
}

surface_set_target(skysurf);
draw_clear(c_gray);

if sprite_exists(wadGameInfo.skyTexture){

	shader_set(shd_equirectPano);

	var xfov,yfov;

	xfov = degtorad(80*(ww/hh))*0.77;
	yfov = degtorad(80);


	shader_set_uniform_f(u_camRot, -degtorad(DEcam.yaw), degtorad(DEcam.pitch),0);
	shader_set_uniform_f(u_fov, xfov,yfov);
	shader_set_uniform_f(u_iResolution, ww, hh );
	shader_set_uniform_f_array(u_skyUvs, skyUvs );
	shader_set_uniform_f(u_texRes, sprite_get_width( wadGameInfo.skyTexture ), sprite_get_height( wadGameInfo.skyTexture) );
	draw_sprite_stretched(wadGameInfo.skyTexture,0,0,0,ww,hh);

	shader_reset();
}

surface_reset_target();

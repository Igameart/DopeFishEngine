/// @description

skysurf = noone;

surfCam = camera_create();

u_camRot = shader_get_uniform(shd_equirectPano,"camRot");
u_iResolution = shader_get_uniform(shd_equirectPano,"iResolution");
u_fov = shader_get_uniform(shd_equirectPano,"fov");
u_texRes = shader_get_uniform(shd_equirectPano,"texRes");
u_skyUvs = shader_get_uniform(shd_equirectPano,"skyUvs");

skyUvs = sprite_get_uvs(wadGameInfo.skyTexture,0);

skyUvs = [skyUvs[2], skyUvs[3]];

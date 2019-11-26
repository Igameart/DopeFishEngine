/// @description  Draw billboards
var tex = surface_get_texture(sf_billboards);

var fw = texture_get_width(tex)/row_count*texture_get_texel_width(tex);
var fh = texture_get_height(tex)/row_count*texture_get_texel_height(tex);

shader_set(sha_billboards);

// Pass uniforms
var cur = shader_get_uniform(sha_billboards,"u_iCurrent");
shader_set_uniform_f(cur,current);

var fsize = shader_get_uniform(sha_billboards,"u_vFrameSize");
shader_set_uniform_f(fsize,fw,fh);

var no_frs = shader_get_uniform(sha_billboards,"u_fNoFrames");
shader_set_uniform_f(no_frs,no_frames);

var cpr = shader_get_uniform(sha_billboards,"u_iCountPerRow");
shader_set_uniform_f(cpr,row_count);

var cam_dir = shader_get_uniform(sha_billboards,"u_fCamDir");
shader_set_uniform_f(cam_dir,degtorad(angle+90));

// Draw buffer, turn off z-writing
d3d_transform_stack_push();
d3d_transform_set_translation(x,y,0);
d3d_set_zwriteenable(false);
vertex_submit(buffer,pr_trianglelist,tex);  // only single texture => no swaps required
d3d_set_zwriteenable(true);
d3d_transform_stack_pop();

shader_reset();


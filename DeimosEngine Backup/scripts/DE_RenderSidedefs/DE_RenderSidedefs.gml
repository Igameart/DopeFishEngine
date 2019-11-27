shader_set(shd_Sidedef);
shader_set_uniform_f(u_fogColorS,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
shader_set_uniform_f(u_fogMaxDistS,f_far*0.9);
shader_set_uniform_f(u_fogMinDistS,f_near);

var sides = mapSidedefs;
var lines = mapLinedefs;

for (j = 0; j<ds_list_size(sides); j++ ){
    
    var side = ds_list_find_value_fixed(sides,j);
    
    var s=ds_map_find_value(side,"sector");
    var b=ds_map_find_value(side,"bsect");
	
    s = ds_list_find_value(mapSectors,s);
    b = ds_list_find_value(mapSectors,b);
	
    var zadd = ds_map_find_value_fixed(s,"lift");
    
    shader_set_uniform_f(u_midBotOff,zadd);
    var crushing = ds_map_find_value(b,"crush");
    
    shader_set_uniform_f(u_lowBotOff,zadd);
    shader_set_uniform_f(u_upBotOff,crushing);
    
    zadd = ds_map_find_value_fixed(b,"lift");
    shader_set_uniform_f(u_lowTopOff,zadd);
        
    crushing = ds_map_find_value(s,"crush");
    shader_set_uniform_f(u_midTopOff,crushing);
    
    shader_set_uniform_f(u_upTopOff,crushing);
    
    
    var l = ds_map_find_value_fixed(side,"linedef");
    l = ds_list_find_value_fixed(lines,l);
    var flags = ds_map_find_value_fixed(l,"flags");
    
    var val=ds_map_find_value_fixed(flags,"peg_lower");
    if is_real(val)
    shader_set_uniform_f(u_LowPeg,val);
    
    val=ds_map_find_value_fixed(flags,"peg_upper");
    if is_real(val)
    shader_set_uniform_f(u_UpPeg,val);
    

    var vbuffer=ds_map_find_value_fixed(side,"vbuffer");
    var tex_l=ds_map_find_value_fixed(side,"tex_l");
    var tex_u=ds_map_find_value_fixed(side,"tex_u");
    var tex_m=ds_map_find_value_fixed(side,"tex_m");
    
    
    if tex_l!="-" or tex_u!="-" or tex_m!="-"{
        
        tex_l=ds_map_find_value(pload_tex,tex_l);
        tex_u=ds_map_find_value(pload_tex,tex_u);
        tex_m=ds_map_find_value(pload_tex,tex_m);
        
        if is_undefined(tex_m){
            tex_m=-1;
        }else{
            shader_set_uniform_f(u_TexHM,surface_get_height(tex_m));
        }
        
        if !is_undefined(tex_l){
            if surface_exists(tex_l){
                shader_set_uniform_f(u_TexHL,surface_get_height(tex_l));
                texture_set_stage(shd_ltex,surface_get_texture(tex_l));
            }
        }else texture_set_stage(shd_ltex,0);
        
        if !is_undefined(tex_u){
            if surface_exists(tex_u){
                shader_set_uniform_f(u_TexHU,surface_get_height(tex_u));
                texture_set_stage(shd_utex,surface_get_texture(tex_u));
            }
            
        }else texture_set_stage(shd_utex,0);
        
        vertex_submit(vbuffer,pr_trianglelist,surface_get_texture(tex_m));
    }

}

shader_reset();
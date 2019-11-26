/// @description wadLoader_preload_textures()

globalvar pload_tex;
pload_tex=ds_map_build();


var sides = ds_map_find_value_fixed(wad_levels,"sidedefs");

for (k=0;k<ds_list_size(sides);k++) {

    side = ds_list_find_value_fixed(sides,k);
    var t_l,t_l,t_m;
    t_l=ds_map_find_value_fixed(side,"tex_l");
    
    if t_l!="-" and is_undefined(ds_map_find_value(pload_tex,t_l)){
        if!is_undefined(ds_map_find_value(textures,t_l)){
            show_debug_message("NOTICE: Found Texture:"+t_l);
            var tt,t_w,t_h,t_ps;
            tt=ds_map_find_value_fixed(textures,t_l);
            t_w=ds_map_find_value_fixed(tt,"width");
            t_h=ds_map_find_value_fixed(tt,"height");
            t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            
            surf=surface_create(t_w,t_h);
            surface_set_target(surf)
                draw_clear_alpha(0,0);
                for(var p=0;p<ds_list_size(t_ps);p+=1){
                    var patch=ds_list_find_value(t_ps,p);
                    var ox=ds_map_find_value_fixed(patch,"ox");
                    var oy=ds_map_find_value_fixed(patch,"oy");
                    var pname=ds_map_find_value_fixed(patch,"patch");
                    
                    if !is_undefined(ds_map_find_value(pload_pat,pname)){
                        var patch=ds_map_find_value(pload_pat,pname);
                        draw_sprite_ext(patch,0,ox,oy,1,1,0,c_white,1);
                    }
                    
                }
                
            surface_reset_target();
            surface_save(surf,"TEX_"+t_l+".png");
            
            ds_map_replace(pload_tex,t_l,surf);
            
        }
    }
    
    t_u=ds_map_find_value_fixed(side,"tex_u");
    
    if t_u!="-" and is_undefined(ds_map_find_value(pload_tex,t_u)){
        if!is_undefined(ds_map_find_value(textures,t_u)){
            show_debug_message("NOTICE: Found Texture:"+t_u);
            var tt,t_w,t_h;
            tt=ds_map_find_value_fixed(textures,t_u);
            t_w=ds_map_find_value_fixed(tt,"width");
            t_h=ds_map_find_value_fixed(tt,"height");
            t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            
            surf=surface_create(t_w,t_h);
            surface_set_target(surf)
                draw_clear_alpha(0,0);
                for(var p=0;p<ds_list_size(t_ps);p+=1){
                    var patch=ds_list_find_value_fixed(t_ps,p);
                    var ox=ds_map_find_value_fixed(patch,"ox");
                    var oy=ds_map_find_value_fixed(patch,"oy");
                    var pname=ds_map_find_value_fixed(patch,"patch");
                    
                    if !is_undefined(ds_map_find_value(pload_pat,pname)){
                        var patch=ds_map_find_value(pload_pat,pname);
                        draw_sprite_ext(patch,0,ox,oy,1,1,0,c_white,1);
                    }
                    
                }
                
            surface_reset_target();
            surface_save(surf,"TEX_"+t_u+".png");
            
            ds_map_replace(pload_tex,t_u,surf);
            
        }
    }
    t_m=ds_map_find_value_fixed(side,"tex_m");
    
    if t_m!="-" and is_undefined(ds_map_find_value(pload_tex,t_m)){
        if!is_undefined(ds_map_find_value(textures,t_m)){
            //show_debug_message("************ NOTICE: Found Texture:"+t_m);
            var tt,t_w,t_h;
            tt=ds_map_find_value_fixed(textures,t_m);
            t_w=ds_map_find_value_fixed(tt,"width");
            t_h=ds_map_find_value_fixed(tt,"height");
            t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            
            surf=surface_create(t_w,t_h);
            surface_set_target(surf)
                draw_clear_alpha(0,0);
                
                for(var p=0;p<ds_list_size(t_ps);p+=1){
                    var patch=ds_list_find_value_fixed(t_ps,p);
                    var ox=ds_map_find_value_fixed(patch,"ox");
                    var oy=ds_map_find_value_fixed(patch,"oy");
                    var pname=ds_map_find_value_fixed(patch,"patch");
                    
                    if !is_undefined(ds_map_find_value(pload_pat,pname)){
                        var patch=ds_map_find_value(pload_pat,pname);
                        draw_sprite_ext(patch,0,ox,oy,1,1,0,c_white,1);
                    }
                    
                }
                
            surface_reset_target();
            surface_save(surf,"TEX_"+t_m+".png");
            
            ds_map_replace(pload_tex,t_m,surf);
            
        }
    }
    
}

/// @description wadLoader_preload_textures()

globalvar pload_pat;
pload_pat=ds_map_build();

var sides = mapSidedefs;

for (k=0;k<ds_list_size(sides);k++) {
    side = ds_list_find_value(sides,k);
    var t_l,t_l,t_m,t_u;
    t_l=ds_map_find_value_fixed(side,"tex_l");
    if t_l!="-"{
        if(ds_map_find_value_fixed(wadWallTextures,t_l)){
            //show_debug_message("NOTICE: Found Texture:"+t_l);
            var tt,t_w,t_h,t_ps;
            tt=ds_map_find_value_fixed(wadWallTextures,t_l);
            t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            for(var p=0;p<ds_list_size(t_ps);p+=1){
                var patch=ds_list_find_value_fixed(t_ps,p);
                var pname=ds_map_find_value_fixed(patch,"patch");
                if is_undefined(ds_map_find_value(pload_pat,pname)){
                    var patch=wadLoader_getPatch(pname);
                    ds_map_replace(pload_pat,pname,patch);
                    //sprite_save(patch,0,"PAT_"+pname+".png");
                }
            }
        }
    }
    
    t_u=ds_map_find_value_fixed(side,"tex_u");
    if t_u!="-"{
        if(ds_map_find_value_fixed(wadWallTextures,t_u)){
            //show_debug_message("NOTICE: Found Texture:"+t_u);
            var tt,t_w,t_h;
            tt=ds_map_find_value_fixed(wadWallTextures,t_u);
            t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            for(var p=0;p<ds_list_size(t_ps);p+=1){
                var patch=ds_list_find_value_fixed(t_ps,p);
                var pname=ds_map_find_value_fixed(patch,"patch");
                if is_undefined(ds_map_find_value(pload_pat,pname)){
                    var patch=wadLoader_getPatch(pname);
                    ds_map_replace(pload_pat,pname,patch);
                    //sprite_save(patch,0,"PAT_"+pname+".png");
                }
            }
        }
    }
    t_m=ds_map_find_value_fixed(side,"tex_m");
    if t_m!="-"{
        if(ds_map_find_value_fixed(wadWallTextures,t_m)){
            //show_debug_message("NOTICE: Found Texture:"+t_m);
            var tt,t_w,t_h;
            tt=ds_map_find_value_fixed(wadWallTextures,t_m);
            t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            for(var p=0;p<ds_list_size(t_ps);p+=1){
                var patch=ds_list_find_value_fixed(t_ps,p);
                var pname=ds_map_find_value_fixed(patch,"patch");
                if is_undefined(ds_map_find_value(pload_pat,pname)){
                    var patch=wadLoader_getPatch(pname);
                    ds_map_replace(pload_pat,pname,patch);
                    //sprite_save(patch,0,"PAT_"+pname+".png");
                }
            }
        }
    }
}
show_debug_message("NOTICE: Loaded All Patches In Level");

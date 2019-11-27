/*data=argument0;
tname=argument1;

var tc=0,tw=0,th=0,maxh=0,maxw=0;
data_textures=ds_map_find_value_fixed(data,"textures");


if(!ds_map_find_value_fixed(wadWallTextures,tname)){
    show_debug_message("WARNING: Missing or invalid Texture: "+tname);
    
    
    show_debug_message("NOTICE: Found Texture:"+tname);
    tt=ds_map_find_value_fixed(wadWallTextures,tname);
    t_width=ds_map_find_value_fixed(tt,"width");
    t_height=ds_map_find_value_fixed(tt,"height");
    
    var texture=ds_grid_build(t_width,t_height);
    ds_grid_clear(texture,-1);
    var t_patches=ds_map_find_value_fixed(tt,"patchc");
    var patchdat=ds_map_find_value_fixed(tt,"wadPatches");
        show_debug_message("NOTICE: Found "+string(ds_list_size(patchdat))+" Patches in texture "+tname);
    
    for(var p=0; p<t_patches;p+=1){
        var pdat=ds_list_find_value_fixed(patchdat,p);
        var pname=ds_map_find_value_fixed(pdat,"patch");
        show_debug_message("NOTICE: Found Patch:"+(pname));
        if(!pdat){
            continue;
        }
        
        var patch=ds_map_find_value_fixed(wadPatches,pname);
        
        patch_width=ds_map_find_value_fixed(patch,"width");
        patch_height=ds_map_find_value_fixed(patch,"height");
        
        var w=0,h=0;
        var ofy=ds_map_find_value_fixed(pdat,"oy");
        var ofx=ds_map_find_value_fixed(pdat,"ox");
        
        //if(ofy<0)ofy=0;
        //if(ofx<0)ofx=0;
        
        for(var oy=ofy;oy<patch_height+ofy;oy+=1){
            if(oy>=t_height)
                break;
            w=0;
            for(var ox=ofx;ox<patch_width+ofx;ox+=1){
                if(ox>=t_width)
                break;
                dat=ds_grid_get(ds_map_find_value_fixed(patch,"data"),w,h);
                w+=1;
                if dat>=0
                    ds_grid_set(texture,ox,oy,dat);
            }
            h+=1;
        }
    }
    
    tex=wadLoader_buildPatch(texture,t_width,t_height);
    
    //ds_grid_destroy(texture);
    
    ds_list_replace(data_textures,t,tex);

}else return 0;

//he3d.log("DEBUG","Total Unique Textures",tc+" ["+tw+"x"+th+"]");
//he3d.log("DEBUG","Max Tex Size",maxw+"x"+maxh);

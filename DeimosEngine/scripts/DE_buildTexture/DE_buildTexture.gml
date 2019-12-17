var t_name = argument[0];

var tdat = ds_map_find_value(pload_tex,t_name);

if tdat == undefined{
	if !is_undefined(ds_map_find_value(textures,t_name)){

				
	    var tt,t_w,t_h,t_ps;
	    tt=ds_map_find_value_fixed(textures,t_name);
	    t_w=ds_map_find_value_fixed(tt,"width");
	    t_h=ds_map_find_value_fixed(tt,"height");
	    t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            
	    var surf=surface_create(t_w,t_h);
	    surface_set_target(surf)
	        draw_clear_alpha(0,0);
			
	        for(var p=0;p<ds_list_size(t_ps);p++){
	            var patch=ds_list_find_value(t_ps,p);
	            var ox=ds_map_find_value_fixed(patch,"ox");
	            var oy=ds_map_find_value_fixed(patch,"oy");
	            var pname=ds_map_find_value_fixed(patch,"patch");
				                    
				var spr_ = ds_map_find_value(pload_pat,pname);
					
	            if !is_undefined(spr_){
					var pdat = wadPatches[?pname];
					var oX,oY;
					oX = pdat[?"o_left"];
					oY = pdat[?"o_top"];
					
					trace("Patch data for " + pname,ox+oX,oy+oY);
					ds_map_print(pdat);
					
	                draw_sprite_ext(spr_,0,ox+oX,oy+oY,1,1,0,c_white,1);
						
	            }
                    
	        }
                
	    surface_reset_target();
			
		var spr = sprite_create_from_surface(surf,0,0,t_w,t_h,false,false,0,0);
				
		var sprDat = sprite_get_uvs(spr,0);
		var tdat = [spr,sprDat[TexUVS.Left],sprDat[TexUVS.Top]];
				
	    ds_map_replace(pload_tex,t_name,tdat);
		surface_free(surf);
            
	}
}
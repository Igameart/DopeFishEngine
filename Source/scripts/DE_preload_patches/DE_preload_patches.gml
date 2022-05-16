/// @description DE_preload_textures()
function DE_preloadPatches() {

	var sides = wadlevel.sidedefs;

	for (k=0;k<ds_list_size(sides);k++) {
	    side = ds_list_find_value(sides,k);
	    var t_l,t_u,t_m;
	    t_l=(side.lowtex);
	    if t_l!="-"{
		
	        if(ds_map_find_value(textures,t_l)!=undefined){
				
	            var tt,t_w,t_h,t_ps;
	            
				tt=ds_map_find_value(textures,t_l);
	            t_ps=(tt.patches);
				
	            for(var p=0;p<ds_list_size(t_ps);p+=1){
	                var patch=ds_list_find_value(t_ps,p);
	                var pname=(patch.patch);
				
	                if is_undefined(ds_map_find_value(pload_pat,pname)){
					
	                    var patch=DE_getPatch(pname);
	                    ds_map_replace(pload_pat,pname,patch);
	                }
	            }
	        }
			if DE_textureIsSwitch(t_l){
				trace("Found a Switch Texture. Loading off state patches",t_l);
				var t_l_off = wadSwitchTextures[?t_l];
			
				if(ds_map_find_value_fixed(textures,t_l_off)){
		            var tt,t_w,t_h,t_ps;
		            tt=ds_map_find_value_fixed(textures,t_l_off);
				
		            t_ps=(tt.patches);
		            for(var p=0;p<ds_list_size(t_ps);p+=1){
		                var patch=ds_list_find_value_fixed(t_ps,p);
		                var pname=(patch.patch);
		                if is_undefined(ds_map_find_value(pload_pat,pname)){
		                    var patch=DE_getPatch(pname);
		                    ds_map_replace(pload_pat,pname,patch);
		                }
		            }
		        }
			
			}
	    }
    
	    t_u=(side.uptex);
	    if t_u!="-"{
	        if(ds_map_find_value(textures,t_u)!=undefined){
			
	            var tt,t_w,t_h;
	            tt=ds_map_find_value(textures,t_u);
	            t_ps=(tt.patches);
	            for(var p=0;p<ds_list_size(t_ps);p+=1){
	                var patch=ds_list_find_value_fixed(t_ps,p);
	                var pname=(patch.patch);
	                if is_undefined(ds_map_find_value(pload_pat,pname)){
	                    var patch=DE_getPatch(pname);
	                    ds_map_replace(pload_pat,pname,patch);
					
	                }
	            }
	        }
			if DE_textureIsSwitch(t_u){
				trace("Found a Switch Texture. Loading off state patches",t_u);
				var t_u_off = wadSwitchTextures[?t_u];
			
				if(ds_map_find_value_fixed(textures,t_u_off)){
		            var tt,t_w,t_h,t_ps;
		            tt=ds_map_find_value_fixed(textures,t_u_off);
				
		            t_ps=(tt.patches);
		            for(var p=0;p<ds_list_size(t_ps);p+=1){
		                var patch=ds_list_find_value_fixed(t_ps,p);
		                var pname=(patch.patch);
		                if is_undefined(ds_map_find_value(pload_pat,pname)){
		                    var patch=DE_getPatch(pname);
		                    ds_map_replace(pload_pat,pname,patch);
		                }
		            }
		        }
			
			}
	    }
	    t_m=(side.midtex);
	    if t_m!="-"{
	        if(ds_map_find_value(textures,t_m)!=undefined){
	            var tt,t_w,t_h;
	            tt=ds_map_find_value(textures,t_m);
	            t_ps=(tt.patches);
	            for(var p=0;p<ds_list_size(t_ps);p+=1){
	                var patch=ds_list_find_value_fixed(t_ps,p);
	                var pname=(patch.patch);
	                if is_undefined(ds_map_find_value(pload_pat,pname)){
	                    var patch=DE_getPatch(pname);
	                    ds_map_replace(pload_pat,pname,patch);
	                }
	            }
	        }
			if DE_textureIsSwitch(t_m){
				trace("Found a Switch Texture. Loading off state patches",t_m);
				var t_m_off = wadSwitchTextures[?t_m];
			
				if(ds_map_find_value_fixed(textures,t_m_off)){
		            var tt,t_w,t_h,t_ps;
		            tt=ds_map_find_value_fixed(textures,t_m_off);
				
		            t_ps=(tt.patches);
		            for(var p=0;p<ds_list_size(t_ps);p+=1){
		                var patch=ds_list_find_value_fixed(t_ps,p);
		                var pname=(patch.patch);
		                if is_undefined(ds_map_find_value(pload_pat,pname)){
		                    var patch=DE_getPatch(pname);
		                    ds_map_replace(pload_pat,pname,patch);
		                }
		            }
		        }
			
			}
	    }
	}
	trace("NOTICE: Loaded All Patches In Level");

}

function DE_loadPatch(pname) {
				
	if is_undefined(ds_map_find_value(pload_pat,pname)){
					
	    var patch=DE_getPatch(pname);
		
	    ds_map_replace(pload_pat,pname,patch);
		
		trace("NOTICE: Load Patch",pname);
		
		return patch;
		
	}
	            

}

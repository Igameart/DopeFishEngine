/// @description DE_preload_textures()

ds_map_clear(pload_tex);

var sides = ds_map_find_value_fixed(wad_levels,"sidedefs");

var surf,spr,sprDat,side;

for (var k=0;k<ds_list_size(sides);k++) {

    side = ds_list_find_value_fixed(sides,k);
	
    var t_l,t_l,t_m;
	
    t_l=ds_map_find_value(side,"tex_l");
    
	var tdat = ds_map_find_value(pload_tex,t_l);
	
    if t_l!="-"{
		if tdat == undefined{
	        if !is_undefined(ds_map_find_value(textures,t_l)){
				
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
                    
						var spr_ = ds_map_find_value(pload_pat,pname);
					
	                    if !is_undefined(spr_){
							var pdat = wadPatches[?pname];
							var oX,oY;
							oX = pdat[?"o_left"];
							oY = pdat[?"o_top"];
	                        draw_sprite_ext(spr_,0,ox+oX,oy+oY,1,1,0,c_white,1);
						
	                    }
                    
	                }
                
	            surface_reset_target();
			
				spr = sprite_create_from_surface(surf,0,0,t_w,t_h,false,false,0,0);
				
				sprDat = sprite_get_uvs(spr,0);
				tdat = [spr,sprDat[TexUVS.Left],sprDat[TexUVS.Top]];
				trace(tdat);
				
	            ds_map_replace(pload_tex,t_l,tdat);
				surface_free(surf);
            
	        }
	    }
	}
    
    var t_u=ds_map_find_value(side,"tex_u");
    
	var tdat = ds_map_find_value(pload_tex,t_u);
	
    if t_u!="-"{
		if tdat == undefined{
			
			tdat = [];
			
	        if !is_undefined(ds_map_find_value(textures,t_u)){
				
	            show_debug_message("FETCHING Texture:"+t_u);
	            var tt,t_w,t_h;
	            tt=ds_map_find_value_fixed(textures,t_u);
	            t_w=ds_map_find_value_fixed(tt,"width");
	            t_h=ds_map_find_value_fixed(tt,"height");
	            t_ps=ds_map_find_value_fixed(tt,"wadPatches");
            
	            surf=surface_create(t_w,t_h);	//Create the canvas on which to render the texture
				
	            surface_set_target(surf)
	                draw_clear_alpha(0,0);
	                for(var p=0;p<ds_list_size(t_ps);p+=1){
	                    var patch=ds_list_find_value_fixed(t_ps,p);
	                    var ox=ds_map_find_value_fixed(patch,"ox");
	                    var oy=ds_map_find_value_fixed(patch,"oy");
	                    var pname=ds_map_find_value_fixed(patch,"patch");
                    
						var spr_ = ds_map_find_value(pload_pat,pname);
					
	                    if !is_undefined(spr_){
							var pdat = wadPatches[?pname];
							var oX,oY;
							oX = pdat[?"o_left"];
							oY = pdat[?"o_top"];
	                        draw_sprite_ext(spr_,0,ox+oX,oy+oY,1,1,0,c_white,1);
						
	                    }
                    
	                }
                
	            surface_reset_target();
			
				spr = sprite_create_from_surface(surf,0,0,t_w,t_h,false,false,0,0);
				sprDat = sprite_get_uvs(spr,0);
				
				tdat = [spr,sprDat[TexUVS.Left],sprDat[TexUVS.Top]];
				trace(tdat);
				
	            ds_map_replace(pload_tex,t_u,tdat);
				surface_free(surf);
            
	        }
	    }
	}
    t_m=ds_map_find_value(side,"tex_m");
    
	var tdat = ds_map_find_value(pload_tex,t_m);
	
	/*if tdat!=undefined{
		if !surface_exists(tdat)
			tdat = undefined;
	}*/
	
    if t_m!="-"{
		if tdat == undefined{
	        if!is_undefined(ds_map_find_value(textures,t_m)){
	            show_debug_message("NOTICE: Found Texture:"+t_m);
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
                    
						var spr_ = ds_map_find_value(pload_pat,pname);
					
	                    if !is_undefined(spr_){
							var pdat = wadPatches[?pname];
							var oX,oY;
							oX = pdat[?"o_left"];
							oY = pdat[?"o_top"];
	                        draw_sprite_ext(spr_,0,ox+oX,oy+oY,1,1,0,c_white,1);
						
	                    }
                    
	                }
                
	            surface_reset_target();
			
				spr = sprite_create_from_surface(surf,0,0,t_w,t_h,false,false,0,0);
				sprDat = sprite_get_uvs(spr,0);
				
				tdat = [spr,sprDat[TexUVS.Left],sprDat[TexUVS.Top]];
				trace(tdat);
				
	            ds_map_replace(pload_tex,t_m,tdat);
				surface_free(surf);
            
	        }
	    }
	}
    
}

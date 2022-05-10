function DE_buildTexture() {
	var t_name = argument[0];

	var tdat = ds_map_find_value(pload_tex,t_name);

	if tdat == undefined || tdat == -1{
		if !is_undefined(ds_map_find_value(textures,t_name)){

				
		    var tt,t_w,t_h,t_ps,t_pc;
		    tt	= ds_map_find_value_fixed(textures,t_name);
		    t_w	= tt.width;
		    t_h	= tt.height;
			t_pc= tt.patchcount;
		    t_ps= tt.patches;
			
			trace( "NOTICE: Building Texture:", t_name, tt );
            
		    var surf=surface_create(t_w,t_h);
		    surface_set_target(surf)
		        draw_clear_alpha(0,0);
			
		        for(var p=0; p<t_pc; p++){
					
		            var patch=ds_list_find_value(t_ps,p);
		            var ox	= patch.originx;
		            var oy	= patch.originy;
		            var pname= patch.patch;

					var spr_ = ds_map_find_value(pload_pat,pname);
					
					if (spr_!=undefined)
		            if sprite_exists(spr_){
						
						var pdat = wadPatches[? pname ];
						var oX,oY;
						oX = pdat.leftoff;
						oY = pdat.topoff;
						
						trace("Applying Patch", patch, pdat, ox+oX,oy+oY );
					
		                draw_sprite_ext(spr_,0,ox+oX,oy+oY,1,1,0,c_white,1);
						
		            }else trace("Preloaded Patch Is Missing");
                    
		        }
                
		    surface_reset_target();
			
			//var spr = sprite_create_from_surface(surf,0,0,t_w,t_h,false,false,0,0);
			
			var spr = tpageTextures.insertSurface(surf);
			//trace("Added Texture To Atlas", t_name);
		
			wadCompedTextures[? t_name] = sprite_get_texture(spr,0);
				
			//var sprDat = sprite_get_uvs(spr,0);
			//var tdat = [spr,sprDat[TexUVS.Left],sprDat[TexUVS.Top]];
				
		    pload_tex[? t_name] = spr;
			//surface_free(surf);
            
		}
	}


}

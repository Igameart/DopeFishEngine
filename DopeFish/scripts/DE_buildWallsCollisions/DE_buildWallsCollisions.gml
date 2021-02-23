/// @description DE_buildWallsCollisions(GLSSECT,sector,buffer,color);
/// @param GLSSECT
/// @param sector
/// @param buffer
/// @param color
function DE_buildWallsCollisions() {

	var verts = mapVertexes;//ds_map_find_value_fixed(wadlevel,"vertexes");
	var lines = mapLinedefs;//ds_map_find_value_fixed(wadlevel,"linedefs");
	var sides = mapSidedefs;//ds_map_find_value_fixed(wadlevel,"sidedefs");
	var sects = mapSectors;//ds_map_find_value_fixed(wadlevel,"sectors");

	for (var k=0; k<ds_list_size(lines);k++) {

	    var linedef = ds_list_find_value_fixed(lines,k);
	
		//ds_map_print(linedef);
    
	    var flags=ds_map_find_value_fixed(linedef,"flags");
	    var u_peg=ds_map_find_value_fixed(flags,"pegupper");
	    var l_peg=ds_map_find_value_fixed(flags,"peglower");
    
	    var dub  =ds_map_find_value_fixed(flags,"twosided");
	    var sld  =ds_map_find_value_fixed(flags,"block_all");
    
	    var left,right;
	    left=ds_map_find_value_fixed(linedef,"left");
	    right=ds_map_find_value_fixed(linedef,"right");
    
	
		//ds_map_print(flags);
	
		//Do Colllision
	    if sld or !dub{
		
			//trace("Creating collision object");
    
	        var startv=ds_map_find_value_fixed(linedef,"start");
	        var vert=ds_list_find_value_fixed(verts,startv);
			//ds_map_print(vert);
		
	        var sx = ds_map_find_value_fixed(vert,"x");
	        var sy = ds_map_find_value_fixed(vert,"y");
        
	        startv=ds_map_find_value_fixed(linedef,"end");
	        vert=ds_list_find_value_fixed(verts,startv);
			//ds_map_print(vert);
		
	        var ex = ds_map_find_value_fixed(vert,"x");
	        var ey = ds_map_find_value_fixed(vert,"y");
        
	        var cLine=instance_create_depth(sx,sy,0,sliding_collision_obj);
	        cLine.x2=ex;
	        cLine.y2=ey;
	        with cLine event_user(0);
    
	    }
	
    
	    //Now lets do front and back sides if there are any
	    if left!=-1 or right!=-1{
	        //show_debug_message("building sides: "+string(left)+","+string(right));
        
	        var front,back;
        
	        if left!=-1{
	            front=left;
	            back=right;
	            var startv=ds_map_find_value_fixed(linedef,"end");
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            sx = ds_map_find_value_fixed(vert,"x");
	            sy = ds_map_find_value_fixed(vert,"y");
            
	            startv=ds_map_find_value_fixed(linedef,"start");
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            ex = ds_map_find_value_fixed(vert,"x");
	            ey = ds_map_find_value_fixed(vert,"y");
            
	            //show_debug_message("building Front: "+string(front));
            
	            var buffer = vertex_create_buffer();
	            vertex_begin(buffer,DE_vFormat);
            
	            var side=ds_list_find_value_fixed(sides,front);
            
	            var bside=ds_list_find_value_fixed(sides,back);
            
	            var sect=ds_map_find_value_fixed(side,"sector");
            
	            ds_map_replace(side,"back",back);
            
	            sect = ds_list_find_value_fixed(sects,sect);
				var _ceiling = ds_map_find_value_fixed(sect,"ceiling");
			
	            var bsect=ds_map_find_value_fixed(bside,"sector");
	            bsect = ds_list_find_value_fixed(sects,bsect);
	            ds_map_replace(side,"linedef",k);
	            ds_map_replace(bside,"linedef",k);
            
	            var us=ds_map_find_value(side,"X_");
	            var ys=ds_map_find_value(side,"Y_");
			
	            var tcd,tc;
	            tc=0;
	            tcd[0]="-";
	            tcd[1]="-";
	            tcd[2]="-";
             
	            if (ds_map_find_value_fixed(side,"tex_l")!="-"){
	                tcd[0]=ds_map_find_value_fixed(side,"tex_l");
					//trace("Lower Texture",tcd[0]);
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_u")!="-"){
	                tcd[1]=ds_map_find_value_fixed(side,"tex_u");
					//trace("Top Texture",tcd[1]);
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_m")!="-"){
	                tcd[2]=ds_map_find_value_fixed(side,"tex_m");
					//trace("Middle Texture",tcd[2]);
	                tc++;
	            }
			
	            if tcd[0]!="-" or tcd[1]!="-" and !sld{
            
	                var bot, top;
	                bot = ds_map_find_value_fixed(sect,"floor");
	                top = ds_map_find_value_fixed(sect,"ceiling");
                
	                if back!=-1{
	                    bot = ds_map_find_value_fixed(bsect,"floor");
	                    top = ds_map_find_value_fixed(bsect,"ceiling");
	                }
                
	                var cLine=instance_create(sx,sy,passable_collision_obj);
	                cLine.x2=ex;
	                cLine.y2=ey;
	                cLine.bot=bot;
	                cLine.top=top;
	                with cLine event_user(0);
	            }
	        }
        
        
	        if right!=-1{
	            var u_add=0;
	            front=right;
	            back=left;
	            var startv=ds_map_find_value_fixed(linedef,"start");
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            sx = ds_map_find_value_fixed(vert,"x");
	            sy = ds_map_find_value_fixed(vert,"y");
            
	            startv=ds_map_find_value_fixed(linedef,"end");
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            ex = ds_map_find_value_fixed(vert,"x");
	            ey = ds_map_find_value_fixed(vert,"y");
            
	            //show_debug_message("building Back: "+string(front));
            
	            var buffer = vertex_create_buffer();
	            vertex_begin(buffer,DE_vFormat);
            
	            var side=ds_list_find_value_fixed(sides,front);
            
	            var bside=ds_list_find_value_fixed(sides,back);
            
	            var sect=ds_map_find_value_fixed(side,"sector");
            
	            ds_map_replace(side,"back",back);
            
	            //show_debug_message("Front Sector: "+string(sect));
            
	            sect = ds_list_find_value_fixed(sects,sect);
	            var bsect=ds_map_find_value_fixed(bside,"sector");
	            ds_map_replace(side,"bsect",bsect);
	            ds_map_replace(linedef,"bsect",bsect);
	            bsect = ds_list_find_value_fixed(sects,bsect);
			
				var _ceiling = ds_map_find_value_fixed(sect,"ceiling");
				//var _floor = ds_map_find_value_fixed(sect,"floor");
				//var sHeight = ( _ceiling - _floor );
            
	            var us=ds_map_find_value(side,"X_");
	            var ys=ds_map_find_value(side,"Y_");
            
	            var tcd,tc;
	            tc=0;
	            tcd[0]="-";
	            tcd[1]="-";
	            tcd[2]="-";
             
	            if (ds_map_find_value_fixed(side,"tex_l")!="-"){
	                tcd[0]=ds_map_find_value_fixed(side,"tex_l");
					//trace("Lower Texture",tcd[0]);
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_u")!="-"){
	                tcd[1]=ds_map_find_value_fixed(side,"tex_u");
					//trace("Top Texture",tcd[1]);
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_m")!="-"){
	                tcd[2]=ds_map_find_value_fixed(side,"tex_m");
					//trace("Middle Texture",tcd[2]);
	                tc++;
	            }
            
				//Create collisions
	            if tcd[0]!="-" or tcd[1]!="-" and !sld{
            
	                var bot, top;
	                bot = ds_map_find_value_fixed(sect,"floor");
	                top = ds_map_find_value_fixed(sect,"ceiling");
                
	                if back!=-1{
	                    bot = ds_map_find_value_fixed(bsect,"floor");
	                    top = ds_map_find_value_fixed(bsect,"ceiling");
	                }
                
	                var cLine=instance_create(sx,sy,passable_collision_obj);
	                cLine.x2=ex;
	                cLine.y2=ey;
	                cLine.bot=bot;
	                cLine.top=top;
	                with cLine event_user(0);
                
	            }
	        }
	    }
	}




}

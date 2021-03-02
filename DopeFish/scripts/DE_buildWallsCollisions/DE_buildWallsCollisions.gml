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
    
	    var flags	= linedef.flags;
	    var u_peg	= flags.pegupper;
	    var l_peg	= flags.peglower;
    
	    var dub	= flags.twosided;
	    var sld	= flags.blockall;
    
	    var left,right;
	    left	= linedef.left;
	    right	= linedef.right;
    
	
		//ds_map_print(flags);
	
		//Do Colllision
	    if sld or !dub{
		
			//trace("Creating collision object");
    
	        var startv=linedef.startv;
	        var vert=ds_list_find_value_fixed(verts,startv);
			//ds_map_print(vert);
		
	        var sx = vert.x;
	        var sy = vert.y;
        
	        startv=linedef.endv;
	        vert=ds_list_find_value_fixed(verts,startv);
			//ds_map_print(vert);
		
	        var ex = vert.x;
	        var ey = vert.y;
        
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
	            var startv=linedef.endv;
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            sx = vert.x;
	            sy = vert.y;
            
	            startv=linedef.startv;
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            ex = vert.x;
	            ey = vert.y;
            
	            //show_debug_message("building Front: "+string(front));
            
	            var buffer = vertex_create_buffer();
	            vertex_begin(buffer,DE_vFormat);
            
	            var side=ds_list_find_value(sides,front);
            
	            var bside=ds_list_find_value(sides,back);
            
	            var sect=side.sector;
            
	            side.right		= back;
				side.linedef	= k;
            
	            sect = ds_list_find_value_fixed(sects,sect);
				var _ceiling = sect.ceilingz;
			
				if (back!=-1){
		            var backsector=bside.sector;
		            backsector = ds_list_find_value_fixed(sects,backsector);
		            bside.linedef	= k;
				}
            
	            var us=side.xoff;
	            var ys=side.yoff;
			
	            var tcd,tc;
	            tc=0;
	            tcd[0]=side.lowtex;
	            tcd[1]=side.uptex;
	            tcd[2]=side.midtex;
             
	            if ( tcd[0]!="-" || tcd[1]!="-" || tcd[2]!="-"){
	                //tcd[0]=ds_map_find_value_fixed(side,"tex_l");
					//trace("Lower Texture",tcd[0]);
	                tc++;
	            }
            
	            /*if (ds_map_find_value_fixed(side,"tex_u")!="-"){
	                //tcd[1]=ds_map_find_value_fixed(side,"tex_u");
					//trace("Top Texture",tcd[1]);
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_m")!="-"){
	                //tcd[2]=ds_map_find_value_fixed(side,"tex_m");
					//trace("Middle Texture",tcd[2]);
	                tc++;
	            }*/
			
	            if tcd[0]!="-" or tcd[1]!="-" and !sld{
            
	                var bot, top;
	                bot = sect.floorz;
	                top = sect.ceilingz;
                
	                if back!=-1{
	                    bot = backsector.floorz;
	                    top = backsector.ceilingz;
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
	            var startv=linedef.startv;
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            sx = vert.x;
	            sy = vert.y;
            
	            startv=linedef.endv;
                
	            vert=ds_list_find_value_fixed(verts,startv);
	            ex = vert.x;
	            ey = vert.y;
            
	            //show_debug_message("building Back: "+string(front));
            
	            var buffer = vertex_create_buffer();
	            vertex_begin(buffer,DE_vFormat);
            
	            var side=ds_list_find_value_fixed(sides,front);
                        
	            var sect=side.sector;
            
	            side.right = back;
            
	            sect = ds_list_find_value_fixed(sects,sect);
				
				if (back!=-1){
					var bside=ds_list_find_value_fixed(sides,back);
		            var backsector=bside.sector;
		            side.backsector = backsector;
		            linedef.backsector = backsector;
		            backsector = ds_list_find_value(sects,backsector);
				}
			
				var _ceiling = sect.ceilingz;
				//var _floor = ds_map_find_value_fixed(sect,"floor");
				//var sHeight = ( _ceiling - _floor );
            
	            var us= side.xoff;
	            var ys= side.yoff;
            
	            var tcd,tc;
	            tc=0;
	            tcd[0]=side.lowtex;
	            tcd[1]=side.uptex;
	            tcd[2]=side.midtex;
             
	            if ( tcd[0]!="-" || tcd[1]!="-" || tcd[2]!="-"){
	                //tcd[0]=ds_map_find_value_fixed(side,"tex_l");
					//trace("Lower Texture",tcd[0]);
	                tc++;
	            }
            
	            /*if (ds_map_find_value_fixed(side,"tex_u")!="-"){
	                tcd[1]=ds_map_find_value_fixed(side,"tex_u");
					//trace("Top Texture",tcd[1]);
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_m")!="-"){
	                tcd[2]=ds_map_find_value_fixed(side,"tex_m");
					//trace("Middle Texture",tcd[2]);
	                tc++;
	            }*/
            
				//Create collisions
	            if tcd[0]!="-" or tcd[1]!="-" and !sld{
            
	                var bot, top;
	                bot = sect.floorz;
	                top = sect.ceilingz;
                
	                if back!=-1{
	                    bot = backsector.floorz;
	                    top = backsector.ceilingz;
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

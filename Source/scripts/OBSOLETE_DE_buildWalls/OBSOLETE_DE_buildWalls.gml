/// @description DE_buildWalls(GLSSECT,sector,buffer,color);
/// @param GLSSECT
/// @param sector
/// @param buffer
/// @param color
function DE_buildWalls() {

	var verts = mapVertexes;//ds_map_find_value_fixed(wadlevel,"vertexes");
	var lines = mapLinedefs;//ds_map_find_value_fixed(wadlevel,"linedefs");
	var sides = mapSidedefs;//ds_map_find_value_fixed(wadlevel,"sidedefs");
	var sects = mapSectors;//ds_map_find_value_fixed(wadlevel,"sectors");

	for (var k=0;k<ds_list_size(lines);k++) {

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
        
	        var cLine=instance_create_depth(sx,sy,0,objDESlideCollider);
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
			
	            var backsector=ds_map_find_value_fixed(bside,"sector");
	            //ds_map_replace(side,"backsector",backsector);
	            //ds_map_replace(linedef,"backsector",backsector);
	            backsector = ds_list_find_value_fixed(sects,backsector);
	            ds_map_replace(side,"linedef",k);
	            ds_map_replace(bside,"linedef",k);
            
	            var us=ds_map_find_value(side,"X_");
	            var ys=ds_map_find_value(side,"Y_");
            
	            var colval = ds_map_find_value_fixed(sect,"lightlevel");
			
				var ang = (point_direction(sx,sy,ex,ey)*2+90)//*2;
				var fCon = dsin(ang)*16;
	            var col2=make_colour_hsv(255,0,colval+fCon);
            
	            var tcd,tc;
	            tc=0;
	            tcd[0]="-";
	            tcd[1]="-";
	            tcd[2]="-";
            
	            if (ds_map_find_value_fixed(side,"tex_l")!="-"){
	                tcd[0]=ds_map_find_value_fixed(side,"tex_l");
	                //show_debug_message("Lower texture: "+string(tcd[0]));
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_u")!="-"){
	                tcd[1]=ds_map_find_value_fixed(side,"tex_u");
	                //show_debug_message("Upper texture: "+string(tcd[1]));
	                tc++;
	            }
            
	            if (ds_map_find_value_fixed(side,"tex_m")!="-"){
	                tcd[2]=ds_map_find_value_fixed(side,"tex_m");
	                //show_debug_message("Middle texture: "+string(tcd[2]));
	                tc++;
	            }
            
	            if tcd[0]!="-" or tcd[1]!="-" and !sld{
            
	                var bot, top;
	                bot = ds_map_find_value_fixed(sect,"floor");
	                top = ds_map_find_value_fixed(sect,"ceiling");
                
	                if back!=-1{
	                    bot = ds_map_find_value_fixed(backsector,"floor");
	                    top = ds_map_find_value_fixed(backsector,"ceiling");
	                }
                
	                var cLine=instance_create(sx,sy,objDEPassableCollider);
	                cLine.x2=ex;
	                cLine.y2=ey;
	                cLine.bot=bot;
	                cLine.top=top;
	                with cLine event_user(0);
                
	            }
            
	            //show_debug_message("Total Sections: "+string(tc));
            
	            // No Texture, don't bother building
	            var vv=0;
	            if(tc>0)
	            {//We have some walls to render.
	                var bot = ds_map_find_value_fixed(sect,"floor");
	                var top = ds_map_find_value_fixed(sect,"ceiling");
	                var sheight=abs(top-bot);
	                //Let's do the bottom section of the wall first just because
	                if tcd[0]!="-" and back!=-1{
	                    //show_debug_message("Lower wall:"+tcd[0]);
	                    var bot, top;
                    
	                    if back!=-1
	                        bot = ds_map_find_value_fixed(sect,"floor");
	                    else
	                        bot = ds_map_find_value_fixed(backsector,"ceiling");
                    
	                    top = ds_map_find_value_fixed(backsector,"floor");
                    
	                    //if top<=bot{
	                    //    bot=top;
	                    //}
                    
	                    var tt,t_w,t_h;
	                    tt=ds_map_find_value_fixed(textures,tcd[0]);
	                    t_w=ds_map_find_value_fixed(tt,"width");
	                    t_h=ds_map_find_value_fixed(tt,"height");
                    
	                    var height=abs(top-bot)/t_h;
					
						v0 = 0;
					
						repeat abs(ys){
							v0 += sign(ys);
						}
										
						v0 = v0/t_h + (abs(_ceiling - top) / t_h) * l_peg;
					
	                    v1=v0+height;
					
						u0 = 0;
					
						repeat abs(us){
							u0 += sign(us);
						}
					
						u0 = u0/t_w;
	                    u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
                    
	                    DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,0,0,0);
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,0,0,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,0,0,0);
                    
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,0,0,1);
	                    DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,0,0,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,0,0,0);
	                    vv+=2;
	                }
                
	                if tcd[1]!="-" and back!=-1{
	                    //show_debug_message("Upper wall:"+tcd[1]);
						var _s,_b;
						_s = ds_map_find_value_fixed(sect,"tex_c");
						_b = ds_map_find_value_fixed(backsector,"tex_c");
	                    if not (_s="F_SKY1" and _s!="F_SKY" and _s!="F_SKY001" and _b="F_SKY1" and _b!="F_SKY" and _b!="F_SKY001"){
                        
	                        if ds_map_find_value_fixed(bside,"tex_u")=="-"{
	                            var bot, top;
	                            top = ds_map_find_value_fixed(sect,"ceiling");
	                            bot = ds_map_find_value_fixed(backsector,"ceiling");
	                            var height=abs(top-bot)/t_h;
                                    
	                            var tt,t_w,t_h;
	                            tt=ds_map_find_value_fixed(textures,tcd[1]);
	                            t_w=ds_map_find_value_fixed(tt,"width");
	                            t_h=ds_map_find_value_fixed(tt,"height");
                            
	                            //v0 = ys/t_h;
						
								//v0 += height*!u_peg;
							
		                        v0 = 0;
					
								repeat abs(ys){
									v0 += sign(ys);
								}
					
								v0 = v0/t_h;
						
								v0 -= (abs(_ceiling - bot) / t_h) * !u_peg;
							
	                            v1=v0+height;
					
								u0 = 0;
					
								repeat abs(us){
									u0 += sign(us);
								}
					
								u0 = u0/t_w;
							
	                            u1=( u0+point_distance(sx,sy,ex,ey)/t_w);
                                                                
	                            DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,1,0,0);
	                            DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,1,0,1);
	                            DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,1,0,0);
                            
	                            DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,1,0,1);
	                            DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,1,0,1);
	                            DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,1,0,0);
	                            vv+=2;
	                        }
	                    }
	                }
                
	                if tcd[2]!="-"{
	                    show_debug_message("building middle wall Left:"+tcd[2]);
	                    var bot, top, bbot;
                        
	                    bot = ds_map_find_value_fixed(sect,"floor");
	                    top = ds_map_find_value_fixed(sect,"ceiling");
						
	                    if back!=-1{
							bbot = ds_map_find_value_fixed(backsector,"floor");
							if (bbot>bot){
								bot = bbot;
								//top = ds_map_find_value_fixed(backsector,"ceiling");
							}
	                    }
						
	                    var height=abs(top-bot);
                    
	                    var tt,t_w,t_h;
	                    tt=ds_map_find_value_fixed(textures,tcd[2]);
	                    t_w=ds_map_find_value_fixed(tt,"width");
	                    t_h=ds_map_find_value_fixed(tt,"height");
                    
	                    v0 = 0;
						repeat abs(ys){
							v0 += sign(ys);
						}
				
						v0 = v0/t_h;
						
						//v0 = lowest_value(bot,bbot);
					
						if !dub && l_peg{
							v0 += (t_h-height*t_h)/t_h;
						}
					
	                    v1=v0+height/t_h;
	                    u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
        
	                    DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,-2,1,0);
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,-2,1,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,-2,1,0);
                    
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,-2,1,1);
	                    DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,-2,1,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,-2,1,0);
	                    vv+=2;
	                }
	            }
	            vertex_end(buffer);
	            ds_map_replace(side,"vbuffer",buffer);
	            //show_debug_message("Triangles Built: "+string(vv));
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
	            var backsector=ds_map_find_value_fixed(bside,"sector");
	            ds_map_replace(side,"backsector",backsector);
	            ds_map_replace(linedef,"backsector",backsector);
	            backsector = ds_list_find_value_fixed(sects,backsector);
			
				var _ceiling = ds_map_find_value_fixed(sect,"ceiling");
				//var _floor = ds_map_find_value_fixed(sect,"floor");
				//var sHeight = ( _ceiling - _floor );
            
	            var us=ds_map_find_value(side,"X_");
	            var ys=ds_map_find_value(side,"Y_");
			
				//trace("Line Offsets:",us,ys);
            
	            var colval = ds_map_find_value_fixed(sect,"lightlevel");
			
				var ang = (point_direction(sx,sy,ex,ey)*2-90)//*2;
				var fCon = dsin(ang)*16;
	            var col2=make_colour_hsv(255,0,colval+fCon);
            
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
	                    bot = ds_map_find_value_fixed(backsector,"floor");
	                    top = ds_map_find_value_fixed(backsector,"ceiling");
	                }
                
	                var cLine=instance_create(sx,sy,objDEPassableCollider);
	                cLine.x2=ex;
	                cLine.y2=ey;
	                cLine.bot=bot;
	                cLine.top=top;
	                with cLine event_user(0);
                
	            }
            
	            //show_debug_message("Total Sections: "+string(tc));
            
	            // No Texture, don't bother building
	            var vv=0;
	            if(tc>0)
	            {//We have some walls to render.
                    
	                var bot = ds_map_find_value_fixed(sect,"floor");
	                var top = ds_map_find_value_fixed(sect,"ceiling");
	                var sheight=abs(top-bot);
                
	                if tcd[1]!="-" and right!=-1{
					
	                    //show_debug_message("Upper wall:"+tcd[1]);
					
						var _s,_b;
						_s = ds_map_find_value_fixed(sect,"tex_c");
						_b = ds_map_find_value_fixed(backsector,"tex_c");
					
	                    if not (_s="F_SKY1" and _s!="F_SKY" and _s!="F_SKY001" and _b="F_SKY1" and _b!="F_SKY" and _b!="F_SKY001"){
	                        var bot, top, bbot;
	                        top = ds_map_find_value_fixed(sect,"ceiling");
	                        bot = ds_map_find_value_fixed(backsector,"ceiling");
							bbot = ds_map_find_value_fixed(sect,"ceiling");
                            
	                        var tt,t_w,t_h;
	                        tt=ds_map_find_value_fixed(textures,tcd[1]);
	                        t_w=ds_map_find_value_fixed(tt,"width");
	                        t_h=ds_map_find_value_fixed(tt,"height");
                        
	                        var height=(abs(top-bot))/t_h;
                        
	                        v0 = 0;
					
							repeat abs(ys){
								v0 += sign(ys);
							}
					
							v0 = v0/t_h;
						
							v0 -= (abs(_ceiling - bot) / t_h) * !u_peg;
						
	                        //if u_peg==0 v0+=abs(height*t_h-t_h)/t_h;
                        
	                        if u_peg and !l_peg{
	                            u_add=sy;//abs(height*t_h-t_h);
	                        }
                        
	                        v1=v0+height;
					
							u0 = 0;
					
							repeat abs(us){
								u0 += sign(us);
							}
					
							u0 = u0/t_w;
						
	                        u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
                                                            
	                        DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,1,0,0);
	                        DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,1,0,1);
	                        DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,1,0,0);
                        													 
	                        DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,1,0,1);
	                        DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,1,0,1);
	                        DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,1,0,0);
	                        vv+=2;
	                    }
	                }
	                //Let's do the bottom section of the wall
	                if tcd[0]!="-" and back!=-1{
	                    //show_debug_message("Lower wall:"+tcd[0]);
	                    var bot, top;
                    
	                    if back!=-1
	                        bot = ds_map_find_value_fixed(sect,"floor");
	                    else
	                        bot = ds_map_find_value_fixed(backsector,"ceiling");                    
	                    top = ds_map_find_value_fixed(backsector,"floor");
                    
	                    if top<=bot{
	                        bot=top;
	                    }
                    
	                    //if !ds_map_find_value_fixed(bside,"tex_l")=="-"{
	                    //    tcd[0]=ds_map_find_value_fixed(bside,"tex_l");
	                    //}
                    
	                    var tt,t_w,t_h;
	                    tt=ds_map_find_value_fixed(textures,tcd[0]);
	                    t_w=ds_map_find_value_fixed(tt,"width");
	                    t_h=ds_map_find_value_fixed(tt,"height");
	                    var height=abs(top-bot)/t_h;
                    
						//trace("Creating Lower Wall with Offset",tcd[0],ys);
					
						v0 = 0;
					
						repeat abs(ys){
							v0 += sign(ys);
						}
					
						v0 = v0/t_h + (abs(_ceiling - top) / t_h) * l_peg;
					                    
	                    v1=v0+height;
					
						u0 = 0;
					
						repeat abs(us){
							u0 += sign(us);
						}
					
						u0 = u0/t_w;
	                    u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
                    
	                    DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,0,0,0);
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,0,0,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,0,0,0);
                    
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,0,0,1);
	                    DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,0,0,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,0,0,0);
	                    vv+=2;
	                }
				
	                if tcd[2]!="-"{
						//col2 = c_red;
	                    //show_debug_message("building middle wall:"+tcd[2]);
	                    var bot, top, bbot;
	                    bot = ds_map_find_value_fixed(sect,"floor");
	                    top = ds_map_find_value_fixed(sect,"ceiling");
                    
	                    if back!=-1{
							bbot = ds_map_find_value_fixed(backsector,"floor");
							if (bbot>bot){
								bot = bbot;
								//top = ds_map_find_value_fixed(backsector,"ceiling");
							}
	                    }
                    
	                    var tt,t_w,t_h;
	                    tt=ds_map_find_value_fixed(textures,tcd[2]);
	                    t_w=ds_map_find_value_fixed(tt,"width");
	                    t_h=ds_map_find_value_fixed(tt,"height");
                    
	                    var height=abs(top-bot)/t_h;
                    
	                    //v0=ys/t_h-(height*l_peg);
					
						v0 = 0;
					
						repeat abs(ys){
							v0 += sign(ys);
						}
					
						v0 /= t_h;
					
						if !dub && l_peg{
							//trace("Wall is One Sided and pegged",t_h-height,tcd[2]);
							v0 += (t_h-height*t_h)/t_h;//(abs(_ceiling - top) / t_h)
						}
					
	                    v1=v0+height;
					
						u0 = 0;
					
						repeat abs(us){
							u0 += sign(us);
						}
					
						u0 = u0/t_w;
					
	                    u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
        
	                    DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,0.25,-2,1,0);
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,0.25,-2,1,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,0.25,-2,1,0);
                    												
	                    DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,0.25,-2,1,1);
	                    DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,0.25,-2,1,1);
	                    DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,0.25,-2,1,0);
	                    vv+=2;
	                }
	            }
	            vertex_end(buffer);
	            ds_map_replace(side,"vbuffer",buffer);
	            //show_debug_message("Triangles Built: "+string(vv));
	        }
	    }
	}

	//show_debug_message("***** >>> NOTICE Collision lines created: "+string(instance_number(objDESlideCollider)));

	//return buffer




}
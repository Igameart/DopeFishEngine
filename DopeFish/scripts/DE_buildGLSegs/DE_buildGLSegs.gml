/// @description DE_buildGLSegs(GLSSECT,sector,buffer,color);
function DE_buildGLSegs() {

	var segs  = mapGLSegs;
	var lines = mapLinedefs;
	var sides = mapSidedefs;
	var sects = mapSectors;

	for (var k=0;k<ds_list_size(segs);k++) {

	    var glSeg = segs[|k];
	
	    var linedef = glSeg[?"linedef"];
	
		if linedef == 65535 continue;
	
		linedef = lines[|linedef];
    
	    var flags=ds_map_find_value_fixed(linedef,"flags");
	    var u_peg=ds_map_find_value_fixed(flags,"peg_upper");
	    var l_peg=ds_map_find_value_fixed(flags,"peg_lower");
	    var dub  =ds_map_find_value_fixed(flags,"twosided");
    
		var startv,endv;

		startv = glSeg[?"start"];
		endv = glSeg[?"end"];
	
		var vcheck;
	
		var sx,sy,ex,ey;

		vcheck=mapVertexes;
		if(startv&VERT_IS_GL){
		    startv=startv&~VERT_IS_GL;
		    vcheck=mapGLVerts;
		}
		startv = vcheck[|startv];
    
		vcheck=mapVertexes;
		if(endv&VERT_IS_GL){
		    endv=endv&~VERT_IS_GL;
		    vcheck=mapGLVerts;
		}
		endv = vcheck[|endv];
	
		sx = startv[?"x"];
		sy = startv[?"y"];
	
		ex = endv[?"x"];
		ey = endv[?"y"];
	
		var segOff;
		if !glSeg[?"side"]{
			var lVert = linedef[?"start"];
			lVert = mapVertexes[|lVert];
			segOff = point_distance(sx,sy,lVert[?"x"],lVert[?"y"]);
		}else{
			var lVert = linedef[?"end"];
			lVert = mapVertexes[|lVert];
			segOff = point_distance(sx,sy,lVert[?"x"],lVert[?"y"]);
		}
    
		var lSides = ["right","left"];
		var s = lSides[glSeg[?"side"]];
	
		s = linedef[?s];
		var side = sides[|s];
		var sect=side[?"sector"];
		sect = sects[|sect];
		var _ceiling = sect[?"ceiling"];
            
		var bs = lSides[!glSeg[?"side"]];
		bs = linedef[?bs];	
		var back = bs;     
		
		/*if back!=-1{
			var bside = sides[|bs];			
			var bsect = bside[?"sector"];
			bsect = sects[|bsect];
		} */
	
		var bside=ds_list_find_value_fixed(sides,back);
		var bsect=ds_map_find_value(bside,"sector");
		if bsect != undefined
			bsect = ds_list_find_value(sects,bsect);
		if bsect == undefined bsect = -1;
		
            
	    var us=side[?"X_"];
	    var ys=side[?"Y_"];
            
	    var colval = sect[?"lightlevel"];
			
		var ang = (point_direction(sx,sy,ex,ey)*2+90)//*2;
		var fCon = dsin(ang)*32;
	    var col2=make_colour_hsv(random(255),128*0,colval+fCon);
            
	    var tcd,tc;
	    tc=0;
	    tcd[0]="-";
	    tcd[1]="-";
	    tcd[2]="-";
            
	    if (ds_map_find_value_fixed(side,"tex_l")!="-"){
	        tcd[0]=ds_map_find_value_fixed(side,"tex_l");
	        tc++;
	    }
            
	    if (ds_map_find_value_fixed(side,"tex_u")!="-"){
	        tcd[1]=ds_map_find_value_fixed(side,"tex_u");
	        tc++;
	    }
            
	    if (ds_map_find_value_fixed(side,"tex_m")!="-"){
	        tcd[2]=ds_map_find_value_fixed(side,"tex_m");
	        tc++;
	    }
                 
	    // No Texture, don't bother building
	    var vv=0;
	    if(tc>0)
	    {//We have some walls to render.
			
		    var buffer = vertex_create_buffer();
		    vertex_begin(buffer,DE_vFormat);
			
			var __Empty = true;
			
	        var bot = ds_map_find_value_fixed(sect,"floor");
	        var top = ds_map_find_value_fixed(sect,"ceiling");
			
			//CHRIS: Create a script to check that a texture isn't a currently known sky texture rather than having a hard coded check for F_SKY1
	        //Let's do the bottom section of the wall first just because
	        if tcd[0]!="-" && tcd[0]!="F_SKY1"{// and back!=-1{
	            //trace("Lower wall:"+tcd[0]);
                    
	            if back!=-1{
					bot = ds_map_find_value_fixed(sect,"floor");
	                //bot = ds_map_find_value_fixed(bsect,"ceiling");
					top = ds_map_find_value_fixed(bsect,"floor");
				}
                    
	            //if top<=bot{
	            //    bot=top;
	            //}
                    
	            var tt,t_w,t_h;
	            tt=ds_map_find_value_fixed(textures,tcd[0]);
	            t_w=ds_map_find_value_fixed(tt,"width");
	            t_h=ds_map_find_value_fixed(tt,"height");
                    
	            var height=abs(top-bot)/t_h;
					
				var v0 = 0;
				
				//Lower unpegged, push the vertical offset down the height of this wall / texture height
				if l_peg{
					
					v0 = top/t_h;
					
				}
			
				//repeat abs(ys){
				//	v0 += sign(ys)/t_h;
				//}
				
				v0 += ys/t_h;
					
	            var v1=v0+height;
					
				var u0 = segOff;
					
				repeat abs(us){
					u0 += sign(us);
				}
					
				u0 = u0/t_w;
	            var u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
				
				__Empty = false;                    
	            DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,0,0,0);
	            DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,0,0,1);
	            DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,0,0,0);
                    
	            DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,0,0,1);
	            DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,0,0,1);
	            DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,0,0,0);
	            vv+=2;
	        }
             
			//Top Section
	        if tcd[1]!="-" and back!=-1 && tcd[1]!="F_SKY1"{
			
				var _s,_b;
				_s = ds_map_find_value_fixed(sect,"tex_c");
				_b = ds_map_find_value_fixed(bsect,"tex_c");
			
	            if not (_s="F_SKY1" and _s!="F_SKY" and _s!="F_SKY001" and _b="F_SKY1" and _b!="F_SKY" and _b!="F_SKY001"){
	                var bot, top;
	                top = ds_map_find_value_fixed(sect,"ceiling");
	                bot = ds_map_find_value_fixed(bsect,"ceiling");
                            
	                var tt,t_w,t_h;
	                tt=ds_map_find_value_fixed(textures,tcd[1]);
	                t_w=ds_map_find_value_fixed(tt,"width");
	                t_h=ds_map_find_value_fixed(tt,"height");
                        
	                var height=(abs(top-bot))/t_h;
                        
	                var v0 = 0;
					
					repeat abs(ys){
						v0 += sign(ys);
					}
					
					v0 = v0/t_h;
						
					v0 -= (abs(_ceiling - bot) / t_h) * !u_peg;

	                var v1=v0+height;
					
					var u0 = segOff;
					
					repeat abs(us){
						u0 += sign(us);
					}
					
					u0 = u0/t_w;
						
	                var u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
                        
					__Empty = false;                                    
	                DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,1,0,0);
	                DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,1,0,1);
	                DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,1,0,0);
                        
	                DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,1,0,1);
	                DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,1,0,1);
	                DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,1,0,0);
	                vv+=2;
	                //}
	            }
	        }
		
			//Middle section
	        if tcd[2]!="-" && tcd[2]!="F_SKY1"{
	            //trace("building middle wall:"+tcd[2]);
	            var bot, top;
                        
	            bot = ds_map_find_value(sect,"floor");
				top = ds_map_find_value(sect,"ceiling");
                    
	            var tt,t_w,t_h;
	            tt=ds_map_find_value_fixed(textures,tcd[2]);
	            t_w=ds_map_find_value_fixed(tt,"width");
	            t_h=ds_map_find_value_fixed(tt,"height");
			
	            var v0 = 0;
			
				if back!=-1{
					
					top = ds_map_find_value(sect,"ceiling");
					var btop = ds_map_find_value(bsect,"ceiling");
					
					top = lowest_value(top,btop);
					
					var bbot = ds_map_find_value(bsect,"floor");
					if bbot == undefined exit;
					
					bot = highest_value(bot,bbot);
					
					/*if u_peg{
						var btop = ds_map_find_value(sect,"ceiling");
						top = lowest_value(top,btop);
						bot = top - t_h;
					}*/
					//else{
					if l_peg top -= abs(bot - top) - t_h;
					//}
					
					top += ys;
					ys = 0;
					
					if ds_map_find_value_fixed(bsect,"wrap middle texture") == 0{
						bot = max(top-t_h,bot);
					}
				
				}
				
				//if l_peg top -= abs(bot - top) - t_h;
						
				var height=abs(top-bot);

				repeat abs(ys){
					v0 += sign(ys);
				}
				
				v0 = v0/t_h;
					
				if !dub && l_peg{
					
					v0 -= (abs(bot - top) - t_h)/t_h;
					
					//v0 += (t_h-height*t_h)/t_h;
				}
				
					
	            v1=v0+height/t_h;
			
					
				u0 = segOff;
					
				repeat abs(us){
					u0 += sign(us);
				}
					
				u0 = u0/t_w;
							
	            u1=(u0+point_distance(sx,sy,ex,ey)/t_w);
        
				__Empty = false;
	            DE_vertexSides(buffer,sx,sy,bot,0,0,0,u0,v1,col2,1,-2,1,0);
	            DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,-2,1,1);
	            DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,-2,1,0);
                    
	            DE_vertexSides(buffer,sx,sy,top,0,0,0,u0,v0,col2,1,-2,1,1);
	            DE_vertexSides(buffer,ex,ey,top,0,0,0,u1,v0,col2,1,-2,1,1);
	            DE_vertexSides(buffer,ex,ey,bot,0,0,0,u1,v1,col2,1,-2,1,0);
	            vv+=2;
	        }
			
	    vertex_end(buffer);
		
		if __Empty == false
			vertex_freeze(buffer);
	
	    ds_map_replace(glSeg,"vbuffer",buffer);
		
	    }

	}


}

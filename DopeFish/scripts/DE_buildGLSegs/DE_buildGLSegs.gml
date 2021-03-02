/// @description DE_buildGLSegs(GLSSECT,sector,buffer,color);
function DE_buildGLSegs() {

	var segs  = mapGLSegs;
	var lines = mapLinedefs;
	var sides = mapSidedefs;
	var sects = mapSectors;

	for (var k=0;k<ds_list_size(segs);k++) {

	    var glSeg = segs[| k ];
	
	    var linedef = glSeg.linedef;
	
		if linedef == 65535 continue;
	
		linedef = lines[| linedef];
    
	    var flags=linedef.flags;
	    var u_peg=flags.pegupper;
	    var l_peg=flags.peglower;
	    var dub  =flags.twosided;
    
		var startv,endv;

		startv = glSeg.startv;
		endv = glSeg.endv;
	
		var vcheck;
	
		var sx,sy,ex,ey;

		vcheck=mapVertexes;
		if(startv&VERT_IS_GL){
		    startv=startv&~VERT_IS_GL;
		    vcheck=mapGLVerts;
		}
		startv = vcheck[| startv ];
    
		vcheck=mapVertexes;
		if(endv&VERT_IS_GL){
		    endv=endv&~VERT_IS_GL;
		    vcheck=mapGLVerts;
		}
		endv = vcheck[| endv ];
	
		sx = startv.x;
		sy = startv.y;
	
		ex = endv.x;
		ey = endv.y;
	
		var segOff;
		if !glSeg.side{
			var lVert = linedef.startv;
			lVert = mapVertexes[| lVert ];
			segOff = point_distance(sx,sy,lVert.x,lVert.y);
		}else{
			var lVert = linedef.endv;
			lVert = mapVertexes[| lVert ];
			segOff = point_distance(sx,sy,lVert.x,lVert.y);
		}
    
		var lSides = ["right","left"];
		var s = lSides[ glSeg.side ];
	
		switch s{
			case "right": s = linedef.right; break;
			case "left":  s = linedef.left; break;
		}
		
		var side = ds_list_find_value( sides, s );
		
		if side!= undefined{
		
			var sect = side.sector;
			sect = sects[| sect ];
			var _ceiling = sect.ceilingz;
			var _floor = sect.floorz;
            
			var bs = lSides[ !glSeg.side ];
			switch bs{
				case "right": bs = linedef.right; break;
				case "left":  bs = linedef.left; break;
			}
			var back = bs;     
		
			/*if back!=-1{
				var bside = sides[|bs];			
				var backsector = bside[?"sector"];
				backsector = sects[|backsector];
			} */
	
			var bside = ds_list_find_value(sides,back);
			
			var backsector = undefined;
			if bside != undefined{
				backsector = bside.sector;
				backsector = ds_list_find_value(sects,backsector);
			}
			if backsector == undefined backsector = -1;
		
            
		    var us			= side.xoff;
		    var y_offset	= side.yoff;
            
		    var shadeTop = sect.ceilingshade * 255;
			var shadeBot = sect.floorshade * 255;
			
			var ang = (point_direction(sx,sy,ex,ey)*2+90)//*2;
			var fCon = dsin(ang)*45;
		
		    var segColTop=make_colour_hsv(0,0,shadeTop+fCon);
		    var segColBot=make_colour_hsv(0,0,shadeBot+fCon);
            
		    var tcd,tc;
		    tc=1;
		    tcd[0]=side.lowtex;
		    tcd[1]=side.uptex;
		    tcd[2]=side.midtex;
            
/*		    if ((side.lowtex)!="-"){
		        tc++;
		    }
            
		    if ((side.uptex)!="-"){
		        tc++;
		    }
            
		    if ((side.midtex)!="-"){
		        tc++;
		    }*/
                 
		    // No Texture, don't bother building
			
			var buffer = vertex_create_buffer();
			
		    var vv=0;
		    if(tc > 0)
		    {//We have some walls to render.
			    vertex_begin(buffer,DE_vFormat);
			
				var __Empty = true;
			
		        var bot = sect.floorz;
		        var top = sect.ceilingz;
			
				//CHRIS: Create a script to check that a texture isn't a currently known sky texture rather than having a hard coded check for F_SKY1
		        //Let's do the bottom section of the wall first just because
		        if tcd[0]!="-" && tcd[0]!="F_SKY1" && back!=-1{
		            trace("building lower wall:"+tcd[0]);
				
					bot = sect.floorz;
					top = backsector.floorz;
					
					//var lo = sect.floorz;
					//var hi = sect.ceilingz;
                    
		            var tt,ptexwidth,ptexheight;
		            tt = ds_map_find_value( textures, tcd[0] );
					
		            ptexwidth = tt.width;
		            ptexheight = tt.height;
                    
		            var height=abs(top-bot)/ptexheight;
					
					var ptexbot = height * ptexheight + y_offset;
					ptexbot /= ptexheight;
					var ptextop = ptexbot - height;
					
					//Lower unpegged, v position is top / texture height
					if ( l_peg > 0 ){
												
						var adjust = ( max(sect.ceilingz, backsector.ceilingz)) - backsector.floorz;
						
                        repeat adjust{
							ptextop += sign(adjust) / ptexheight;
							ptexbot += sign(adjust) / ptexheight;
						}
						
					}
					
					var ptexleft = segOff;
					
					repeat abs(us){
						ptexleft += sign(us);
					}
					
					ptexleft = ptexleft / ptexwidth;
		            var ptexright=( ptexleft + point_distance(sx,sy,ex,ey) / ptexwidth );
				
					var colBot,colTop;
				
					var __ctrans = translate( top, _floor,_ceiling, 0,1);
				
					colTop = merge_color(segColBot,segColTop,__ctrans);
				
					__ctrans = translate( bot, _floor,_ceiling, 1,0);
				
					colBot = merge_color(segColBot,segColTop,__ctrans);
				
					__Empty = false;                    
		            DE_vertexSides(buffer,sx,sy,bot,0,0,0,ptexleft,ptexbot,colBot,1,0,0,0);
		            DE_vertexSides(buffer,sx,sy,top,0,0,0,ptexleft,ptextop,colTop,1,0,0,1);
		            DE_vertexSides(buffer,ex,ey,bot,0,0,0,ptexright,ptexbot,colBot,1,0,0,0);
                    
		            DE_vertexSides(buffer,sx,sy,top,0,0,0,ptexleft,ptextop,colTop,1,0,0,1);
		            DE_vertexSides(buffer,ex,ey,top,0,0,0,ptexright,ptextop,colTop,1,0,0,1);
		            DE_vertexSides(buffer,ex,ey,bot,0,0,0,ptexright,ptexbot,colBot,1,0,0,0);
		            vv+=2;
		        }
             
				//Top Section
		        if tcd[1]!="-" and back!=-1 && tcd[1]!="F_SKY1"{
		            trace("building upper wall:"+tcd[1]);
			
					var _s,_b;
					_s = sect.ceilingpicnum;
					_b = backsector.ceilingpicnum;
			
		            if not (_s="F_SKY1" and _s!="F_SKY" and _s!="F_SKY001" and _b="F_SKY1" and _b!="F_SKY" and _b!="F_SKY001"){
		                var bot, top;
		                top = sect.ceilingz;
		                bot = backsector.ceilingz;
                            
		                var tt,ptexwidth,ptexheight;
		                tt=ds_map_find_value_fixed(textures,tcd[1]);
		                ptexwidth=tt.width;
		                ptexheight=tt.height;
                        
		                var height=(abs(top-bot))/ptexheight;
                        
		                var ptextop = 0;
					
						repeat abs(y_offset ){
							ptextop += sign(y_offset );
						}
					
						ptextop = ptextop/ptexheight;
						
						ptextop -= (abs(_ceiling - bot) / ptexheight) * !u_peg;

		                var ptexbot=ptextop+height;
					
						var ptexleft = segOff;
					
						repeat abs(us){
							ptexleft += sign(us);
						}
					
						ptexleft = ptexleft/ptexwidth;
						
		                var ptexright=(ptexleft+point_distance(sx,sy,ex,ey)/ptexwidth);
				
						var colBot,colTop;
				
						var __ctrans = translate( top, _floor,_ceiling, 0,1);
				
						colTop = merge_color(segColBot,segColTop,__ctrans);
				
						__ctrans = translate( bot, _floor,_ceiling, 1,0);
				
						colBot = merge_color(segColBot,segColTop,__ctrans);
                        
						__Empty = false;                                    
		                DE_vertexSides(buffer,sx,sy,bot,0,0,0,ptexleft,ptexbot,colBot,1,1,0,0);
		                DE_vertexSides(buffer,sx,sy,top,0,0,0,ptexleft,ptextop,colTop,1,1,0,1);
		                DE_vertexSides(buffer,ex,ey,bot,0,0,0,ptexright,ptexbot,colBot,1,1,0,0);
                        
		                DE_vertexSides(buffer,sx,sy,top,0,0,0,ptexleft,ptextop,colTop,1,1,0,1);
		                DE_vertexSides(buffer,ex,ey,top,0,0,0,ptexright,ptextop,colTop,1,1,0,1);
		                DE_vertexSides(buffer,ex,ey,bot,0,0,0,ptexright,ptexbot,colBot,1,1,0,0);
		                vv+=2;
		                //}
		            }
		        }
		
				//Middle section
		        if tcd[2]!="-" && tcd[2]!="F_SKY1"{
		            trace("building middle wall:"+tcd[2]);
		            var bot, top;
                        
		            bot = sect.floorz;
					top = sect.ceilingz;
                    
		            var tt,ptexwidth,ptexheight;
		            tt=ds_map_find_value_fixed(textures,tcd[2]);
		            ptexwidth=tt.width;
		            ptexheight=tt.height;
			
		            var ptextop = 0;
			
					if back!=-1{
					
						top = sect.ceilingz;
						var btop = backsector.ceilingz;
					
						top = lowest_value(top,btop);
					
						var bbot = backsector.floorz;
						if bbot == undefined exit;
					
						bot = highest_value(bot,bbot);
					
						if l_peg top -= abs(bot - top) - ptexheight;
					
						top += y_offset ;
						y_offset  = 0;
					
						if backsector.wrapmidtex == 0{
							bot = max(top-ptexheight,bot);
						}
				
					}
						
					var height=abs(top-bot);

					repeat abs(y_offset ){
						ptextop += sign(y_offset );
					}
				
					ptextop = ptextop/ptexheight;
					
					if !dub && l_peg{
					
						ptextop -= (abs(bot - top) - ptexheight)/ptexheight;
					
					}
				
					
		            ptexbot=ptextop+height/ptexheight;
			
					
					ptexleft = segOff;
					
					repeat abs(us){
						ptexleft += sign(us);
					}
					
					ptexleft = ptexleft/ptexwidth;
							
		            ptexright=(ptexleft+point_distance(sx,sy,ex,ey)/ptexwidth);
				
					var colBot,colTop;
								
					var __ctrans = translate( top, _floor,_ceiling, 0,1);
				
					colTop = merge_color(segColBot,segColTop,__ctrans);
				
					__ctrans = translate( bot, _floor,_ceiling, 1,0);
				
					colBot = merge_color(segColBot,segColTop,__ctrans);
        
					__Empty = false;
		            DE_vertexSides(buffer,sx,sy,bot,0,0,0,ptexleft,ptexbot,colBot,1,-2,1,0);
		            DE_vertexSides(buffer,sx,sy,top,0,0,0,ptexleft,ptextop,colTop,1,-2,1,1);
		            DE_vertexSides(buffer,ex,ey,bot,0,0,0,ptexright,ptexbot,colBot,1,-2,1,0);
                    
		            DE_vertexSides(buffer,sx,sy,top,0,0,0,ptexleft,ptextop,colTop,1,-2,1,1);
		            DE_vertexSides(buffer,ex,ey,top,0,0,0,ptexright,ptextop,colTop,1,-2,1,1);
		            DE_vertexSides(buffer,ex,ey,bot,0,0,0,ptexright,ptexbot,colBot,1,-2,1,0);
		            vv+=2;
		        }
			
		    vertex_end(buffer);
		
			if __Empty == false{
				vertex_freeze(buffer);
			}
			//else{
			//	vertex_delete_buffer(buffer);
			//	glSeg.vbuffer = undefined;
			//}
			glSeg.vbuffer = buffer;
		
		    }
		}

	}


}

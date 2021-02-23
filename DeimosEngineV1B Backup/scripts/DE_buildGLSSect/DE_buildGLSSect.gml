/// @description DE_buildGLSSect(GLSSECT)
/// @param GLSSECT
function DE_buildGLSSect(argument0) {

	var polygon, polygonSize, points, polyX, polyY, good, col, sect, colmap;
	var i, j, n, p, A, B, C, x0, y0, x1, y1, x2, y2, x3, y3, x4, y4;

	var lines = mapGLSegs;
	var sects = mapSectors;
	var verts = mapVertexes;
	var gverts = mapGLVerts;
	var gssect = mapGLSSects;

	polygon = ds_list_find_value_fixed(gssect,argument0);
	sect=DE_getSectorFromSSect(argument0);
	ds_map_replace(polygon,"sector",sect);
	sect=ds_list_find_value_fixed(sects,sect);


	colmap=ds_map_find_value(sect,"colmap");
	
	var __glColMap = ds_map_find_value(polygon,"colmap");

	trace("BUILDING Sector: "+string(argument0));


	var colval = ds_map_find_value_fixed(sect,"lightlevel");
	col=make_colour_hsv(random(255),128*0,colval);//make_colour_hsv(255,0,colval);
	var fheight = ds_map_find_value_fixed(sect,"floor");
	var cheight = ds_map_find_value_fixed(sect,"ceiling");
	var ftex = ds_map_find_value_fixed(sect,"tex_f");
	var ctex = ds_map_find_value_fixed(sect,"tex_c");


	ds_map_replace(polygon,"tex_f",ftex);
	ds_map_replace(polygon,"tex_c",ctex);

	var vbuffer = vertex_create_buffer();
	vertex_begin(vbuffer,DE_vFormat);    
    
	trace("STILL BUILDING Sector: "+string(argument0));
	var count,start;
	count=ds_map_find_value_fixed(polygon,"count");
	start=ds_map_find_value_fixed(polygon,"start");
    
	polygonSize = count;//ds_list_size(polygon) div 2;
	points = ds_list_create();
	polyX = ds_list_create();
	polyY = ds_list_create();
    
	var k = 0,startx,starty;
	
	repeat (count) {
	    var __line = ds_list_find_value_fixed(lines,k+start);
            
	    var __startv=ds_map_find_value_fixed(__line,"start");
        
	    var sx,sy,vert,vcheck;
	    vcheck=verts;
	    if(__startv&VERT_IS_GL){
	        __startv=__startv&~VERT_IS_GL;
	        vcheck=gverts;
	    }
        
	    vert=ds_list_find_value_fixed(vcheck,__startv);
	    sx = ds_map_find_value_fixed(vert,"x");
	    sy = ds_map_find_value_fixed(vert,"y");
		
		if (k == 0){
			startx = sx;
			starty = sy;
		}
        
	    ds_list_add(polyX, -sx);
	    ds_list_add(polyY, sy);
		
		ds_list_add( __glColMap, -sx,sy );
			
	    k++;
	}  
	
	ds_list_add( __glColMap, -startx,starty );
    
	if ((ftex!="F_SKY1" and ftex!="F_SKY" and ftex!="F_SKY001") or (ctex!="F_SKY1" and ctex!="F_SKY" and ctex!="F_SKY001")){
		
	    // 1. For (n - 3) vertices
	    //n = polygonSize;
    
	    for (n = polygonSize; n > 3; n -= 1) {
	        //  a. Select first point (random)
	        ds_list_clear(points);
	        for (p = 0; p < n; p += 1) ds_list_add(points, p);
	        repeat (p) {
	            i = floor(random(ds_list_size(points)));
	            A = ds_list_find_value(points, i);
	            ds_list_delete(points, i);
	            //  b. Pick the next two points
	            B = (A + 1) mod n;
	            C = (A + 2) mod n;
	            //  c. Make a triangle with the selected points
	            x0 = ds_list_find_value(polyX, A);
	            y0 = ds_list_find_value(polyY, A);
	            x1 = ds_list_find_value(polyX, B);
	            y1 = ds_list_find_value(polyY, B);
	            x2 = ds_list_find_value(polyX, C);
	            y2 = ds_list_find_value(polyY, C);
	            //  d. If triangle is counter-clockwise...
	            if (not is_clockwise(x0, y0, x1, y1, x2, y2)) {
	                good = true;
	                //  ...and if triangle has no vertices within it...
	                for (i = 0; i < n; i += 1) {
	                    if ((i != A) && (i != B) && (i != C)) {
	                        x3 = ds_list_find_value(polyX, i);
	                        y3 = ds_list_find_value(polyY, i);
	                        if (point_in_triangle(x0, y0, x1, y1, x2, y2, x3, y3)) { good = false; break; }
	                        //  ...and if the new edge has no other edges crossing it...
	                        j = (i + 1) mod n;
	                        if ((j != A) && (j != B) && (j != C)) {
	                            x4 = ds_list_find_value(polyX, j);
	                            y4 = ds_list_find_value(polyY, j);
	                            if (lines_intersect(x0, y0, x2, y2, x3, y3, x4, y4)) { good = false; break; }
	                        }
	                    }
	                }
	                //  e.  ...then add the triangle to list and remove the shared outside edge point
	                if (good) {
			
	                    ds_list_add(colmap,-x0,y0,-x1,y1,-x2,y2);
	                    //trace("STILL BUILDING Sector: "+string(argument0));
	                    if (ftex!="F_SKY1" and ftex!="F_SKY" and ftex!="F_SKY001"){
	                        DE_vertexGLSS(vbuffer,-x0,y0,fheight,0,0,0,-x0/64,y0/64,col,1,0);
	                        DE_vertexGLSS(vbuffer,-x1,y1,fheight,0,0,0,-x1/64,y1/64,col,1,0);
	                        DE_vertexGLSS(vbuffer,-x2,y2,fheight,0,0,0,-x2/64,y2/64,col,1,0);
	                    }
                    
	                    if (ctex!="F_SKY1" and ctex!="F_SKY" and ctex!="F_SKY001"){
	                        DE_vertexGLSS(vbuffer,-x1,y1,cheight,0,0,0,x1/64,y1/64,col,1,1);
	                        DE_vertexGLSS(vbuffer,-x0,y0,cheight,0,0,0,x0/64,y0/64,col,1,1);
	                        DE_vertexGLSS(vbuffer,-x2,y2,cheight,0,0,0,x2/64,y2/64,col,1,1);
	                    }
                    
	                    ds_list_delete(polyX, B);
	                    ds_list_delete(polyY, B);
	                    break;
	                }
	            }
	        }
	    }
    
	    //  2. There are only three vertices left, so add the final triangle to the list
		
		//x0 = ds_list_find_value(polyX, 0);
		//y0 = ds_list_find_value(polyY, 0);
		//x1 = ds_list_find_value(polyX, 1);
		//y1 = ds_list_find_value(polyY, 1);
		//x2 = ds_list_find_value(polyX, 2);
		//y2 = ds_list_find_value(polyY, 2);
		
	    ds_list_add(colmap,-ds_list_find_value_fixed(polyX, 0),ds_list_find_value_fixed(polyY, 0),
	                        -ds_list_find_value_fixed(polyX, 1),ds_list_find_value_fixed(polyY, 1),
	                         -ds_list_find_value_fixed(polyX, 2),ds_list_find_value_fixed(polyY, 2));

	    if (ftex!="F_SKY1" and ftex!="F_SKY" and ftex!="F_SKY001"){
	        DE_vertexGLSS(vbuffer,-ds_list_find_value_fixed(polyX, 0),ds_list_find_value_fixed(polyY, 0),fheight,0,0,0,-ds_list_find_value_fixed(polyX, 0)/64,ds_list_find_value_fixed(polyY, 0)/64,col,1,0);
	        DE_vertexGLSS(vbuffer,-ds_list_find_value_fixed(polyX, 1),ds_list_find_value_fixed(polyY, 1),fheight,0,0,0,-ds_list_find_value_fixed(polyX, 1)/64,ds_list_find_value_fixed(polyY, 1)/64,col,1,0);
	        DE_vertexGLSS(vbuffer,-ds_list_find_value_fixed(polyX, 2),ds_list_find_value_fixed(polyY, 2),fheight,0,0,0,-ds_list_find_value_fixed(polyX, 2)/64,ds_list_find_value_fixed(polyY, 2)/64,col,1,0);
	    }
	    if (ctex!="F_SKY1" and ctex!="F_SKY" and ctex!="F_SKY001"){
	        DE_vertexGLSS(vbuffer,-ds_list_find_value_fixed(polyX, 1),ds_list_find_value_fixed(polyY, 1),cheight,0,0,0,ds_list_find_value_fixed(polyX, 1)/64,ds_list_find_value_fixed(polyY, 1)/64,col,1,1);
	        DE_vertexGLSS(vbuffer,-ds_list_find_value_fixed(polyX, 0),ds_list_find_value_fixed(polyY, 0),cheight,0,0,0,ds_list_find_value_fixed(polyX, 0)/64,ds_list_find_value_fixed(polyY, 0)/64,col,1,1);
	        DE_vertexGLSS(vbuffer,-ds_list_find_value_fixed(polyX, 2),ds_list_find_value_fixed(polyY, 2),cheight,0,0,0,ds_list_find_value_fixed(polyX, 2)/64,ds_list_find_value_fixed(polyY, 2)/64,col,1,1);
	    }
		
	    //  3. Clean up
	    ds_list_destroy(polyX);
	    ds_list_destroy(polyY);
	    ds_list_destroy(points);
    
	    vertex_end(vbuffer);
		vertex_freeze(vbuffer);
		
	    ds_map_add(polygon,"vbuffer",vbuffer);
	}
	trace("Done Building Sector");


}
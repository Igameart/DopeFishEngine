function macros() {
	#macro THINGSOFS 1
	#macro LINEDEFOFS 2
	#macro SIDEDEFOFS 3
	#macro VERTEXESOFS 4
	#macro SEGSOFS 5
	#macro SSECTORSOFS 6
	#macro NODESOFS 7
	#macro SECTORSOFS 8
	#macro REJECTOFS 9
	#macro BLOCKMAPOFS 10
	#macro GL_VERTOFS 12
	#macro GL_SEGSOFS 13
	#macro GL_SSECTOFS 14
	#macro GL_NODESOFS 15
	#macro GL_PVSOFS 16

	#macro null pointer_null

	gml_pragma("global","macros()");

}

function draw_sprite_tiled_area_ext(){

/// draw_sprite_tiled_area(sprite,subimg,x,y,x1,y2,x2,y2)
//
//  Draws a repeated sprite image, tiled to fill a given region and with
//  a given offset. 
//
//      sprite      sprite to draw, real
//      subimg      sprite subimage to draw, real
//      x,y         origin offset, real
//      x1,y1       top-left corner of tiled area, real
//      x2,y2       bottom-right corner of tiled area, real
//
/// GMLscripts.com/license
    var sprite,subimg,xx,yy,x1,y1,x2,y2,xscale,yscale;
	
    sprite = argument0;
    subimg = argument1;
    xscale = argument8;
    yscale = argument9;
    xx = argument2;
    yy = argument3;
    x1 = argument4*xscale;
    y1 = argument5*yscale;
    x2 = argument6*xscale;
    y2 = argument7*yscale;
 
    var sw,sh,i,j,jj,left,top,width,height,X,Y;
    sw = sprite_get_width(sprite)*xscale;
    sh = sprite_get_height(sprite)*yscale;
 
    i = x1-((x1 mod sw) - (xx mod sw)) - sw*((x1 mod sw)<(xx mod sw));
    j = y1-((y1 mod sh) - (yy mod sh)) - sh*((y1 mod sh)<(yy mod sh)); 
    jj = j;
 
    for(i=i; i<=x2; i+=sw) {
        for(j=j; j<=y2; j+=sh) {
 
            if(i <= x1) left = x1-i;
            else left = 0;
            X = i+left;
 
            if(j <= y1) top = y1-j;
            else top = 0;
            Y = j+top;
 
            if(x2 <= i+sw) width = ((sw)-(i+sw-x2)+1)-left;
            else width = sw-left;
 
            if(y2 <= j+sh) height = ((sh)-(j+sh-y2)+1)-top;
            else height = sh-top;
 
            draw_sprite_part_ext(sprite,subimg,left,top,width,height,X,Y,xscale,yscale,c_white,1);
        }
        j = jj;
    }
    return 0;
}


function draw_surface_tiled_area_ext(){

/// draw_sprite_tiled_area(sprite,subimg,x,y,x1,y2,x2,y2)
//
//  Draws a repeated sprite image, tiled to fill a given region and with
//  a given offset. 
//
//      sprite      sprite to draw, real
//      subimg      sprite subimage to draw, real
//      x,y         origin offset, real
//      x1,y1       top-left corner of tiled area, real
//      x2,y2       bottom-right corner of tiled area, real
//
/// GMLscripts.com/license
    var sprite,xx,yy,x1,y1,x2,y2,xscale,yscale;
	
    sprite = argument0;
    xscale = 1;
    yscale = 1;
    xx = argument1;
    yy = argument2;
    x1 = argument3*xscale;
    y1 = argument4*yscale;
    x2 = argument5*xscale;
    y2 = argument6*yscale;
 
    var sw,sh,i,j,jj,left,top,width,height,X,Y;
    sw = surface_get_width(sprite)*xscale;
    sh = surface_get_height(sprite)*yscale;
 
    i = x1-((x1 mod sw) - (xx mod sw)) - sw*((x1 mod sw)<(xx mod sw));
    j = y1-((y1 mod sh) - (yy mod sh)) - sh*((y1 mod sh)<(yy mod sh)); 
    jj = j;
 
    for(i=i; i<=x2; i+=sw) {
        for(j=j; j<=y2; j+=sh) {
 
            if(i <= x1) left = x1-i;
            else left = 0;
            X = i+left;
 
            if(j <= y1) top = y1-j;
            else top = 0;
            Y = j+top;
 
            if(x2 <= i+sw) width = ((sw)-(i+sw-x2)+1)-left;
            else width = sw-left;
 
            if(y2 <= j+sh) height = ((sh)-(j+sh-y2)+1)-top;
            else height = sh-top;
 
            draw_surface_part_ext(sprite,left,top,width,height,X,Y,xscale,yscale,c_white,1);
        }
        j = jj;
    }
    return 0;
}

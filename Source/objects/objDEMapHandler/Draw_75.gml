/*
var w,h;
w = display_get_gui_width()*0+ surface_get_width(application_surface);
h = display_get_gui_height()*0+surface_get_height(application_surface);

w/=2;
h/=2;
/// @description 
/* * /
/// Draw Sectors
var lines = mapGLSegs;//ds_map_find_value_fixed(wadlevel,"glsegs");
var verts = mapVertexes;//ds_map_find_value_fixed(wadlevel,"vertexes");
var gverts = mapGLVerts;//ds_map_find_value_fixed(wadlevel,"glverts");

draw_set_color(c_lime);
draw_set_alpha(0.5);

//show_message("Number of Lines:"+string(ds_list_size(lines)));
for (var i = 0; i<ds_list_size(lines); i++ )
{

    var line,vert,sx,sy,ex,ey,ind,start,endv;
    line = ds_list_find_value(lines,i);
        
    var startv=ds_map_find_value(line,"start");
    //draw_text(mouse_x,mouse_y+i*20,string(startv));
    endv=ds_map_find_value(line,"end");
    var linedef=ds_map_find_value(line,"linedef");
    //draw_text(mouse_x+10,mouse_y+(i+0.5)*20,string(endv));
    
    var sx,sy,ex,ey,vert,vcheck;
    vcheck=verts;
    if(startv&VERT_IS_GL){
        startv=startv&~VERT_IS_GL;
        vcheck=gverts;
    }
    
    vert=ds_list_find_value(vcheck,startv);
    sx = ds_map_find_value(vert,"x")-1024;
    sy = ds_map_find_value(vert,"y")-3264;
    
    vcheck=verts;
    if(endv&VERT_IS_GL){
        endv=endv&~VERT_IS_GL;
        vcheck=gverts;
    }
    
    vert=ds_list_find_value(vcheck,endv);
    ex = ds_map_find_value(vert,"x")-1024;
    ey = ds_map_find_value(vert,"y")-3264;
    
	if is_clockwise(sx/5+w,sy/5+h,ex/5+w,ey/5+h,window_mouse_get_x(),window_mouse_get_y()) continue;
	
    //if linedef!=65535{
        //draw_set_alpha(1);
        draw_line(sx/5+w,sy/5+h,ex/5+w,ey/5+h);//,5);
		var dir = point_direction(sx,sy,ex,ey)+90;		
		draw_sprite_ext(spr_arrow,-1,mean(sx,ex)/5+w,mean(sy,ey)/5+h,1,1,dir,c_lime,0.5);
    //}
    
}
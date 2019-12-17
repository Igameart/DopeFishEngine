/// @description Draw the Background & Do Projection

d3d_set_projection_ext(x,y,z+eyes,x+cam_x,y+cam_y,z+eyes+cam_z, 0,0,1, 65,__view_get( e__VW.WView, 0 )/__view_get( e__VW.HView, 0 ),0.2,f_far);

window_set_caption(string(fps_real));

DE_renderWorld();

/*
draw_set_color(c_lime);
draw_set_alpha(1);

for (i = start; i<start+count; i++ )
{

    var line,vert,sx,sy,ex,ey,ind,start,endv;
    line = ds_list_find_value_fixed(lines,i);
        
    startv=ds_map_find_value_fixed(line,"start");
    //draw_text(mouse_x,mouse_y+i*20,string(startv));
    endv=ds_map_find_value_fixed(line,"end");
    linedef=ds_map_find_value_fixed(line,"linedef");
    //draw_text(mouse_x+10,mouse_y+(i+0.5)*20,string(endv));
    
    var sx,sy,ex,ey,vert,vcheck;
    vcheck=verts;
    if(startv&VERT_IS_GL){
        startv=startv&~VERT_IS_GL;
        vcheck=gverts;
    }
    
    vert=ds_list_find_value_fixed(vcheck,startv);
    sx = ds_map_find_value_fixed(vert,"x");
    sy = ds_map_find_value_fixed(vert,"y");
    
    vcheck=verts;
    if(endv&VERT_IS_GL){
        endv=endv&~VERT_IS_GL;
        vcheck=gverts;
    }
    
    vert=ds_list_find_value_fixed(vcheck,endv);
    ex = ds_map_find_value_fixed(vert,"x");
    ey = ds_map_find_value_fixed(vert,"y");
    
    draw_set_color(c_fuchsia);
    draw_line_width(sx,sy,ex,ey,3*scale);
    
}

/* */
/// Draw Sectors
/*var lines = ds_map_find_value_fixed(wad_levels,"glsegs");
var verts = ds_map_find_value_fixed(wad_levels,"vertexes");
var gverts = ds_map_find_value_fixed(wad_levels,"glverts");

/*line = ds_list_find_value_fixed(lines,2);
    
startv=ds_map_find_value_fixed(line,"start");

draw_text_ext_transformed(view_xview,view_yview,string(startv),3,900,scale,scale,0);
* /

draw_set_color(c_lime);
draw_set_alpha(1);

for (i = 0; i<ds_list_size(lines); i++ )
{

    var line,vert,sx,sy,ex,ey,ind,start,endv;
    line = ds_list_find_value_fixed(lines,i);
        
    startv=ds_map_find_value_fixed(line,"start");
    //draw_text(mouse_x,mouse_y+i*20,string(startv));
    endv=ds_map_find_value_fixed(line,"end");
    linedef=ds_map_find_value_fixed(line,"linedef");
    //draw_text(mouse_x+10,mouse_y+(i+0.5)*20,string(endv));
    
    var sx,sy,ex,ey,vert,vcheck;
    vcheck=verts;
    if(startv&VERT_IS_GL){
        startv=startv&~VERT_IS_GL;
        vcheck=gverts;
    }
    
    vert=ds_list_find_value_fixed(vcheck,startv);
    sx = ds_map_find_value_fixed(vert,"x");
    sy = ds_map_find_value_fixed(vert,"y");
    
    vcheck=verts;
    if(endv&VERT_IS_GL){
        endv=endv&~VERT_IS_GL;
        vcheck=gverts;
    }
    
    vert=ds_list_find_value_fixed(vcheck,endv);
    ex = ds_map_find_value_fixed(vert,"x");
    ey = ds_map_find_value_fixed(vert,"y");
    
    draw_set_color(c_black);
    if linedef!=65535{
        draw_set_alpha(1);
        draw_line_width(sx,sy,ex,ey,5*scale);
    }/*else{
        draw_set_alpha(0.25);
        draw_line_width(sx,sy,ex,ey,scale);
        }* /
    if linedef!=65535{
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_line_width(sx,sy,ex,ey,2*scale);
    }
    
}

/* */
///Draw GLVerts
/*
draw_set_color(c_ltgray);
draw_set_alpha(1);

var verts = ds_map_find_value_fixed(wad_levels,"glverts");
draw_set_alpha(1);
for (i = 0; i <ds_list_size(verts); i += 1)
{

    var vert,sx,sy,ex,ey,ind,start,endv;
    vert = ds_list_find_value_fixed(verts,i);
    sx = ds_map_find_value_fixed(vert,"x");
    sy = ds_map_find_value_fixed(vert,"y");
    
    //draw_sprite_ext(vertex_spr,0,sx,sy,scale,scale,0,c_fuchsia,1)
    draw_circle(sx,sy,scale*2,0);
}


/* */
///Draw Verts
/*
draw_set_color(c_lime);
draw_set_alpha(1);

var verts = ds_map_find_value_fixed(wad_levels,"vertexes");

for (i = 0; i <ds_list_size(verts); i += 1)
{

    var vert,sx,sy,ex,ey,ind,start,endv;
    vert = ds_list_find_value_fixed(verts,i);
    sx = ds_map_find_value_fixed(vert,"x");
    sy = ds_map_find_value_fixed(vert,"y");
    
    //draw_sprite_ext(vertex_spr,0,sx,sy,scale,scale,0,c_aqua,1)
    draw_circle(sx,sy,scale*2,0);
}


//    draw_sprite_ext(vertex_spr,0,0,0,scale*2,scale*2,0,c_yellow,1)

/* */
///Draw Things
/*
draw_set_color(c_green);
draw_set_alpha(1);

var things = ds_map_find_value_fixed(wad_levels,"things");

for (i = 0; i <ds_list_size(things); i += 1)
{

    var line,vert,sx,sy,ex,ey,ind,start,endv;
    thing = ds_list_find_value_fixed(things,i);
    sx = ds_map_find_value_fixed(thing,"x");
    sy = ds_map_find_value_fixed(thing,"z");
    
    draw_sprite_ext(wadico2_spr,-1,sx,sy,scale,scale,0,c_white,1)
}

/*
list=ds_map_find_value_fixed(tdat,"textures");

var spr=ds_list_find_value_fixed(list,floor(num));

draw_sprite_ext(spr,0,view_xview[0],view_yview[0],scale*2,scale*2,0,c_white,1);

num+=.05;
if num>=ds_list_size(list) then num=0;*/

//draw_sprite_ext(flat1,0,view_xview[0]+view_wview-64*scale*2,view_yview[0],scale*2,scale*2,0,c_white,1);

/* */
/*  */

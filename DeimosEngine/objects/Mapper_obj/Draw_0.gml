/// @description Draw the Background & Do Projection

d3d_set_projection_ext(x,y,z+eyes,x+cam_x,y+cam_y,z+eyes+cam_z, 0,0,1, 65,__view_get( e__VW.WView, 0 )/__view_get( e__VW.HView, 0 ),0.2,f_far);


//var spr=ds_map_find_value_fixed(ds_map_find_value_fixed(wadPatches,"WALL03_7"),"data");
//draw_sprite_tiled_ext(spr,0,view_xview[0],view_yview[0],scale,scale,c_white,1);
//draw_background_stretched(back_bck,view_xview[0],view_yview[0],view_wview[0],view_hview[0]);

//draw_sprite_stretched_ext(bgspr,0,view_xview[0],view_yview[0],view_wview[0],view_hview[0],c_gray,0.75);

/// Draw selected GL_SSECT
//var lines = ds_map_find_value_fixed(wad_levels,"glsegs");
//var verts = ds_map_find_value_fixed(wad_levels,"vertexes");
//var gverts = ds_map_find_value_fixed(wad_levels,"glverts");

window_set_caption(string(fps_real));

texture_set_repeat(true);

shader_set(shd_GLSSect);
shader_set_uniform_f(u_fogColorG,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
shader_set_uniform_f(u_fogMaxDistG,f_far*0.9);
shader_set_uniform_f(u_fogMinDistG,f_near);

var gssects = ds_map_find_value_fixed(wad_levels,"glssects");
var sects=ds_map_find_value_fixed(wad_levels,"sectors");

var str="";
for (j = 0; j<ds_list_size(gssects); j++ ){
    
    gssect = ds_list_find_value_fixed(gssects,j);
    
    var count,start,vbuffer,ctex,ftex,ttex,sect,zadd,crushing;
    ttex=0;
    count = ds_map_find_value_fixed(gssect,"count");
    start = ds_map_find_value_fixed(gssect,"start");
    vbuffer = ds_map_find_value_fixed(gssect,"vbuffer");
    ftex = ds_map_find_value_fixed(gssect,"tex_f");
    ctex = ds_map_find_value_fixed(gssect,"tex_c");
    sect = ds_map_find_value(gssect,"sector");
    //str+=string(sect)+", ";
    zadd = 0;
    crushing = 0;
    
    if !is_undefined(sect){
        var s = ds_list_find_value(sects,sect);
        zadd = ds_map_find_value(s,"lift");
        crushing = ds_map_find_value(s,"crush");
    }
    
    shader_set_uniform_f(u_sectBotOff,zadd);
    shader_set_uniform_f(u_sectTopOff,crushing);
    
    if ctex!="-"{
        ctex=ds_map_find_value(pload_flats,ctex);
        if !is_undefined(ctex)
        if sprite_exists(ctex)
            texture_set_stage(shd_ctex,sprite_get_texture(ctex,0));
    }
    if ctex!="-"{
    ftex=ds_map_find_value(pload_flats,ftex);
    if !is_undefined(ftex)
        if sprite_exists(ftex)
        ttex=sprite_get_texture(ftex,0);
    }
            vertex_submit(vbuffer,pr_trianglelist,ttex);

}
//window_set_caption(str)
shader_reset();

shader_set(shd_Sidedef);
shader_set_uniform_f(u_fogColorS,color_get_red((fcol))/255,color_get_green((fcol))/255,color_get_blue((fcol))/255,1);
shader_set_uniform_f(u_fogMaxDistS,f_far*0.9);
shader_set_uniform_f(u_fogMinDistS,f_near);

var sides = ds_map_find_value_fixed(wad_levels,"sidedefs");
var lines = ds_map_find_value_fixed(wad_levels,"linedefs");

for (j = 0; j<ds_list_size(sides); j++ ){
    
    var side = ds_list_find_value_fixed(sides,j);
    
    var s=ds_map_find_value(side,"sector");
    var b=ds_map_find_value(side,"bsect");
    s = ds_list_find_value(sects,s);
    b = ds_list_find_value(sects,b);
    var zadd = ds_map_find_value_fixed(s,"lift");
    
    shader_set_uniform_f(u_midBotOff,zadd);
    var crushing = ds_map_find_value(b,"crush");
    
    shader_set_uniform_f(u_lowBotOff,zadd);
    shader_set_uniform_f(u_upBotOff,crushing);
    
    zadd = ds_map_find_value_fixed(b,"lift");
    shader_set_uniform_f(u_lowTopOff,zadd);
        
    crushing = ds_map_find_value(s,"crush");
    shader_set_uniform_f(u_midTopOff,crushing);
    
    shader_set_uniform_f(u_upTopOff,crushing);
    
    
    var l = ds_map_find_value_fixed(side,"linedef");
    l = ds_list_find_value_fixed(lines,l);
    var flags = ds_map_find_value_fixed(l,"flags");
    
    var val=ds_map_find_value_fixed(flags,"peg_lower");
    if is_real(val)
    shader_set_uniform_f(u_LowPeg,val);
    
    val=ds_map_find_value_fixed(flags,"peg_upper");
    if is_real(val)
    shader_set_uniform_f(u_UpPeg,val);
    

    var vbuffer=ds_map_find_value_fixed(side,"vbuffer");
    var tex_l=ds_map_find_value_fixed(side,"tex_l");
    var tex_u=ds_map_find_value_fixed(side,"tex_u");
    var tex_m=ds_map_find_value_fixed(side,"tex_m");
    
    
    if tex_l!="-" or tex_u!="-" or tex_m!="-"{
        
        tex_l=ds_map_find_value(pload_tex,tex_l);
        tex_u=ds_map_find_value(pload_tex,tex_u);
        tex_m=ds_map_find_value(pload_tex,tex_m);
        
        if is_undefined(tex_m){
            tex_m=-1;
        }else{
            shader_set_uniform_f(u_TexHM,surface_get_height(tex_m));
        }
        
        if !is_undefined(tex_l){
            if surface_exists(tex_l){
                shader_set_uniform_f(u_TexHL,surface_get_height(tex_l));
                texture_set_stage(shd_ltex,surface_get_texture(tex_l));
            }
        }else texture_set_stage(shd_ltex,0);
        
        if !is_undefined(tex_u){
            if surface_exists(tex_u){
                shader_set_uniform_f(u_TexHU,surface_get_height(tex_u));
                texture_set_stage(shd_utex,surface_get_texture(tex_u));
            }
            
        }else texture_set_stage(shd_utex,0);
        
        vertex_submit(vbuffer,pr_trianglelist,surface_get_texture(tex_m));
    }

}

shader_reset();

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

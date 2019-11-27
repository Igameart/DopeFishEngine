/// @description Draw the Background & Do Projection

d3d_set_projection_ext(x,y,z+eyes,x+cam_x,y+cam_y,z+eyes+cam_z, 0,0,1, 65,__view_get( e__VW.WView, 0 )/__view_get( e__VW.HView, 0 ),0.2,f_far);

DE_RenderWorld()

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
/*  */

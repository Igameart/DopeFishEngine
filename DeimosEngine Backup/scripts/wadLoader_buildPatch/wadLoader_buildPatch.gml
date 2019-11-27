
var data=argument0;
patch_width=argument1;
patch_height=argument2;

var surf=surface_create(patch_width,patch_height+1);

cyan=make_color_rgb(0,255,255);

surface_set_target(surf);
draw_clear(cyan);
draw_set_alpha(1);
var idx=0;
var pal1;
for(var h=0;h<patch_height;h+=1){
    for(var w=0;w<patch_width;w+=1){
        pal1=ds_grid_get(data,w,h)
        if pal1>=0{
            var pal2=ds_list_find_value_fixed(wadPlaypal,0);
            var col=ds_list_find_value_fixed(pal2,pal1);
            draw_set_color(col);
            //if col!=cyan
            //    draw_set_alpha(1);
            //else
            //    draw_set_alpha(0);
            draw_point(w,h);
        }
    }
}

surface_reset_target();

var data2=sprite_create_from_surface(surf,0,0,patch_width,patch_height+1,1,0,0,0);

surface_free(surf);

return data2;

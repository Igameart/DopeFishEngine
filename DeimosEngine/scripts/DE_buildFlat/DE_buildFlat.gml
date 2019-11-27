
//var dat=argument0;
patch_width=64;
patch_height=64;

var surf=surface_create(64,64);

//cyan=make_color_rgb(0,255,255);

surface_set_target(surf);
draw_clear(0);
draw_set_alpha(1);
var idx=0;
var pal1;
for(h=0;h<64;h+=1){
    for(w=0;w<64;w+=1){
        pal1=ds_list_find_value_fixed(argument0,idx)
        idx+=1;
        if !ds_exists(wadPlaypal,ds_type_list) show_message("PlayPal does not exists");
        var pal2=ds_list_find_value_fixed(wadPlaypal,0);
        if !ds_exists(pal2,ds_type_list) show_message("Pal2 does not exists");
        var col=ds_list_find_value_fixed(pal2,pal1);
        draw_set_color(col);
        draw_point(w,h);
    }
}

surface_reset_target();

var data2=sprite_create_from_surface(surf,0,0,64,64,0,0,0,0);

surface_free(surf);

return data2;

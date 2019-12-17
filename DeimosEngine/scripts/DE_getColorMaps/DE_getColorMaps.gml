//var l,len,curl,pcount,patch;

maps=1;
wadColorMaps=ds_grid_create(maps,256);
wadPlaypal=ds_list_build();
globalvar wadPlaypalRAW;
wadPlaypalRAW=ds_list_build();
tmp=ds_list_build();
tmp2=ds_list_build();

DE_bufferSeekLump(("COLORMAP"));

show_debug_message("NOTICE: Found COLORMAP at: "+string(buffer_tell(wadbuff)));

for(var cm=0;cm<maps;cm++){
	for(var p=0;p<256;p++)
		ds_grid_set(wadColorMaps,cm,p,buffer_read(wadbuff,buffer_u8));
	}


buffer_seek(wadbuff,buffer_seek_start,DE_getLumpOfs("PLAYPAL"));

show_debug_message("NOTICE: Found PLAYPAL at: "+string(buffer_tell(wadbuff)));

for(var pal=0;pal<1;pal++){
	for(var w=0;w<16;w++)
		for(var h=0;h<16;h++){
			var r=buffer_read(wadbuff,buffer_u8);
			var g=buffer_read(wadbuff,buffer_u8);
			var b=buffer_read(wadbuff,buffer_u8);
			//ds_grid_set(tmp,w,h,make_color_rgb(r,g,b));
			ds_list_add(tmp,make_color_rgb(r,g,b));
			ds_list_add(tmp2,[r,g,b]);
		}
		
ds_list_add(wadPlaypal,tmp);
ds_list_add(wadPlaypalRAW,tmp2);
}

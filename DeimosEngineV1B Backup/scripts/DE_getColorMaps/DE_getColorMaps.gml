function DE_getColorMaps() {
	//var l,len,curl,pcount,patch;

	var maps=1;
	wadColorMaps=ds_grid_create(maps,256);
	wadPlaypal=ds_list_build();
	globalvar wadPlaypalRAW;
	wadPlaypalRAW=ds_list_build();
	var tmp=ds_list_build();
	//var tmp2=ds_list_build();

	DE_bufferSeekLump("COLORMAP");

	//trace("NOTICE: Found COLORMAP at: "+string(buffer_tell(wadbuff)));

	for(var cm=0;cm<maps;cm++){
		for(var p=0;p<256;p++)
			var __PlayPalIndex = buffer_read(wadbuff,buffer_u8);
			ds_grid_set(wadColorMaps,cm,p,__PlayPalIndex);
		}


	buffer_seek(wadbuff,buffer_seek_start,DE_getLumpOfs("PLAYPAL"));

	//trace("NOTICE: Found PLAYPAL at: "+string(buffer_tell(wadbuff)));

	for(var pal=0;pal<1;pal++){
		for(var w=0;w<16;w++)
			for(var h=0;h<16;h++){
				var r=buffer_read(wadbuff,buffer_u8);
				var g=buffer_read(wadbuff,buffer_u8);
				var b=buffer_read(wadbuff,buffer_u8);
				ds_list_add(tmp,make_color_rgb(r,g,b));
				
				/*var a = 255;
				if r == 255 & b == 255 && g == 0 a = 0;
				
				ds_list_add(tmp2,[r,g,b,a]);*/
			}
		
	ds_list_add(wadPlaypal,tmp);
	//ds_list_add(wadPlaypalRAW,tmp2);
	}
}

function DE_ColorMapGetColor(__CMI) {
	if __CMI == undefined return undefined;
	// CMI = color map index
		
	//PlayPal Index
	var __PPI = buffer_peek(wadbuff,wadDirectoryOfs[?"COLORMAP"] + __CMI , buffer_u8);
		
	//PlayPal Position	
	buffer_seek(wadbuff,buffer_seek_start, wadDirectoryOfs[? "PLAYPAL" ] + __PPI * 3 );

	var r=buffer_read(wadbuff,buffer_u8);
	var g=buffer_read(wadbuff,buffer_u8);
	var b=buffer_read(wadbuff,buffer_u8);
	var __col = make_color_rgb(r,g,b);
	
	return __col;
	
}

function DE_ColorMapGetColorValues(__CMI) {
	if __CMI == undefined return undefined;
	// CMI = color map index
		
	//PlayPal Index
	var __PPI = buffer_peek(wadbuff,wadDirectoryOfs[?"COLORMAP"] + __CMI , buffer_u8);
		
	//PlayPal Position	
	buffer_seek(wadbuff,buffer_seek_start, wadDirectoryOfs[? "PLAYPAL" ] + __PPI * 3 );

	var r=buffer_read(wadbuff,buffer_u8);
	var g=buffer_read(wadbuff,buffer_u8);
	var b=buffer_read(wadbuff,buffer_u8);
	//var __col = make_color_rgb(r,g,b);
	
	return [r,g,b,255];
	
}

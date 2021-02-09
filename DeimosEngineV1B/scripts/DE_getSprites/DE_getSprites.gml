function DE_getSprites() {
	var l,b;

	globalvar wadSprites;
	wadSprites=ds_map_build();

	globalvar DESprites;
	DESprites = ds_map_build();

	var readSprites=false;
	for(l=0;l<ds_list_size(wadDirectory);l+=1){
	    var lump=ds_list_find_value_fixed(wadDirectory,l);
	    var n=ds_map_find_value_fixed(lump,"name")
	
		var soff=DE_getLumpOfs(n);
	
	    switch(n){
	        case "S_START":
			case "S_END":
				readSprites=!readSprites;
			break;
		
	        default:
		
	        if(readSprites){
	            buffer_seek(wadbuff,buffer_seek_start,ds_map_find_value_fixed(lump,"filepos"));
			
				//show_debug_message("NOTICE: Found SPRITE:"+n);
			
				var _spr = ds_map_create();			

				var spr_width=buffer_read(wadbuff,buffer_u16);
				var spr_height=buffer_read(wadbuff,buffer_u16);

				ds_map_add(_spr,"width",spr_width);
				ds_map_add(_spr,"height",spr_height);
				ds_map_add(_spr,"o_left",buffer_read(wadbuff,buffer_s16));
				ds_map_add(_spr,"o_top",buffer_read(wadbuff,buffer_s16));
			
				//trace("Sprite Size:",spr_width,spr_height);
		
	            var data=ds_grid_build(spr_width,spr_height);
				ds_grid_clear(data,-1);

				var offsets;
				for(var o=0;o<spr_width;o++){
				    offsets[o]=buffer_read(wadbuff,buffer_u32);
				}

				var pixcount=0;
				var dummy=0;
			
				for(var w=0;w<spr_width;w++){
				    buffer_seek(wadbuff,buffer_seek_start,soff+offsets[w]);

				    var rowstart=0;
				    while((rowstart)!=255){
					
				        rowstart=buffer_read(wadbuff,buffer_u8)
				        if rowstart=255 break;
        
				        pixcount=buffer_read(wadbuff,buffer_u8);
					
				        dummy=buffer_read(wadbuff,buffer_u8);
					
					
						//trace("Sprite Row Data:",rowstart,pixcount);
        
				        for(var h=0;h<pixcount;h+=1){
				            var val=buffer_read(wadbuff,buffer_u8);
				            ds_grid_set(data,w,rowstart+h,val);
				        }
        
				        dummy=buffer_read(wadbuff,buffer_u8);
				    }
				}

				//data=DE_build(data,patch_width,patch_height);

				ds_map_replace(_spr,"data",data);
				//ds_list_add(wadPatches,patch);
			
	            ds_map_add(wadSprites,n,_spr);
	        }
		
	        break;
	    }
	
	}


	show_debug_message("NOTICE: Found "+string(ds_map_size(wadSprites))+" SPRITES.");


}

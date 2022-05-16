function DE_readTextures(lump, tcount, offsets){
	
	for(var t=0;t<tcount;t+=1){
	    var pos	= lump.filepos + ds_list_find_value_fixed(offsets,t);
            
	    buffer_seek(wadbuff,buffer_seek_start,pos);
            
	    var tname = string_upper(buffer_read_string(wadbuff,8));
            
	    //trace("NOTICE: Found "+tname+" in Lump["+n+"]");
        
	    var texture	= struct_copy(maptexturetype);
		
			if wadGameInfo.game != "Strife"{
				texture.masked = buffer_read(wadbuff,buffer_u32);
				var wide,high;
				wide=buffer_read(wadbuff,buffer_s16);
				high=buffer_read(wadbuff,buffer_s16);
				texture.width	= wide;
				texture.height	= high;
				texture.columndirectory	= buffer_read(wadbuff,buffer_s32);
				texture.patchcount	= buffer_read(wadbuff,buffer_s16);
			}else{
				
				//texture.name = buffer_read(wadbuff,buffer_s8);
				texture.masked = buffer_read(wadbuff,buffer_u32);
				var wide,high;
				
				wide=buffer_read(wadbuff,buffer_s16);
				high=buffer_read(wadbuff,buffer_s16);
				
				texture.width	= wide;
				texture.height	= high;
				
				//texture.columndirectory	= buffer_read(wadbuff,buffer_s32);
				
				texture.patchcount	= buffer_read(wadbuff,buffer_s16);
				
			}
            
		trace("NOTICE: Found "+string(texture.patchcount)+" wadPatches in Texture["+tname+"]");
		
		var patchdat=ds_list_build();
		
		for(var p=0;p<texture.patchcount;p+=1){
		    
			var patch = struct_copy(mappatchtype);
						
			
			if wadGameInfo.game!="Strife"{
			    var ox	= buffer_read(wadbuff,buffer_s16);
			    var oy	= buffer_read(wadbuff,buffer_s16);
            
			    if tname="BIGDOOR6"{
			        if p==2 ox=-116;
			    }if tname="BIGDOOR7"{
			        if p==0 ox=-4;
			        if p==0 oy=-4;
			        if p==1 oy=-4;
			    }if tname="COMPOHSO"{
			        if p==2 oy=-2;
			        if p==3 oy=-2;
			    }if tname="GRAY2"{
			        if p==0 oy=-8;
			    }if tname="GRAYVINE"{
			        if p==2 oy=-16;
			        if p==3 oy=-16;
			    }if tname="ICKWALL7"{
			        if p==3 ox=-1;
			    }if tname="LITE96"{
			        if p==0 oy=-1;
			    }if tname="LITERED"{
			        if p==0 ox=-4;
			        if p==1 ox=-4;
			    }if tname="NUKEPOIS"{
			        if p==9 ox=-1;
			    }if tname="SKULWAL3"{
			        if p==9 ox=-12;
			    }if tname="SKULWALL"{
			        if p==0 ox=-4;
			    }if tname="SW1CMT"{
			        if p==0 ox=-42;
			    }if tname="SW1VINE"{
			        if p==0 oy=-16;
			    }if tname="SW1WOOD"{
			        if p==0 ox=-64;
			    }if tname="SW2CMT"{
			        if p==0 ox=-42;
			    }if tname="SW2VINE"{
			        if p==1 oy=-16;
			    }if tname="SW2WOOD"{
			        if p==0 ox=-64;
			    }if tname="WOOD3"{
			        if p==0 ox=-4;
			    }if tname="WOOD4"{
			        if p==0 ox=-4;
			    }if tname="WOOD5"{
			        if p==0 ox=-4;
			    }                  
			    if tname="AASTINKY"{
			        if p==1 oy=-6;
			    }if tname="BROWN144"{
			        if p==5 oy=-1;
			        if p==6 oy=-16;
			    }if tname="SKY1"{
			        if p==0 oy=-8;
			    }if tname="SW1DIRT"{
			        if p==3 oy=-16;
			    }if tname="SW2DIRT"{
			        if p==3 oy=-1;
			    }if tname="TEKWALL1"{
			        if p==0 oy=-27;
			    }if tname="TEKWALL3"{
			        if p==0 ox=-104;
			        if p==0 oy=0;
			    }if tname="TEKWALL5"{
			        if p==0 ox=-120;
			        if p==0 oy=-8;
			    }
                                
			    patch.originx = ox;
			    patch.originy = oy;
					
			    var num=buffer_read(wadbuff,buffer_s16);
			    var name=ds_list_find_value_fixed(wadPNames,num);
					
			    patch.patch = name;
					
			    patch.stepdir = buffer_read(wadbuff,buffer_s16);//Unused
			    patch.colormap = buffer_read(wadbuff,buffer_s16);//Unused
			}else{
			    var ox	= buffer_read(wadbuff,buffer_s16);
			    var oy	= buffer_read(wadbuff,buffer_s16);
            
			    if tname="BIGDOOR6"{
			        if p==2 ox=-116;
			    }if tname="BIGDOOR7"{
			        if p==0 ox=-4;
			        if p==0 oy=-4;
			        if p==1 oy=-4;
			    }if tname="COMPOHSO"{
			        if p==2 oy=-2;
			        if p==3 oy=-2;
			    }if tname="GRAY2"{
			        if p==0 oy=-8;
			    }if tname="GRAYVINE"{
			        if p==2 oy=-16;
			        if p==3 oy=-16;
			    }if tname="ICKWALL7"{
			        if p==3 ox=-1;
			    }if tname="LITE96"{
			        if p==0 oy=-1;
			    }if tname="LITERED"{
			        if p==0 ox=-4;
			        if p==1 ox=-4;
			    }if tname="NUKEPOIS"{
			        if p==9 ox=-1;
			    }if tname="SKULWAL3"{
			        if p==9 ox=-12;
			    }if tname="SKULWALL"{
			        if p==0 ox=-4;
			    }if tname="SW1CMT"{
			        if p==0 ox=-42;
			    }if tname="SW1VINE"{
			        if p==0 oy=-16;
			    }if tname="SW1WOOD"{
			        if p==0 ox=-64;
			    }if tname="SW2CMT"{
			        if p==0 ox=-42;
			    }if tname="SW2VINE"{
			        if p==1 oy=-16;
			    }if tname="SW2WOOD"{
			        if p==0 ox=-64;
			    }if tname="WOOD3"{
			        if p==0 ox=-4;
			    }if tname="WOOD4"{
			        if p==0 ox=-4;
			    }if tname="WOOD5"{
			        if p==0 ox=-4;
			    }                  
			    if tname="AASTINKY"{
			        if p==1 oy=-6;
			    }if tname="BROWN144"{
			        if p==5 oy=-1;
			        if p==6 oy=-16;
			    }if tname="SKY1"{
			        if p==0 oy=-8;
			    }if tname="SW1DIRT"{
			        if p==3 oy=-16;
			    }if tname="SW2DIRT"{
			        if p==3 oy=-1;
			    }if tname="TEKWALL1"{
			        if p==0 oy=-27;
			    }if tname="TEKWALL3"{
			        if p==0 ox=-104;
			        if p==0 oy=0;
			    }if tname="TEKWALL5"{
			        if p==0 ox=-120;
			        if p==0 oy=-8;
			    }
                                
			    patch.originx = ox;
			    patch.originy = oy;
					
			    var num=buffer_read(wadbuff,buffer_s16);
			    var name=ds_list_find_value_fixed(wadPNames,num);
					
			    patch.patch = name;			
			}
					
		    ds_list_add(patchdat,patch);
		}
	            
		texture.patches = patchdat;
            
		ds_map_add(textures,tname,texture);
	}
}

function DE_getWallTextures() {

	var l,len,curl,tcount;
	var offsets=ds_list_build();
	var offsets2=ds_list_build();

	globalvar textures;
	textures=ds_map_build();

	for(l=0;l<ds_list_size(wadDirectory);l+=1){
	    var lump= ds_list_find_value_fixed(wadDirectory,l);
	    var n	= lump.name;
    
	    switch(n){
	        case "TEXTURE1":
			
	        buffer_seek(wadbuff,buffer_seek_start,lump.filepos);
			
	        tcount=buffer_read(wadbuff,buffer_u32);
        
	        trace("NOTICE: Found "+string(tcount)+" textures in Lump["+string(l)+"]: "+n);
        
	        repeat tcount
	            ds_list_add(offsets,buffer_read(wadbuff,buffer_u32));
				
			DE_readTextures(lump, tcount, offsets);
	    break;
    
	    case "TEXTURE2":
	        
	        buffer_seek(wadbuff,buffer_seek_start, lump.filepos);
	        tcount=buffer_read(wadbuff,buffer_u32);
        
	        trace("NOTICE: Found "+string(tcount)+" textures in Lump["+string(l)+"]: "+n);
        
	        repeat tcount
	            ds_list_add(offsets2,buffer_read(wadbuff,buffer_u32));
			
			DE_readTextures(lump, tcount, offsets2);
	    break;
	    }
	}

	ds_list_destroy(offsets);
	ds_list_destroy(offsets2);

}

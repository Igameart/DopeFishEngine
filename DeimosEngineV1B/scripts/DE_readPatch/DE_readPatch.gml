function DE_readPatch() {
	var pName = argument[0];

	var patch = ds_list_find_index(wadPNames,pName);

	if patch == -1 return undefined;

	var poff=DE_getLumpOfs(ds_list_find_value_fixed(wadPNames,patch));

	if(poff<0){
		trace("WARNING: Missing or invalid Patch:"+pName);
		//this usually happens when loading from the shareware wad, all the patch names are here, but many wadPatches are actually not included in the wad
		return false;
	}

	buffer_seek(wadbuff,buffer_seek_start,poff);
	var patchDat=ds_map_build();

	var patch_width=buffer_read(wadbuff,buffer_u16);
	var patch_height=buffer_read(wadbuff,buffer_u16);

	ds_map_add(patchDat,"width",patch_width);
	ds_map_add(patchDat,"height",patch_height);
	ds_map_add(patchDat,"o_left",buffer_read(wadbuff,buffer_s16));
	ds_map_add(patchDat,"o_top",buffer_read(wadbuff,buffer_s16));
	ds_map_add(patchDat,"data", 0);


	var data=ds_grid_build(patch_width,patch_height+2);
	ds_grid_clear(data,-1);

	var offsets;
	for(var o=0;o<patch_width;o++){
		offsets[o]=buffer_read(wadbuff,buffer_u32);//this.view.getUint32();
	}

	
	for(var w=0; w<patch_width; w++){
		
		var count=0;
		var dummy=0;
		
		buffer_seek(wadbuff,buffer_seek_start,poff+offsets[w]);

		var top = -1;
		var topdelta = 0;
		var oldlength = 0;
		while( topdelta != 0xff ){
			
			var len = oldlength;
			topdelta=buffer_read(wadbuff,buffer_u8);
			//if topdelta == 0xff break;
			
			// support for DeePsea tall patches
			if (topdelta <= top)
			{
				top += topdelta;
			}
			else
			{
				top = topdelta;
			}
			
			len=buffer_read(wadbuff,buffer_u8);
			
				// Clip posts that extend past the bottom
	        if (top + oldlength > patch_height)
	            len = patch_height - top;
			
			dummy=buffer_read(wadbuff,buffer_u8);
			
			//var position = top;
			
			
			if len>0
			for(var h=0; h < len; h++){
				
			    var val=buffer_read(wadbuff,buffer_u8);
				
				if h+top<patch_height
					ds_grid_set(data,w,h+top,val);
				
			}
        
			oldlength = count;
        
			dummy=buffer_read(wadbuff,buffer_u8);
		}
	}

	//data=DE_buildPatch(data,patch_width,patch_height);

	ds_map_replace(patchDat,"data",data);

	var name=ds_list_find_value_fixed(wadPNames,patch);

	ds_map_add(wadPatches,name,patchDat);

	return patchDat;


}

function DE_spriteCreateVBuffer(__x1, __y1, __z1, __x2, __y2, __z2, __tex, __isMirr ) {

	var __xdiff = __x2 - __x1;
	var __ydiff = __y2 - __y1;

	var __lsquared = (__xdiff * __xdiff) + (__ydiff * __ydiff);
	
	var __l = sqrt(__lsquared);

	var __nx = __ydiff / __l;
	var __ny = -__xdiff / __l;

	global.__d3dPrimTex = __tex;
	var __uvs = texture_get_uvs(__tex);
	global.__d3dPrimTexX = __uvs[0];
	global.__d3dPrimTexY = __uvs[1];
	global.__d3dPrimTexW = __uvs[2] - __uvs[0];
	global.__d3dPrimTexH = __uvs[3] - __uvs[1];
	
	vertex_begin( global.__d3dPrimBuffer, global.__d3dPrimVF );
	
	if __isMirr != true{
		
		d3d_vertex_normal_texture(__x1, __y1, __z1, __nx, __ny, 0, 1, 1);
		d3d_vertex_normal_texture(__x2, __y2, __z1, __nx, __ny, 0, 0, 1);
		d3d_vertex_normal_texture(__x2, __y2, __z2, __nx, __ny, 0, 0, 0);
		d3d_vertex_normal_texture(__x1, __y1, __z2, __nx, __ny, 0, 1, 0);
		
	}else{
		
		d3d_vertex_normal_texture(__x1, __y1, __z1, __nx, __ny, 0, 0, 1);
		d3d_vertex_normal_texture(__x2, __y2, __z1, __nx, __ny, 0, 1, 1);
		d3d_vertex_normal_texture(__x2, __y2, __z2, __nx, __ny, 0, 1, 0);
		d3d_vertex_normal_texture(__x1, __y1, __z2, __nx, __ny, 0, 0, 0);
		
	}

	vertex_end( global.__d3dPrimBuffer );
	
	var __tBuff = buffer_create_from_vertex_buffer(global.__d3dPrimBuffer,buffer_vbuffer,1);
	var __buffer = vertex_create_buffer_from_buffer(__tBuff,global.__d3dPrimVF);
	
	buffer_delete(__tBuff);

	return __buffer;

}

function DE_parseSpriteName( __sprDB, __name ){
	
	trace("NOTICE: Parsing Sprite Info",__name);
	
	var __fDat = __sprDB.frames;
	
	var __sprNFO = string_to_list( string_copy( __name, 5, 99 ) );
	var __mirrored = false;
	
	if __sprDB.directional == false
	if __sprNFO[| 1] != 0{
		
		trace("NOTICE: Sprite "+__name, "Is Directional");
		__sprDB.directional = true;
		
	}
	
	var num = 0;
	var __L = ds_list_size( __sprNFO );
	
	repeat min(__L/2,2){
		
		var __Frame	= __sprNFO[| num++];
		var __Angle	= __sprNFO[| num++];
		
		if __mirrored{
			trace("NOTICE: Sprite Frame "+__name, __Frame + __Angle, "Is Mirrored");
			
			var __tName = string_copy(__name,1,4) + __Frame + __Angle;
			wadSpritesMir[? __tName ] = true;
			
		}else
		
		if __Angle == "0" and __sprDB.directional == true{
			var __tName = string_copy(__name,1,4)+__Frame;
			wadSpritesDir[? __tName ] = false;
		}
		
		__fDat[? __Frame+__Angle ] = __name;
		
		__mirrored = true;
		
	}
	
}

function DE_getSprites() {

	globalvar wadSprites;
	wadSprites=ds_map_build();

	globalvar DESprites;
	DESprites = ds_map_build();

	var readSprites=false;
	
	for(var l=0;l<ds_list_size(wadDirectory);l+=1){
	    
		var lump = ds_list_find_value_fixed(wadDirectory,l);
		
	    var n=lump.name;
	
		var soff=DE_getLumpOfs(n);
	
	    switch(n){
	        case "S_START":
			case "S_END":
				readSprites=!readSprites;
			break;
		
	        default:
		
	        if(readSprites){
				
	            buffer_seek(wadbuff,buffer_seek_start,lump.filepos);
				
				var __sprName = string_copy( n, 1, 4);
				
				var __sprDB = wadSpriteDB[? __sprName ];
				
				if __sprDB == undefined{
					
					trace("NOTICE: creating database for SPRITE:", __sprName);
					
					__sprDB = struct_copy(sprdbtype);
					__sprDB.frames = ds_map_build();
					__sprDB.directional = false;
					
					wadSpriteDB[? __sprName ] = __sprDB;
					
				}
				
				DE_parseSpriteName( __sprDB, n );
			
				var _spr = struct_copy(patchtype);			

				var spr_width	= buffer_read(wadbuff,buffer_u16);
				var spr_height	= buffer_read(wadbuff,buffer_u16);
				var spr_left	= buffer_read(wadbuff,buffer_s16);
				var spr_top		= buffer_read(wadbuff,buffer_s16);

				_spr.width	= spr_width;
				_spr.height	= spr_height;
				_spr.leftoff= spr_left;
				_spr.topoff	= spr_top;
		
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
					        
				        for(var h=0;h<pixcount;h+=1){
				            var val=buffer_read(wadbuff,buffer_u8);
				            ds_grid_set(data,w,rowstart+h,val);
				        }
        
				        dummy=buffer_read(wadbuff,buffer_u8);
				    }
				}

				//data=DE_build(data,patch_width,patch_height);

				_spr.contents = data;
			
	            ds_map_add( wadSprites, n, _spr );
	        }
		
	        break;
	    }
	
	}

	show_debug_message("NOTICE: Found "+string(ds_map_size(wadSprites))+" SPRITES.");

}

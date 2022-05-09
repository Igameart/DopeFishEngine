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

function DE_buildSprite( __sprName ){
	
	var __sprDat = wadSprites[? __sprName ];
	
	if __sprDat == undefined{
		trace("Cannot find sprite",__sprName);
		return noone;
	}
				
	if DESprites[? __sprName ] == undefined{
				
		var __spr = DE_buildPatch(__sprDat);
		return __spr;
		
	}else return DESprites[? __sprName ];
}

function DE_buildGraphic( __sprName ){
				
	if is_undefined(DESprites[? __sprName ]){
		
		var filter = gpu_get_tex_filter();
		display_reset(0,1);
		
		var bPos = buffer_tell(wadbuff);
		
		var l = DE_getLumpNum( __sprName );
		
		if is_undefined(l) return noone;
		
		var lump = ds_list_find_value_fixed(wadDirectory,l);
	
		var goff=DE_getLumpOfs(__sprName);
	
		buffer_seek(wadbuff,buffer_seek_start,lump.filepos);
				
		var __sprDB = wadSpriteDB[? __sprName ];
				
		if __sprDB == undefined{
					
			trace("NOTICE: creating database for GRAPHIC:", __sprName);
					
			__sprDB = struct_copy(sprdbtype);
			__sprDB.frames = ds_map_build();
			__sprDB.directional = false;
					
			wadSpriteDB[? __sprName ] = __sprDB;
					
		}
							
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
			buffer_seek(wadbuff,buffer_seek_start,goff+offsets[w]);

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
	
		_spr.contents = data;

		var __gfxDat = _spr;
				
		var __spr = DE_buildPatch(__gfxDat);
		
		buffer_seek(wadbuff,buffer_seek_start,bPos);
		
		gpu_set_tex_filter(filter);
		display_reset(4,1);
		
		DESprites[? __sprName ] = __spr;
		
		return __spr;
		
	}else return DESprites[? __sprName ];
}

function DE_drawimage(){//Draw an image into gui space
	var __sprName = argument[0], xx = argument[1], yy = argument[2];
	 
	if argument_count>3{
		
	}
	
	var spr = DESprites[? __sprName ];
	if is_undefined(spr){
		spr = DE_buildGraphic(__sprName);
	}
	
	//Convert gui scale to 320 width so things fill the right space on screen
	var ww,hh;

	ww = surface_get_width(application_surface);
	hh = surface_get_height(application_surface);

	//surface_set_target(application_surface);

	var _scale = 1;
	//if RFXenabled _scale *= RFXscale;

	var ss = ww / 320;
	
	draw_sprite_ext(spr,0,xx*ss/_scale,(yy)*ss/_scale,ss/_scale,ss/_scale,0,c_white,1);
	
}

function DE_drawswitchableimage(){//Draw an image into gui space
	var __key = argument[0], __spr,xx,yy;
	
	 
	if argument_count>5{
		
	}
	
	var __sprName;
	
	if is_string(__key){
		__spr[0] = argument[1];
		__spr[1] = argument[2];
		xx = argument[3];
		yy = argument[4];
		
		switch __key{
			case "invulnerable":
				__sprName = __spr[!IDDQD];
			break;
		}
	}else{
		if is_real(__key){
			__spr[0] = argument[1];
			__spr[1] = argument[2];
			xx = argument[3];
			yy = argument[4];
			__sprName = __spr[__key];
		}else
		if is_array(__key){
			
			xx = argument[5];
			yy = argument[6];
			
			__spr[0] = argument[1];
			__spr[1] = argument[2];
			__spr[2] = argument[3];
			__spr[3] = argument[4];
			
			__sprName = __spr[0];
			if __key[0] and __key[1]{
				__sprName = __spr[3];
			}else{
				if __key[0] __sprName = __spr[1];
				if __key[1] __sprName = __spr[2];
			}
			//trace("Chosen Sprite", __sprName);
		}
	}
	
	if __sprName == "nullimage" return noone;
	
	var spr = DESprites[? __sprName ];
	if is_undefined(spr){
		spr = DE_buildGraphic(__sprName);
	}
	
	//Convert gui scale to 320 width so things fill the right space on screen
	var ww,hh;

	ww = surface_get_width(application_surface);
	hh = surface_get_height(application_surface);

	//surface_set_target(application_surface);

	var _scale = 1;
	//if RFXenabled _scale *= RFXscale;

	var ss = ww / 320;
	
	draw_sprite_ext(spr,0,xx*ss/_scale,(yy)*ss/_scale,ss/_scale,ss/_scale,0,c_white,1);
	
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

				_spr.contents = data;
			
	            ds_map_add( wadSprites, n, _spr );
	        }
		
	        break;
	    }
	
	}

	show_debug_message("NOTICE: Found "+string(ds_map_size(wadSprites))+" SPRITES.");

}

function DE_drawimage_tiledx(){
	var __sprName = argument[0], xx = argument[1], yy = argument[2];
	 
	if argument_count>3{
		
	}
		
	var spr = DESprites[? __sprName ];
	if is_undefined(spr){
		spr = DE_buildGraphic(__sprName);
	}
	
	//Convert gui scale to 320 width so things fill the right space on screen
	var ww,hh;

	ww = surface_get_width(application_surface);
	hh = surface_get_height(application_surface);

	var _scale = 1;

	var ss = ww / 320;
	var i;
	
	var sw = sprite_get_width(spr);
	
	do{
		xx -= sw;
	}until xx < 0;
	
	for (i=xx; i<=320; i+=sw){
		draw_sprite_ext(spr,0,(i)*ss/_scale,yy*ss/_scale,ss/_scale,ss/_scale,0,c_white,1);
	}
	
}

function DE_drawgem(){
	
	var flags = [];
	var chainimage = undefined,gemimage = undefined;
	var a = 0;
	var wiggle, trans, armor, reverse, interpolate;
	
	if is_array(argument[a]){//First argument is array, these are flags
		flags = argument[a++];
		
		wiggle = array_find_index(flags,"wiggle")!=-1;
		
		trans = array_find_index(flags,"translatable")!=-1;
		
		armor = array_find_index(flags,"armor")!=-1;
		
		reverse = array_find_index(flags,"reverse")!=-1;
		
		interpolate = array_find_index(flags,"interpolate")!=-1;
	}
	
	if is_string(argument[a]){//Got chain image
		//if is_undefined(chainimage)
		chainimage = argument[a++];
	}
	
	if is_string(argument[a]){//Got gem image
		//if is_undefined(gemimage)
		gemimage = argument[a++];
	}
	var displayvalue,maxrange,left,right,chainmod,xx,yy;
	
	displayvalue = argument[a++];
	maxrange = argument[a++];
	
	left = argument[a++];
	right = argument[a++];
	
	chainmod = argument[a++];
	
	xx = argument[a++];
	yy = argument[a++];
	
	displayvalue = clamp(displayvalue, 0, maxrange);
	
	var offset = 0;
	
	var chain = DESprites[? chainimage ];
	
	if !is_undefined(chain)
	if sprite_exists(chain){
		
		var chainsize = sprite_get_width(chain);
		
		displayvalue = clamp(displayvalue, 0, maxrange);
		
		offset = ( (chainsize - left - right) * (displayvalue / maxrange) );
		
		//trace(chainimage, chainsize, offset, displayvalue, maxrange );
		//show_message("Chain sprite exists");
		//game_end();
		
	}
	
	DE_drawimage_tiledx(chainimage, xx + offset, yy);//, flags | DI_ITEM_LEFT_TOP);
	DE_drawimage(gemimage, xx + offset, yy );
	
}

function DE_drawshader( width, height, dir, flip, xx, yy){
	
	if dir = "horizontal"{
		if flip!="reverse"{
			col1 = c_ltgray;
			col2 = c_black;
			col3 = c_black;
			col4 = c_ltgray;
		}else{
			col1 = c_black;
			col2 = c_ltgray;
			col3 = c_ltgray;
			col4 = c_black;
		}
	}else{
		if flip!="reverse"{
			col1 = c_ltgray;
			col2 = c_ltgray; 
			col3 = c_black;
			col4 = c_black;
		}else{
			col1 = c_black;
			col2 = c_black;
			col3 = c_ltgray; 
			col4 = c_ltgray;
		}
	}
	
	var ww;

	ww = surface_get_width(application_surface);

	var ss = ww / 320;

	var ss = ww / 320;
	
	gpu_set_blendmode(bm_subtract);
	draw_rectangle_color(xx*ss,yy*ss,(xx+width)*ss,(yy+height)*ss, col1, col2, col3, col4, false);
	gpu_set_blendmode(bm_normal);
	
}

function DE_drawStatusBar(){
	switch DENAMESPACE{
		case DEnameSpaces.DOOM:
		DE_drawDoomStatusBar();
		break;
		case DEnameSpaces.HERETIC:
		DE_drawHereticStatusBar();
		break;
		case DEnameSpaces.HEXEN:
		DE_drawHexenStatusBar();
		break;
	}
}

function DE_drawnumber(){
	var size = argument[0], font = argument[1], color = argument[2], val = argument[3], width = argument[4], xx = argument[5], yy = argument[6];
	
	var str = string(val);
	
	var pos = min( string_length(str), size );
	//var dpos = size-1;
	//xx += dpos 
	repeat size{
		if pos>0{
			var v = string_char_at(str,pos);
			var spr = font[? v];
			var sep = 0;
			if !is_undefined(DESprites[? spr ]){
				sep = sprite_get_width( DESprites[? spr ] );// + width;
				xx -= sep;
			}
			DE_drawimage(spr, xx, yy);
			pos -=1;
		}
	}
}

function DE_drawDoomStatusBar(){
	/*******************************************************************************
	 *                         DEFAULT DOOM STATUS BAR
	 *******************************************************************************/

	var height = 32;
	var monospacefonts = [true, "0"];
	var ww,hh;

	ww = surface_get_width(application_surface);
	hh = surface_get_height(application_surface);

	var ss = ww / 320;
	
	var diff = 200 - (hh / ss);
	
	var offset = diff;
	
	DE_drawimage("STBAR", 0, 168- offset );
	DE_drawimage("STTPRCNT", 90, 171- offset );
	DE_drawimage("STTPRCNT", 221, 171- offset );
	DE_drawnumber(3, HUDFONT_DOOM, "untranslated", ammo1,0, 44, 171- offset );
	DE_drawnumber(3, HUDFONT_DOOM, "untranslated", HP,	 0, 90, 171- offset );
	DE_drawnumber(3, HUDFONT_DOOM, "untranslated", armor,0, 221, 171- offset );

	//keys
	DE_drawswitchableimage([keyslot[2-1],keyslot[5-1]], "nullimage", "STKEYS0", "STKEYS3", "STKEYS3", 239, 171- offset );
	DE_drawswitchableimage([keyslot[3-1],keyslot[6-1]], "nullimage", "STKEYS1", "STKEYS4", "STKEYS4", 239, 181- offset );
	DE_drawswitchableimage([keyslot[1-1],keyslot[4-1]], "nullimage", "STKEYS2", "STKEYS5", "STKEYS5", 239, 191- offset );

	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammo[Clip],		0, 288, 173- offset );
	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammo[Shell],		0, 288, 179- offset );
	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammo[RocketAmmo],	0, 288, 185- offset );
	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammo[Cell],		0, 288, 191- offset );
		
	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammocapacity[Clip],		0, 314, 173- offset );
	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammocapacity[Shell],		0, 314, 179- offset );
	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammocapacity[RocketAmmo],	0, 314, 185- offset );
	DE_drawnumber(3, INDEXFONT_DOOM, "untranslated", ammocapacity[Cell],		0, 314, 191- offset );
		
	if DENetPlay == false
	{
		DE_drawimage( "STARMS", 104, 168- offset );
		DE_drawswitchableimage( weaponslot[2-1], "STGNUM2", "STYSNUM2", 111, 172- offset ); 
		DE_drawswitchableimage( weaponslot[3-1], "STGNUM3", "STYSNUM3", 123, 172- offset );
		DE_drawswitchableimage( weaponslot[4-1], "STGNUM4", "STYSNUM4", 135, 172- offset );
		DE_drawswitchableimage( weaponslot[5-1], "STGNUM5", "STYSNUM5", 111, 182- offset );
		DE_drawswitchableimage( weaponslot[6-1], "STGNUM6", "STYSNUM6", 123, 182- offset );
		DE_drawswitchableimage( weaponslot[7-1], "STGNUM7", "STYSNUM7", 135, 182- offset );
	}else{
		DE_drawnumber(2, HUDFONT_DOOM, "untranslated", frags, 0, 138, 171 - offset);
		DE_drawimage( "STFB"+string(mpColor), 143, 169 - offset);
	}
		
	DE_drawimage( "STFST01", 143, 168- offset );
}

function DE_drawHereticStatusBar(){
	/*******************************************************************************
	*                       DEFAULT HERETIC STATUS BAR
	*******************************************************************************/

	var height = 42;
	var protrusion = [ 0.7, 8];
	var monospacefonts = [true, "0", "center"];
	
	var ww,hh;

	ww = surface_get_width(application_surface);
	hh = surface_get_height(application_surface);

	var ss = ww / 320;
	
	var diff = 200 - (hh / ss);
	
	var offset = diff;
	
	DE_drawimage( "BARBACK", 0, 158 - offset );
	DE_drawimage( "LTFCTOP", 0, 148 - offset );
	DE_drawimage( "RTFCTOP", 290, 148 - offset );

	//god mode
	DE_drawswitchableimage("invulnerable", "GOD1", "nullimage", 16, 167 - offset );
	DE_drawswitchableimage("invulnerable", "GOD2", "nullimage", 287, 167 - offset );

	//health
	DE_drawimage( "CHAINBAC", 0, 190 - offset );
	
	//gamemode singleplayer
	if DENetPlay == true
		DE_drawgem( ["wiggle", ["interpolate",8] ], "CHAIN", "LIFEGEM2",objDEFPSController.HP,objDEFPSController.maxHP, 15, 25, 16, 2, 191 - offset );
	else
		DE_drawgem( ["wiggle", ["interpolate",8], "translatable"], "CHAIN", "LIFEGEM2",objDEFPSController.HP,objDEFPSController.maxHP, 15, 25, 16, 2, 191 - offset );
		
	DE_drawimage( "LTFACE", 0, 190 - offset );
	DE_drawimage( "RTFACE", 276, 190 - offset );
	DE_drawshader( 16, 10, "horizontal", "", 19, 190 - offset );
	DE_drawshader( 16, 10, "horizontal", "reverse", 278, 190 - offset );

	//statbar
	//gamemode singleplayer, cooperative
	if DENetPlay == false
	{
		DE_drawimage( "LIFEBAR", 34, 160 - offset );
		DE_drawimage( "ARMCLEAR", 57, 171 - offset );
		DE_drawnumber( 3, HUDFONT_RAVEN, "untranslated", HP, 0, 87, 170 - offset, 1 );
	}
	else
	{
		DE_drawimage( "STATBAR", 34, 160 - offset );
		DE_drawimage( "ARMCLEAR", 57, 171 - offset );
		DE_drawnumber( 3, HUDFONT_RAVEN, "untranslated", frags, 0, 87, 170 - offset, 1 );
	}
	DE_drawimage( "ARMCLEAR", 224, 171 - offset );
	DE_drawnumber( 3, HUDFONT_RAVEN, "untranslated", armor, 0, 254, 170 - offset, 1 );

	//ammo
	//usessecondaryammo not
	//{
	//	//drawnumber 3, HUDFONT_RAVEN, untranslated, ammo1, 135, 162, 1 );
	//	DE_drawimage( ammoicon1, 123, 180 - offset , center );
	//}
	//else
	//{
	//	//drawnumber 3, INDEXFONT_RAVEN, untranslated, ammo1, 137, 165 );
	//	//drawnumber 3, INDEXFONT_RAVEN, untranslated, ammo2, 137, 177 );
	//	DE_drawimage( ammoicon1, 115, 169 - offset, center );
	//	DE_drawimage( ammoicon2, 115, 180 - offset, center );
	//}

	//keys
	DE_drawswitchableimage(keyslot[2], "nullimage", "YKEYICON", 153, 164 - offset );
	DE_drawswitchableimage(keyslot[0], "nullimage", "GKEYICON", 153, 172 - offset );
	DE_drawswitchableimage(keyslot[1], "nullimage", "BKEYICON", 153, 180 - offset );

	//inventory box
	//drawselectedinventory artiflash, INDEXFONT_RAVEN, 179, 160, 209, 182, untranslated );
	
}

function DE_drawHexenStatusBar(){
	
	var ww,hh;

	ww = surface_get_width(application_surface);
	hh = surface_get_height(application_surface);

	var ss = ww / 320;
	
	var diff = 200 - (hh / ss);
	
	var offset = diff;
	
	DE_drawimage( "H2BAR", 0, 134- offset );
	DE_drawimage( "STATBAR", 38, 162- offset );

	//DE_drawselectedinventory(artiflash, INDEXFONT_RAVEN, 143, 163, 174, 184- offset, "untranslated" );

	//gamemode deathmatch, teamgame
	if DENetPlay
	{
		DE_drawimage( "KILLS", 38, 163 - offset );
		DE_drawnumber( 3, HUDFONT_RAVEN, "untranslated", frags,0, 65, 176- offset);//, 1 );
	}
	else
	{
		DE_drawimage( "ARMCLS", 41, 178- offset );
		DE_drawnumber( 3, HUDFONT_RAVEN, "untranslated", HP, 0, 65, 176- offset);//, 1, red, 25 );
	}

	//mana bars
	/*if weaponammo == Mana1 || weaponammo == Mana2
	{
		if weaponammo == Mana1
		{
			DE_drawimage( "MANABRT1", 77, 164- offset );
			//DE_drawbar "MANAVL1", "nullimage", ammo(Mana1), vertical, 94, 164, 1- offset );
		}
		else
		{
			DE_drawimage( "MANADIM1", 77, 164- offset );
			//DE_drawbar "MANAVL1D", "nullimage", ammo(Mana1), vertical, 94, 164, 1- offset );
		}
		if weaponammo == Mana2
		{
			DE_drawimage( "MANABRT2", 110, 164- offset );
			//DE_drawbar "MANAVL2", "nullimage", ammo(Mana2), vertical, 102, 164, 1- offset );
		}
		else
		{
			DE_drawimage( "MANADIM2", 110, 164- offset );
			//DE_drawbar "MANAVL2D", "nullimage", ammo(Mana2), vertical, 102, 164, 1- offset );
		}
		DE_drawnumber( 3, INDEXFONT_RAVEN, "untranslated", ammo(Mana1),0, 91, 181- offset );
		DE_drawnumber( 3, INDEXFONT_RAVEN, "untranslated", ammo(Mana2),0, 123, 181- offset );
	}
	else //Weapon doesn't use ammo draw an alternative
	{
		DE_drawimage( "HAMOBACK", 77, 164- offset );
		if usessecondaryammo
		{
			DE_drawimage( ammoicon1, 89, 172- offset, "center" );
			DE_drawimage( ammoicon2, 113, 172- offset, "center" );
			DE_drawnumber( 3, INDEXFONT_RAVEN, "untranslated", ammo1, 0, 98, 182- offset );
			DE_drawnumber( 3, INDEXFONT_RAVEN, "untranslated", ammo2, 0, 122, 182- offset );
		}
		else
		{
			DE_drawimage( ammoicon1, 100, 172- offset, "center" );
			DE_drawnumber( 3, INDEXFONT_RAVEN, "untranslated", ammo1, 0, 109, 182- offset );
		}
	}*/

	//armor
	DE_drawimage( "ARMCLS", 255, 178- offset );
	DE_drawnumber( 2, HUDFONT_RAVEN, "untranslated", armorclass, 0, 275, 176- offset);//, 1 );

	/*if playertype == "ClericPlayer"
	{
		DE_drawimage( "WPSLOT1", 190, 162- offset );
		ininventory CWeapWraithverge
		{
			DE_drawimage( "WPFULL1", 190, 162- offset );
		}
		else
		{
			hasweaponpiece CWeapWraithverge, 1
			{
				DE_drawimage( "WPIECEC1", 190, 162- offset );
			}
			hasweaponpiece CWeapWraithverge, 2
			{
				DE_drawimage( "WPIECEC2", 212, 162- offset );
			}
			hasweaponpiece CWeapWraithverge, 3
			{
				DE_drawimage( "WPIECEC3", 225, 162- offset );
			}
		}

		gamemode singleplayer
			DE_drawgem( interpolate(6), "CHAIN2", "LIFEGMC2", -23, 49, 15, 30, 193- offset );
		else
			DE_drawgem( translatable, interpolate(6), "CHAIN2", "LIFEGMC2", -23, 49, 15, 30, 193- offset );
	}
	else if playertype == "MagePlayer"
	{
		DE_drawimage( "WPSLOT2", 190, 162- offset );
		ininventory MWeapBloodscourge
		{
			DE_drawimage( "WPFULL2", 190, 162- offset );
		}
		else
		{
			hasweaponpiece MWeapBloodscourge, 1
			{
				DE_drawimage( "WPIECEM1", 190, 162- offset );
			}
			hasweaponpiece MWeapBloodscourge, 2
			{
				DE_drawimage( "WPIECEM2", 205, 162- offset );
			}
			hasweaponpiece MWeapBloodscourge, 3
			{
				DE_drawimage( "WPIECEM3", 224, 162- offset );
			}
		}

		gamemode singleplayer
			DE_drawgem interpolate(6), "CHAIN3", "LIFEGMM2", -23, 49, 15, 30, 193- offset );
		else
			DE_drawgem translatable, interpolate(6), "CHAIN3", "LIFEGMM2", -23, 49, 15, 30, 193- offset );
	}
	else
	{
		DE_drawimage( "WPSLOT0", 190, 162- offset );
		ininventory FWeapQuietus
		{
			DE_drawimage( "WPFULL0", 190, 162- offset );
		}
		else
		{
			hasweaponpiece FWeapQuietus, 1
			{
				DE_drawimage( "WPIECEF1", 190, 162- offset );
			}
			hasweaponpiece FWeapQuietus, 2
			{
				DE_drawimage( "WPIECEF2", 225, 162- offset );
			}
			hasweaponpiece FWeapQuietus, 3
			{
				DE_drawimage( "WPIECEF3", 234, 162- offset );
			}
		}

		gamemode singleplayer
			DE_drawgem( [["interpolate",6]], "CHAIN", "LIFEGMF2", -23, 49, 15, 30, 193- offset );
		else
			DE_drawgem( ["translatable", ["interpolate",6], "CHAIN", "LIFEGMF2", -23, 49, 15, 30, 193- offset );
	}*/
	
	DE_drawimage( "LFEDGE", 0, 193- offset );
	DE_drawimage( "RTEDGE", 277, 193- offset );
}

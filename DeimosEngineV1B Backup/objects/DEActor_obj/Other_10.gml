/// @description Parse Sprite Data

thing = DEThingType[thingType];

//CHRIS: Only record one vertex buffer per sprite frame, not for all things using the sprite frame!
function record_vBuffers(__spDat,__sprite, __isMirr){

	TexW = __spDat[? "width"];
	TexH = __spDat[? "height"];
	xOff = __spDat[? "o_left"];
	yOff = __spDat[? "o_top"];
	
	yOff = max(yOff, sprite_get_height(__sprite) );
	
	var tex = sprite_get_texture( __sprite, 0 );
	
	draw_set_color(c_white);
	
	var x1,z1,x2,z2;
	
	x1 = (TexW-xOff);
	x2 = x1-TexW;
	z1 = TexH-yOff;
	z2 = z1 - TexH;
	
	return DE_spriteCreateVBuffer( x1,0,z1,x2,0,z2,tex,__isMirr );
}

function get_entity_data(){
	
	ds_list_print(sprSequence);
	
	entInteruptAnim = ds_list_find_index(sprSequence,"+");
	
	if entInteruptAnim >=0{
		ds_list_delete(sprSequence,entInteruptAnim);
		entInteruptAnim = true;
	}
	
	__sprNFO = wadSpriteDB[? sprPrefix ];
	
	if undefined == __sprNFO{
		trace("NOTICE: Sprite has no Database Entry:", sprPrefix );
		instance_destroy();
		exit;
	}
	
	__sprFrames = __sprNFO[? "frames" ];
	
	//ds_map_print(__sprFrames);
	
	entDirectional = __sprNFO[? "directional" ];
	
	if ds_map_size( __sprFrames ) > 1 entAnimated = true;
	
	trace("Loaded sprite, directional/animated?",entDirectional,entAnimated);
	
	var __FI = 0;
	repeat ds_list_size(sprSequence){
		
		var __F = sprSequence[| __FI ];
		
		if (entDirectional == true){
			
			var __A = "0";
			var __A2 = "1";
			
			var __sprName = __sprFrames[? __F+__A ];
			
			if __sprName != undefined{
				
				trace( "NOTICE: Looking for sprite data:", sprPrefix, __F+__A, __sprName );
				
				var __sprDat = wadSprites[? __sprName ];
	
				if __sprDat != undefined
				if DESprites[? __sprName ] == undefined{
				
					var __spr = DE_buildPatch(__sprDat);
					DESprites[? __sprName] = __spr;
					entSpriteMap[? __F+__A2 ] = __spr;
				
				}else entSpriteMap[? __F+__A2 ] = DESprites[? __sprName ];
	
				var __isMirr = wadSpritesMir[? sprPrefix + __F+string(__A) ];
	
				entVertBuffers[? __F+__A2] = record_vBuffers(__sprDat, DESprites[? __sprName ], __isMirr );
				
			}else			
			for (var __A = 1; __A<=8; __A++){
				
				var __sprName = __sprFrames[? __F+string(__A) ];
			
				if __sprName != undefined{
				
					trace( "NOTICE: Looking for sprite data:", sprPrefix, __F+string(__A), __sprName );
				
					var __sprDat = wadSprites[? __sprName ];
	
					if __sprDat != undefined
					if DESprites[? __sprName ] == undefined{
				
						var __spr = DE_buildPatch( __sprDat );
						DESprites[? __sprName] = __spr;
				
					}
				
					entSpriteMap[? __F+string(__A) ] = DESprites[? __sprName ];
	
					var __isMirr = wadSpritesMir[? sprPrefix+__F+string(__A) ];
	
					entVertBuffers[? __F+string(__A)] = record_vBuffers(__sprDat, entSpriteMap[? __F+string(__A) ], __isMirr );
				}
			}
			
		}else{
			var __A = "0";
			
			var __sprName = __sprFrames[? __F+(__A) ];
				
			if __sprName != undefined{
				
				var __sprDat = wadSprites[? __sprName ];
	
				if __sprDat != undefined
				if DESprites[? __sprName ] == undefined{
				
					var __spr = DE_buildPatch(__sprDat);
					DESprites[? __sprName] = __spr;
					entSpriteMap[? __F+(__A) ] = __spr;
				
				}else entSpriteMap[? __F+(__A) ] = DESprites[? __sprName ];
			
	
				var __isMirr = wadSpritesMir[? sprPrefix+__F+__A ];
	
				entVertBuffers[? __F+(__A)] = record_vBuffers(__sprDat, entSpriteMap[? __F+(__A) ], __isMirr );
			}
		}
		
		__FI++;
	}
	
}

if !is_array(thing){
	trace("Thing Type Invalid");
	instance_destroy();
}else{

	name = thing[ DEThingDef.Description ];

	sprPrefix = thing[ DEThingDef.Sprite ];
		
	if sprPrefix != "none"{
	
		if thing[ DEThingDef.Sequence ] != "AB+"{
			sprSequence = string_to_list(thing[ DEThingDef.Sequence ]);
		}else{
			entInteruptAnim = true;
			sprSequence = string_to_list("ABCDEFGHIJKLMNOPQRSTU");
		}
		var entClass = thing[ DEThingDef.Class ];
		entRadius = thing[ DEThingDef.Radius ];

		image_xscale = entRadius/4;
		image_yscale = image_xscale;

		parseClassDat(entClass);

		get_entity_data();
		
		sprFrames = ds_list_size(sprSequence);
		
	}else instance_destroy();
}
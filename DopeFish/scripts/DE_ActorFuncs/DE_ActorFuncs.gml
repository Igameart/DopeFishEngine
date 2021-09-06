function DE_getThings(level, lump) {

	var pos = ds_list_find_value_fixed(wadDirectory,lump).filepos;

	var size = ds_list_find_value_fixed(wadDirectory,lump).size;

	//show_debug_message("NOTICE: ["+level+'] sectors start '+string( pos ));
	//show_debug_message("NOTICE: ["+level+'] sectors end '+string( size ));

	buffer_seek(wadbuff,buffer_seek_start,pos);

	var len=pos+size;
	//var __l=0;
	while(buffer_tell(wadbuff)<len){
	
		var thing =ds_map_build();
	
		var ID,X,Y,Z,ANGLE,TYPE,FLAGS,ACTION,ARG1,ARG2,ARG3,ARG4,ARG5;
			ID = 0;
		if WAD_FORMAT == "DOOM"{
			X = (buffer_read(wadbuff,buffer_s16))
			Y = (-999)
			Z = (-buffer_read(wadbuff,buffer_s16))
			ANGLE = (buffer_read(wadbuff,buffer_u16))
			TYPE = (buffer_read(wadbuff,buffer_u16))
			FLAGS = (buffer_read(wadbuff,buffer_u16))
			ACTION = undefined;
			ARG1 = undefined;
			ARG2 = undefined;
			ARG3 = undefined;
			ARG4 = undefined;
			ARG5 = undefined;
		}else{
			ID = (buffer_read(wadbuff,buffer_u16))
			X = (buffer_read(wadbuff,buffer_s16))
			Z = (-buffer_read(wadbuff,buffer_s16))
			Y = (-buffer_read(wadbuff,buffer_s16))
			ANGLE = (buffer_read(wadbuff,buffer_u16))
			TYPE = (buffer_read(wadbuff,buffer_u16))
			FLAGS = (buffer_read(wadbuff,buffer_u16))
			ACTION = (buffer_read(wadbuff,buffer_u8))
			ARG1 = (buffer_read(wadbuff,buffer_u8))
			ARG2 = buffer_read(wadbuff,buffer_u8)
			ARG3 =buffer_read(wadbuff,buffer_u8)
			ARG4 = buffer_read(wadbuff,buffer_u8)
			ARG5 = buffer_read(wadbuff,buffer_u8)
		}
	
		ds_map_add(thing,"ID",ID)
		ds_map_add(thing,"x",X)
		ds_map_add(thing,"y",Y)
		ds_map_add(thing,"z",Z)
		ds_map_add(thing,"angle",ANGLE)
		ds_map_add(thing,"type",TYPE)
		ds_map_add(thing,"flags",FLAGS)
		ds_map_add(thing,"action special",ACTION)
		ds_map_add(thing,"action argument 1",ARG1)
		ds_map_add(thing,"action argument 2",ARG2)
		ds_map_add(thing,"action argument 3",ARG3)
		ds_map_add(thing,"action argument 4",ARG4)
		ds_map_add(thing,"action argument 5",ARG5)
		ds_list_add(mapThings,thing);

		//CONTINUE HERE
	
		var skill1_2,skill3,skill4_5,deaf,mponly;
	
		skill1_2 = (FLAGS&(1<<0)!=0);
		skill3 = (FLAGS&(1<<1)!=0);
		skill4_5 = (FLAGS&(1<<2)!=0);
		deaf = (FLAGS&(1<<3)!=0);
		mponly = (FLAGS&(1<<4)!=0);
	
		var __thing = DEActor[TYPE];
		
		if is_array(__thing)
		if ( __thing[ DEThingDef.Description ] == "Player 1 start" ){
			if !instance_exists(DEcam) DEcam = instance_create(X,Z,DEcam);
			with DEcam{
				x = X;
				y = Z;
				yaw = ANGLE;
				direction = ANGLE;
			}
		}
	
		var addThing = false;
	
		if (skill1_2 && (DESkillLevel>=0)) addThing = true;
		if (skill3 && DESkillLevel>=2) addThing = true;
		if (skill4_5 && DESkillLevel>=3) addThing = true;
		if (mponly && !DENetPlay) addThing = false;
	
		if addThing == true{
			var _3Dspr;
			
			if is_array(DEActor[TYPE])	_3Dspr = instance_create_depth(X,Z,0,objDEActorBasic);
			
			if is_struct(DEActor[TYPE]) _3Dspr = instance_create_depth(X,Z,0,objDEActorStruct);
			
			with _3Dspr{
				
				Direction = ANGLE;
				Angle = 0;
				DE_loadActorData(TYPE);
				
			}
			
		}

		l+=1;

	};
	DEtrace("NOTICE: ["+level+"] THINGS "+string( ds_list_size(mapThings) ));
	//ds_map_print(DESprites);


}

function flagHas(flags,str){
	//Is an Artifact
	if ds_list_find_index(flags,str)!=-1{
		return true;
	}else return false;
}

function parseClassDat(class){
	
	var flags = string_to_list(class);
	
	//Is an Artifact
	if flagHas(flags,"A"){
		entArtifact = true;
	}
	
	//Is a Pickup
	if flagHas(flags,"P"){
		entPickup = true;
	}
	
	//Is a Weapon
	if flagHas(flags,"W"){
		entWeapon = true;
	}
	
	//Is a Monster
	if flagHas(flags,"M"){
		ISMONSTER = true;
	}
	
	//Is an Obstacle
	if flagHas(flags,"O"){
		entObstacle = true;
	}
	
	//Is Grounded
	if flagHas(flags,"^"){
		entGrounded = false;
	}
	
	ds_list_destroy(flags);
	
}

function DE_loadActorData( TYPE ){
	
	if TYPE == undefined return null;
	
	thingType = TYPE;
	
	thing = DEActor[ thingType ];

	if is_array(thing){
		
		struct_extract(ACTORstruct);

		name = thing[ DEThingDef.Description ];
		
		if wadLocalization[? "enu" ] != undefined{//There's a language lump, let's check for this entry
			var _langDat = wadLocalization[? "enu" ];
			var _tmpName = _langDat[? name ];
			if _tmpName != undefined{
				_tmpName = _tmpName[0];
				DEtrace("Found Name In Language Lump",_tmpName);
				name = _tmpName;
			}
		}

		sprite = thing[ DEThingDef.Sprite ];
		
		if sprite != "none"{
	
			if thing[ DEThingDef.Sequence ] != "AB+"{
				sprSequence = string_to_array(thing[ DEThingDef.Sequence ]);
			}else{
				entInteruptAnim = true;
				sprSequence = string_to_array("ABCDEFGHIJKLMNOPQRSTU");
			}
		
			//sprFrames = array_length(sprSequence);
			
			States = ds_map_build();
			
			States[?"Idle"] = [sprSequence];
			
			DE_SetMobjState( id, "Idle" );
			
			
			var entClass = thing[ DEThingDef.Class ];
			Radius = thing[ DEThingDef.Radius ];

			image_xscale = Radius/4;
			image_yscale = image_xscale;

			parseClassDat(entClass);

			get_entity_data();
		
		}//else instance_destroy();
	}else
	if is_struct(thing){
		
		struct_extract(thing);
		
		//DEtrace(thing);
		
		name = string_space_upper(class);
		DEtrace("Custom Class Defined: ",name);
		
		image_xscale = Radius/4;
		image_yscale = image_xscale;
		
		tics = 0;//Next function will not work with tics above 0
		DE_SetMobjState( id, "Spawn" );
		
		get_entity_data();
		
	}
}

//CHRIS: Only record one vertex buffer per sprite frame, not for all things using the sprite frame!
function record_vBuffers(__spDat,__sprite, __isMirr){

	TexW = __spDat.width;
	TexH = __spDat.height;
	xOff = __spDat.leftoff;
	yOff = __spDat.topoff;
	
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
	
	
	if is_struct(thing){
		return DE_actorFetchSequenceStruct();
	}
	
	entInteruptAnim = array_find_index(sprSequence,"+");
	
	if entInteruptAnim >=0{
		array_delete(sprSequence,entInteruptAnim,1);
		entInteruptAnim = true;
	}
	
	var __sprNFO = wadSpriteDB[? sprite ];
	
	if undefined == __sprNFO{
		trace("NOTICE: Sprite has no Database Entry:", sprite );
		instance_destroy();
		return;
	}
	
	var __sprFrames = __sprNFO.frames;
	
	entDirectional = __sprNFO.directional;
	
	if ds_map_size( __sprFrames ) > 1 entAnimated = true;
	
	//DEtrace("Loaded sprite",sprite,sprSequence);
	
	var seq = sprSequence;
	var __FI = 0;
	
	repeat array_length(seq){
		
		var __F = seq[ __FI++ ];
		
		if (entDirectional == true){
			
			var __A = "0";
			var __A2 = "1";
			
			var __sprName = __sprFrames[? __F+__A ];
			
			if __sprName != undefined{
				
				//DEtrace( "NOTICE: Looking for sprite data:", sprite, __F+__A, __sprName );
				
				var __sprDat = wadSprites[? __sprName ];
	
				if __sprDat == undefined{
					instance_destroy();
					exit;
				}
				
				if DESprites[? __sprName ] == undefined{
				
					var __spr = DE_buildPatch(__sprDat);
					DESprites[? __sprName] = __spr;
					entSpriteMap[? __F+__A2 ] = __spr;
				
				}else entSpriteMap[? __F+__A2 ] = DESprites[? __sprName ];
	
				var __isMirr = wadSpritesMir[? sprite + __F+string(__A) ];
	
				entVertBuffers[? __F+__A2] = record_vBuffers(__sprDat, DESprites[? __sprName ], __isMirr );
				
			}else			
			for (var __A = 1; __A<=8; __A++){
				
				var __sprName = __sprFrames[? __F+string(__A) ];
			
				if __sprName != undefined{
				
					//DEtrace( "NOTICE: Looking for sprite data:", sprite, __F+string(__A), __sprName );
				
					var __sprDat = wadSprites[? __sprName ];
	
					if __sprDat != undefined
					if DESprites[? __sprName ] == undefined{
				
						var __spr = DE_buildPatch( __sprDat );
						DESprites[? __sprName] = __spr;
				
					}
				
					entSpriteMap[? __F+string(__A) ] = DESprites[? __sprName ];
	
					var __isMirr = wadSpritesMir[? sprite+__F+string(__A) ];
	
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
			
	
				var __isMirr = wadSpritesMir[? sprite+__F+__A ];
	
				entVertBuffers[? __F+(__A)] = record_vBuffers(__sprDat, entSpriteMap[? __F+(__A) ], __isMirr );
			}
		}
	}
}

function DE_actorFetchSequenceStruct(){
	
	entInteruptAnim = true;
		
	var seq = sprSequence;
	var key = "";
	var stateList = 0;
	var lSize = 1;
	
	stateList = thing.States;
	var count = ds_map_size(stateList);
	key = ds_map_find_first(stateList);
	//DEtrace("Actor is custom");
	//ds_map_print(stateList);
	
	repeat count{
		var list;
		var sIndex = 0;
		list = stateList[? key];
		DEtrace("Building Actor State",key);
		lSize = array_length(list);
		key = ds_map_find_next(stateList,key);
		
		repeat lSize{
			
			var sprite = list[ sIndex ].sprite;
	
			var __sprNFO = wadSpriteDB[? sprite ];
	
			if undefined == __sprNFO{
				trace("NOTICE: Sprite has no Database Entry:", sprite );
				continue;
			}
			var __sprFrames = __sprNFO.frames;
	
			if ds_map_size( __sprFrames ) > 1 entAnimated = true;
			
			seq = list[ sIndex++ ].frame;
			
			var __FI = 0;
			repeat array_length(seq){
		
				var __F = seq[ __FI++ ];
		
				if (__sprNFO.directional == true){
			
					var __A = "0";
					var __A2 = "1";
			
					var __sprName = __sprFrames[? __F+__A ];
			
					if __sprName != undefined{
				
						//DEtrace( "NOTICE: Found sprite data:", sprite, __F+__A, __sprName );
				
						var __sprDat = wadSprites[? __sprName ];
	
						if __sprDat == undefined{
							instance_destroy();
							exit;
						}
						
						if DESprites[? __sprName ] == undefined{
							DEtrace("Building Sprite",__sprName);
							var __spr = DE_buildPatch(__sprDat);
							DESprites[? __sprName] = __spr;
				
						}
							
						entSpriteMap[? sprite + __F+__A2 ] = DESprites[? __sprName ];
						
	
						var __isMirr = wadSpritesMir[? sprite + __F+string(__A) ];
	
						entVertBuffers[? sprite + __F+__A2] = record_vBuffers(__sprDat, DESprites[? __sprName ], __isMirr );
					}else			
					for (var __A = 1; __A<=8; __A++){
				
						var __sprName = __sprFrames[? __F+string(__A) ];
			
						if __sprName != undefined{
				
							//DEtrace( "NOTICE: Found Directional sprite data:", sprite, __F+string(__A), __sprName );
				
							var __sprDat = wadSprites[? __sprName ];
	
							if __sprDat != undefined
							if DESprites[? __sprName ] == undefined{
								DEtrace("Building Directional Sprite",__sprName);
								var __spr = DE_buildPatch( __sprDat );
								DESprites[? __sprName] = __spr;
				
							}
				
							entSpriteMap[? sprite + __F+string(__A) ] = DESprites[? __sprName ];
	
							var __isMirr = wadSpritesMir[? sprite+__F+string(__A) ];
	
							entVertBuffers[? sprite + __F+string(__A)] = record_vBuffers(__sprDat, entSpriteMap[? sprite + __F+string(__A) ], __isMirr );
							
						}
					}
			
				}else{
					var __A = "0";
			
					var __sprName = __sprFrames[? __F+(__A) ];
				
					if __sprName != undefined{
				
						var __sprDat = wadSprites[? __sprName ];
	
						if __sprDat != undefined
						if DESprites[? __sprName ] == undefined{
							DEtrace("Building Sprite",__sprName);
							var __spr = DE_buildPatch(__sprDat);
							DESprites[? __sprName] = __spr;
							entSpriteMap[? __F+(__A) ] = __spr;
				
						}else{
							DEtrace("Sprite Pre-built",__sprName);
							entSpriteMap[? __F+(__A) ] = DESprites[? __sprName ];
						}
			
	
						var __isMirr = wadSpritesMir[? sprite+__F+__A ];
	
						entVertBuffers[? __F+(__A)] = record_vBuffers(__sprDat, entSpriteMap[? __F+(__A) ], __isMirr );
					}
				}
			}
		}
	}
	
	//ds_map_print(entSpriteMap);
}
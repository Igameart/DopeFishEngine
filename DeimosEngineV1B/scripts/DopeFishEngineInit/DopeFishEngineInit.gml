/// @description DopeFishEngineInit( WAD, Camera );

function DE_wadDataPopulate(){

	ds_data_init();
	// Some WAD defines
	wadHeader = ds_map_build();
	wadDirectory=ds_list_build();
	wadDirectoryOfs = ds_map_build();
	wadColorMaps = noone;
	wadPlaypal = noone;
	wadPatches = ds_map_build();
	wadPNames = ds_list_build();
	wadFlatTextures = noone;
	wadCompedTextures = ds_map_build();
	wadSwitchTextures = noone;
	wadSounds = ds_map_build();
	wadSpriteDB = ds_map_build();
	wadSpritesMir = ds_map_build();
	wadSpritesDir = ds_map_build();
	

	wad_levels=ds_map_build();
	flats_=ds_map_build();
	pload_flats=ds_map_build();

	// Some Map defines
	DEMap = "E1M1";
	mapLinedefs = ds_list_build();
	mapVertexes = ds_list_build();
	mapSidedefs = ds_list_build();
	mapSectors = ds_list_build();
	mapThings = ds_list_build();
	mapGLVerts = ds_list_build();
	mapGLSegs = ds_list_build();
	mapSegs = ds_list_build();
	mapGLSSects = ds_list_build();
	mapGLNodes = ds_list_build();
	mapSegs = ds_list_build();
	mapSSectors=ds_list_build();
	mapSectTags = ds_list_build();
	mapDoors = ds_map_build();
	mapTags = ds_map_build();
	mapReject = ds_list_build();
	mapPVIS = noone;
	mapPVISTable = ds_list_build();
	
	
	ds_map_add(wad_levels,"glnodes",mapGLNodes);
	ds_map_add(wad_levels,"glsegs",mapGLSegs);
	ds_map_add(wad_levels,"glverts",mapGLVerts);
	ds_map_add(wad_levels,"things",mapThings);
	ds_map_add(wad_levels,"ssectors",mapSSectors);
	ds_map_add(wad_levels,"glssects",mapGLSSects);
	ds_map_add(wad_levels,"vertexes",mapVertexes);
	ds_map_add(wad_levels,"nodes",mapGLNodes);
	ds_map_add(wad_levels,"sidedefs",mapSidedefs);
	ds_map_add(wad_levels,"segs",mapSegs);
	ds_map_add(wad_levels,"sectors",mapSectors);
	
	// Some BSP defines
	bspLineCache = ds_list_build();
	bspSSectCache = ds_list_build();
}

function DE_addSectorToTag( sector, tag ){
	var tagList = mapTags[? tag ];
	
	if ( tagList == undefined ){
		tagList = ds_list_build();
		mapTags[? tag ] = tagList;
	}
	
	ds_list_add(tagList,sector);
	
}

function DopeFishEngineInit( CameraObject ) {

	enum BBOX
	{
	    BOXTOP,
	    BOXBOTTOM,
	    BOXLEFT,
	    BOXRIGHT
	}
	enum TexUVS{
		Left = 2,
		Top
	}
	enum DEnameSpaces{
		DOOM,
		HERETIC,
		HEXEN,
		STRIFE
	}
	enum DERoutines{
		DOOR,
		FLOOR
	}
	enum DETriggers{
		MANUAL,
		WALKOVER,
		SWITCHED,
		GUN
	}

	enum DEThingDef{
		Version,
		Radius,
		Height,
		Sprite,
		Sequence,
		Class,
		Description
	}

	gml_release_mode(true);

	// Macros
	#macro ANG45 0x20000000
	#macro ANG90 0x40000000
	#macro ANG180 0x80000000
	#macro ANG270 0xc0000000
	#macro ANGLE_MAX 0xffffffff

	#macro MAXCHAR (0x7f)
	#macro MAXSHORT (0x7fff)
	#macro MAXINT	(0x7fffffff)	/* max pos 32-bit int */
	#macro MAXLONG (0x7fffffff)

	#macro MINCHAR (0x80)
	#macro MINSHORT (0x8000)
	#macro MININT 	(0x80000000)	/* max negative 32-bit integer */
	#macro MINLONG (0x80000000)

	#macro SLOPERANGE		2048
	#macro SLOPEBITS		11
	#macro FINEANGLES		8192
	#macro FINEMASK		(FINEANGLES-1)
	#macro ANGLETOFINESHIFT	19	// 0x100000000 to 0x2000
	#macro FRACBITS 16
	#macro FRACUNIT (1<<FRACBITS)
	#macro NF_SUBSECTOR 0x8000

	#macro NSDOOM "doom"
	#macro NSHERETIC "heretic"
	#macro NSHEXEN "hexen"
	#macro NSSTRIFE "strife"

		//Ceiling and crusher speed
	#macro C_SLOW	 8
	#macro C_NORMAL	 16
	#macro C_FAST	 32
	#macro C_TURBO	 64

		//Floor speed
	#macro F_SLOW	 8
	#macro F_NORMAL	 16
	#macro F_FAST	 32
	#macro F_TURBO	 64

		//Door speed
	#macro D_SLOW	 16
	#macro D_NORMAL	 32
	#macro D_FAST	 64
	#macro D_TURBO	 128

	#macro VDOORSPEED	FRACUNIT*2;

	#macro VDOORWAIT 150

		//Stair building speed
	#macro ST_SLOW	 2
	#macro ST_NORMAL 4
	#macro ST_FAST	 16
	#macro ST_TURBO	 32

		//Platform/lift speed
	#macro P_SLOW	 8
	#macro P_NORMAL	 16
	#macro P_FAST	 32
	#macro P_TURBO	 64
	#macro PLATWAIT	 105
	#macro ELEVATORSPEED 32

		//Donut/pillar speed
	#macro DORATE	 4

		//exture scrollers
	#macro SCROLL_UNIT	64

	gc_enable(true);

	globalvar DEcam; DEcam = CameraObject;

	globalvar wadbuff;

	globalvar DEThingType;
	
	globalvar ideal_time; ideal_time = 1/60 * 1000000 * 5;

	// Some System defines
	//globalvar DE_SysReadout; DE_SysReadout = ds_list_create();
	
	// Some GLBSP defines
	if !file_exists(game_save_id+"DE_GLBSP.dll"){
		file_copy("DE_GLBSP.dll",game_save_id+"DE_GLBSP.dll");
		file_copy("glbsp.exe",game_save_id+"glbsp.exe");
		file_copy("glvis.exe",game_save_id+"glvis.exe");
	}
	
	//globalvar wadProcessGLBSP; wadProcessGLBSP = external_define( game_save_id+"DE_GLBSP.dll", "wad_GLBSPProcess", dll_cdecl, ty_real, 0);

	// Some Logic defines
	globalvar DESkillLevel;	DESkillLevel = 0;
	globalvar DENetPlay;	DENetPlay = 0;
	globalvar DENAMESPACE; DENAMESPACE = DEnameSpaces.DOOM;

	// Some WAD defines
	globalvar MAP_SCALE; MAP_SCALE = 1.0;
	globalvar MAX_THINGS; MAX_THINGS = 137;
	globalvar NOINDEX; NOINDEX = 65536;
	globalvar SUBSECTOR; SUBSECTOR = (1<<15);
	globalvar VERT_IS_GL; VERT_IS_GL = (1<<15);
	globalvar ANIM_FPS; ANIM_FPS = 35.0;
	globalvar FF_FRAMEMASK; FF_FRAMEMASK = $7fff;
	globalvar FF_FULLBRIGHT; FF_FULLBRIGHT = $8000;
	globalvar PLAYER_HEIGHT; PLAYER_HEIGHT = 40;
	globalvar NOGROUND; NOGROUND = -9999;
	globalvar ANGLE_MASK; ANGLE_MASK = $FFFFFFFF;
	globalvar WAD_FORMAT; WAD_FORMAT = "DOOM";
	globalvar wadGLVersion; wadGLVersion = -1;
	globalvar CHILD_IS_SUBSEC;
	globalvar CHILD_SUBSEC_MASK;
	globalvar skyflatnum;
	globalvar skytexture;
	globalvar skytexturemid;
	globalvar wad; wad = "";
	globalvar wadFile; wadFile = "";
	globalvar numGLNodes;
	globalvar clipangle; //clipangle = xtoviewangle[0];

	// Some WAD defines
	globalvar wadHeader;
	globalvar wadDirectory;
	globalvar wadDirectoryOfs;
	globalvar wadColorMaps;
	globalvar wadPlaypal;
	globalvar wadPatches;
	globalvar wadPNames;
	globalvar wadFlatTextures;
	globalvar wadCompedTextures; 
	globalvar wadSwitchTextures; 
	globalvar wadSounds;
	globalvar wadSpriteDB;
	globalvar wadSpritesMir;
	globalvar wadSpritesDir;

	globalvar wad_levels;
	globalvar flats_;
	globalvar pload_flats;

	// Some Map defines
	globalvar DEMap;;
	globalvar mapLinedefs;
	globalvar mapVertexes;
	globalvar mapSidedefs;
	globalvar mapSectors; 
	globalvar mapThings; 
	globalvar mapGLVerts;
	globalvar mapGLSegs; 
	globalvar mapSegs; 
	globalvar mapGLSSects;
	globalvar mapGLNodes; 
	globalvar mapSegs;
	globalvar mapSSectors;
	globalvar mapSectTags;
	globalvar mapDoors;
	globalvar mapTags;
	globalvar mapReject;
	globalvar mapPVIS;
	globalvar mapPVISTable;
	
	// Some BSP defines
	globalvar bspLineCache; 
	globalvar bspSSectCache;
	
	globalvar wadbuff;
	globalvar pwadbuff;

	// Some WAD defines
	globalvar MAP_SCALE; MAP_SCALE = 1.0;
	globalvar MAX_THINGS; MAX_THINGS = 137;
	globalvar NOINDEX; NOINDEX = 65536;
	globalvar SUBSECTOR; SUBSECTOR = (1<<15);
	globalvar VERT_IS_GL;// VERT_IS_GL = (1<<15);
	globalvar ANIM_FPS; ANIM_FPS = 35.0;
	globalvar FF_FRAMEMASK; FF_FRAMEMASK = $7fff;
	globalvar FF_FULLBRIGHT; FF_FULLBRIGHT = $8000;
	globalvar PLAYER_HEIGHT; PLAYER_HEIGHT = 40;
	globalvar NOGROUND; NOGROUND = -9999;
	globalvar ANGLE_MASK; ANGLE_MASK = $FFFFFFFF;
	globalvar WAD_FORMAT; WAD_FORMAT = "DOOM";
	globalvar WAD_EPISODIC; WAD_EPISODIC = true;
	globalvar WAD_ISGL; WAD_ISGL = false;
	globalvar DE_alphabetCheck; DE_alphabetCheck = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

	verlet_init();

	DE_wadDataPopulate();
	
	DE_initTables();


}

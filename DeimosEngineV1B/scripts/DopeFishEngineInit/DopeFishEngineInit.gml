/// @description DopeFishEngineInit( WAD, Camera );
function DopeFishEngineInit() {

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



	globalvar DEcam; DEcam = argument[0];

	globalvar wadbuff;

	ds_data_init();

	globalvar DEThingType;

	// Some System defines
	//globalvar DE_SysReadout; DE_SysReadout = ds_list_create();

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

	// Some WAD defines
	globalvar wad; wad = "";
	globalvar wadHeader; wadHeader = ds_map_build();
	globalvar wadDirectory; wadDirectory = noone;
	globalvar wadDirectoryOfs; wadDirectoryOfs = noone;
	globalvar wadColorMaps; wadColorMaps = noone;
	globalvar wadPlaypal; wadPlaypal = noone;
	globalvar wadPatches; wadPatches = ds_map_build();
	globalvar wadPNames; wadPNames = ds_list_build();
	globalvar wadWallTextures; wadWallTextures = noone;
	globalvar wadFlatTextures; wadFlatTextures = noone;
	globalvar wadCompedTextures; wadCompedTextures = ds_map_build();
	globalvar wadSwitchTextures; wadSwitchTextures = noone;
	globalvar wadSounds; wadSounds = ds_map_create();

	globalvar wad_levels;wad_levels=ds_map_build();
	globalvar flats_;flats_=ds_map_build();
	globalvar pload_flats;pload_flats=ds_map_build();
	globalvar numGLNodes;
	globalvar clipangle; //clipangle = xtoviewangle[0];

	// Some Map defines
	globalvar DEMap;DEMap = "E1M1";
	globalvar mapLinedefs; mapLinedefs = ds_list_build();
	globalvar mapVertexes; mapVertexes = ds_list_build();
	globalvar mapSidedefs; mapSidedefs = ds_list_build();
	globalvar mapSectors; mapSectors = ds_list_build();
	globalvar mapThings; mapThings = ds_list_build();
	globalvar mapGLVerts; mapGLVerts = ds_list_build();
	globalvar mapGLSegs; mapGLSegs = ds_list_build();
	globalvar mapSegs; mapSegs = ds_list_build();
	globalvar mapGLSSects; mapGLSSects = ds_list_build();
	globalvar mapGLNodes; mapGLNodes = ds_list_build();
	globalvar mapSegs;mapSegs = ds_list_build();
	globalvar mapSSectors;mapSSectors=ds_list_build();
	globalvar mapSectTags; mapSectTags = ds_list_build();
	globalvar mapDoors; mapDoors = ds_list_build();


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
	globalvar glversion; glversion = -1;

	// Some BSP defines
	globalvar bspLineCache; bspLineCache = ds_list_create();
	globalvar bspSSectCache; bspSSectCache = ds_list_create();

	//globalvar null; null=NOINDEX;

	DE_initTables();


}

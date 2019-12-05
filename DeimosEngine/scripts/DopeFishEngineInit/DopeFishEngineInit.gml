/// @description DopeFishEngineInit( WAD, Camera );

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

// Macros
#macro ANG45 0x20000000
#macro ANG90 0x40000000
#macro ANG180 0x80000000
#macro ANG270 0xc0000000

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
globalvar wadHeader; wadHeader = noone;
globalvar wadDirectory; wadDirectory = noone;
globalvar wadDirectoryOfs; wadDirectoryOfs = noone;
globalvar wadColorMaps; wadColorMaps = noone;
globalvar wadPlaypal; wadPlaypal = noone;
globalvar wadPatches; wadPatches = noone;
globalvar wadPNames; wadPNames = noone;
globalvar wadWallTextures; wadWallTextures = noone;
globalvar wadFlatTextures; wadFlatTextures = noone;
globalvar wadSwitchTextures; wadSwitchTextures = noone;
globalvar wadSounds; wadSounds = ds_map_create();

globalvar DEMap;DEMap = "E1M1";
globalvar mapLinedefs; mapLinedefs = noone;
globalvar mapVertexes; mapVertexes = noone;
globalvar mapSidedefs; mapSidedefs = noone;
globalvar mapSectors; mapSectors = noone;
globalvar mapThings; mapThings = noone;
globalvar mapGLVerts; mapGLVerts = noone;
globalvar mapGLSegs; mapGLSegs = noone;
globalvar mapGLSSects; mapGLSSects = noone;
globalvar mapGLNodes; mapGLNodes = noone;
globalvar mapSectTags; mapSectTags = ds_list_create();
globalvar mapDoors; mapDoors = ds_list_create();
globalvar numGLNodes;
globalvar clipangle; //clipangle = xtoviewangle[0];

DE_initTables();
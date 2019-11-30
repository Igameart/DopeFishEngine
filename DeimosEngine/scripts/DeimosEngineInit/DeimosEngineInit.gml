/// @description DeimosEngineInit( WAD, Camera );

globalvar DEcam; DEcam = argument[0];

globalvar wadbuff;

ds_data_init();

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

// Some Logic defines
globalvar DESkillLevel;	DESkillLevel = 0;
globalvar DENetPlay;	DENetPlay = 0;

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
globalvar numGLNodes;
globalvar clipangle; //clipangle = xtoviewangle[0];



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
enum DEGameTypes{
	DOOM,
	HERETIC,
	HEXEN,
	STRIFE
}

DE_initTables();
/// @description DopeFishEngineInit( WAD, Camera );

function DE_wadDataPopulate(){

	ds_data_init();
	
	// Some WAD defines
	wadDirectory=ds_list_build();
	wadDirectoryOfs = ds_map_build();
	wadLocalization = ds_map_build();
	wadColorMaps = noone;
	wadPlaypal = noone;
	wadPatches = ds_map_build();
	wadPNames = ds_list_build();
	wadFlatTextures = noone;
	wadCompedTextures = ds_map_build();
	wadCompedFlats = ds_map_build();
	wadSwitchTextures = noone;
	wadSounds = ds_map_build();
	wadSpriteDB = ds_map_build();
	wadSpritesMir = ds_map_build();
	wadSpritesDir = ds_map_build();
	pload_pat=ds_map_build();
	wadClasses = ds_map_build();
	
	wadlevel = {};
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
	mapSSecPVISTable = ds_list_build();
	mapGLsegPVISTable = ds_list_build();
	
	
	wadlevel.glnodes=mapGLNodes;
	wadlevel.glsegs=mapGLSegs;
	wadlevel.glverts=mapGLVerts;
	wadlevel.things=mapThings;
	wadlevel.ssectors=mapSSectors;
	wadlevel.glssects=mapGLSSects;
	wadlevel.vertexes=mapVertexes;
	wadlevel.nodes=mapGLNodes;
	wadlevel.sidedefs=mapSidedefs;
	wadlevel.segs=mapSegs;
	wadlevel.sectors=mapSectors;
	
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

function CFSwapInt32LittleToHost(x){
}

function swap16(val) {
    return ((val & 0xFF) << 8)
           | ((val >> 8) & 0xFF);
}
function swap32(val) {
    return ((val & 0xFF) << 24)
           | ((val & 0xFF00) << 8)
           | ((val >> 8) & 0xFF00)
           | ((val >> 24) & 0xFF);
}

function LittleLong(x)
{
	return swap16(x);
}

function DopeFishEngineInit( _OBJ ) {

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

	globalvar DEcam; DEcam = _OBJ;

	globalvar wadbuff;

	globalvar DEActor;
	
	globalvar ideal_time; ideal_time = 1/60 * 1000000 * 5;

	// Some System defines
	//globalvar DE_SysReadout; DE_SysReadout = ds_list_create();
	
	// Some GLBSP defines
	if !file_exists(game_save_id+"DE_GLBSP.dll"){
		file_copy("DE_GLBSP.dll",game_save_id+"DE_GLBSP.dll");
		file_copy("DoomSoundFont.dls",game_save_id+"DoomSoundFont.dls");
		file_copy("glbsp.exe",game_save_id+"glbsp.exe");
		file_copy("glvis.exe",game_save_id+"glvis.exe");
		file_copy("libWildMidi.dll",game_save_id+"libWildMidi.dll");
		file_copy("wildmidi.exe",game_save_id+"wildmidi.exe");
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
	wadHeader = {
		id			: "NULL",
		numlumps	: 0,
		infotableofs: 0
	}
	
	globalvar wadGameInfo;
	wadGameInfo = {
		decorate : undefined,
		mapinfo : undefined,
		
		backpacktype : undefined,
		chatsound : undefined,
		creditpage : undefined,
		addcreditpage : undefined,
		defaultbloodcolor : undefined,
		defaultbloodparticlecolor : undefined,
		drawreadthis : undefined,
		finaleflat : undefined,
		finalemusic : undefined,
		finalepage : undefined,
		forcetextinmenus : undefined,
		infopage : undefined,
		addinfopage : undefined,
		intermissioncounter : undefined,
		intermissionmusic : undefined,
		nightmarefast : undefined,
		noloopfinalemusic : undefined,
		pagetime : undefined,
		quitsound : undefined,
		skyflatname : undefined,
		statusbar : undefined,
		telefogheight : undefined,
		titlemusic : undefined,
		titlepage : undefined,
		titletime : undefined,
		translator : undefined,
		weaponslot : undefined,
		armoricons : undefined,
		dimcolor : undefined,
		dimamount : undefined,
		definventorymaxamount : undefined,
		defkickback : undefined,
		defaultrespawntime : undefined,
		defaultdropstyle : undefined,
		endoom : undefined,
		pickupcolor : undefined,
		quitmessages : undefined,
		addquitmessages : undefined,
		menufontcolor_title : undefined,
		menufontcolor_label : undefined,
		menufontcolor_value : undefined,
		menufontcolor_action : undefined,
		menufontcolor_header : undefined,
		menufontcolor_highlight : undefined,
		menufontcolor_selection : undefined,
		menuslidercolor : undefined,
		menusliderbackcolor : undefined,
		menubackbutton : undefined,
		playerclasses : undefined,
		addplayerclasses : undefined,
		pausesign : undefined,
		gibfactor : undefined,
		cursorpic : undefined,
		swapmenu : undefined,
		textscreenx : undefined,
		textscreeny : undefined,
		defaultendsequence : undefined,
		maparrow : undefined,
		norandomplayerclass : undefined,
		dontcrunchcorpses : undefined,
		cheatkey : undefined,
		easykey : undefined,
		forcekillscripts : undefined,
		precachesounds : undefined,
		precachetextures : undefined,
		precacheclasses : undefined,
		addeventhandlers : undefined,
		eventhandlers : undefined,
		messageboxclass : undefined,
		defaultconversationmenuclass : undefined,
		correctprintbold : undefined,
		althudclass : undefined,
		nomergepickupmsg : undefined,
		fullscreenautoaspect : undefined,
		statusbarclass : undefined,
		forcenogfxsubstitution : undefined,
		bluramount : undefined,
		statscreen_mapnamefont : undefined,
		statscreen_finishedfont : undefined,
		statscreen_enteringfont : undefined,
		statscreen_contentfont : undefined,
		statscreen_authorfont : undefined,
		dialogue : undefined,
		statscreen_single : undefined,
		statscreen_coop : undefined,
		statscreen_dm : undefined,
		normsidemove : undefined,
		normforwardmove : undefined,
		hidepartimes : undefined
	}
	
	globalvar wadDirectory;
	globalvar wadDecorate; wadDecorate = noone;
	globalvar wadLanguage; wadLanguage = noone;
	globalvar wadMapInfo; wadMapInfo = noone;
	globalvar wadDirectoryOfs;
	globalvar wadColorMaps;
	globalvar wadPlaypal;
	globalvar wadPatches;
	globalvar wadPNames;
	globalvar wadFlatTextures;
	globalvar wadCompedTextures; 
	globalvar wadCompedFlats;
	globalvar wadSwitchTextures; 
	globalvar wadSounds;
	globalvar wadSpriteDB;
	globalvar wadSpritesMir;
	globalvar wadSpritesDir;
	globalvar wadClasses;
	globalvar wadLocalization;

	globalvar wadlevel;
	globalvar flats_;
	globalvar pload_flats;
	globalvar pload_pat;

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
	globalvar mapSSecPVISTable;
	globalvar mapGLsegPVISTable;
	
	// Some BSP defines
	globalvar bspLineCache; 
	globalvar bspSSectCache;
	
	globalvar wadbuff;
	globalvar pwadbuff;

	// Some WAD defines
	globalvar ANIM_FPS; ANIM_FPS = 35.0;
	globalvar FF_FRAMEMASK; FF_FRAMEMASK = $7fff;
	globalvar FF_FULLBRIGHT; FF_FULLBRIGHT = $8000;
	globalvar PLAYER_HEIGHT; PLAYER_HEIGHT = 40;
	globalvar NOGROUND; NOGROUND = -9999;
	globalvar ANGLE_MASK; ANGLE_MASK = $FFFFFFFF;
	globalvar WAD_FORMAT; WAD_FORMAT = "DOOM";
	globalvar WAD_EPISODIC; WAD_EPISODIC = true;
	globalvar WAD_ISGL; WAD_ISGL = false;
	globalvar DE_texFilter; DE_texFilter = false;
	globalvar DE_alphabetCheck; DE_alphabetCheck = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

	display_reset(0,1);
	gpu_set_tex_filter(false);
	
	// Optional: Check to see if FMODGMS has loaded properly
	if (FMODGMS_Util_Handshake() == "FMODGMS is working."){
	}else {
	  exit; 
	}
	// Create the system
	FMODGMS_Sys_Create();
	// Initialize the system
	FMODGMS_Sys_Initialize(32);
	
	globalvar FMODChannelBGM;
	
	FMODChannelBGM = FMODGMS_Chan_CreateChannel();
	
	//FMODGMS_Snd_Set_DLS(get_open_filename("dls sound font|*.dls","Soundfont"));

	verlet_init();

	DE_wadDataPopulate();
	
	DE_initTables();


}

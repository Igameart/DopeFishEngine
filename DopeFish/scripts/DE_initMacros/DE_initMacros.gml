#macro PLAYER 0

#macro TROOPER 1
#macro SHOTGUY 2
#macro ARCHVILE 3
#macro REVENANT 5
#macro MANCUBUS 8
#macro CHAINGUY 10
#macro IMP 11
#macro DEMON 12
#macro SPECTRE 13
#macro CACODEMON 14
#macro BARONOFHELL 15
#macro HELLKNIGHT 17
#macro LOSTSOUL 18
#macro SPIDERMASTERMIND 19
#macro ARACHNOTRON 20
#macro CYBERDEMON 21
#macro PAINELEMENTAL 22
#macro WOLFSS 23
#macro KEEN 24
#macro BOSSBRAIN 25
#macro BOSSSPIT 26
#macro BOSSTARGET 27

#macro REVENANTMISL 6
#macro IMPSHOT 31
#macro CACOSHOT 32
#macro FLYINGROCKET 33
#macro FLYINGPLASMA 34
#macro FLYINGBFG 35
#macro ARACHPLAZ 36
#macro MANCUBUSSHOT 9
#macro BARONSHOT 16
#macro SPAWNSHOT 28

#macro PUFF 37
#macro BLOOD 38
#macro TFOG 39
#macro IFOG 40
#macro TELEPORTMAN 41
#macro EXTRABFG 42
#macro VILEFIRE 4
#macro SMOKE 7
#macro SPAWNFIRE 29
#macro PARTICLE 145

#macro GREENARMOR 43
#macro BLUEARMOR 44
#macro HEALTHPOTION 45
#macro ARMORHELMET 46
#macro STIMPACK 53
#macro MEDIKIT 54

#macro BLUEKEYCARD 47
#macro REDKEYCARD 48
#macro YELLOWKEYCARD 49
#macro YELLOWSKULLKEY 50
#macro REDSKULLKEY 51
#macro BLUESKULLKEY 52

#macro SUPERCHARGE 55
#macro INVULNERABILITY 56
#macro BESERKPACK 57
#macro INVISIBILITY 58
#macro RADSUIT 59
#macro AUTOMAP 60
#macro LITEAMP 61
#macro MEGASPHERE 62

#macro CLIP 63
#macro BULLETBOX 64
#macro ROCKET 65
#macro ROCKETBOX 66
#macro ECELL 67
#macro ECELLPACK 68
#macro SHELLS 69
#macro SHELLBOX 70
#macro BACKPACK 71

#macro BFG 72
#macro CHAINGUN 73
#macro CHAINSAW 74
#macro RLAUNCHER 75
#macro PLASMAGUN 76
#macro SHOTGUN 77
#macro SUPERSHOTGUN 78

#macro BARREL 30
#macro TALLTECHLAMP 79
#macro SHORTTECHLAMP 80
#macro FLOORLAMP 81
#macro TALLGRNPILLAR 82
#macro SHRTGRNPILLAR 83
#macro TALLREDPILLAR 84
#macro SHRTREDPILLAR 85
#macro SKULLCOLUMN 86
#macro HEARTCOLUMN 87
#macro EVILEYE 88
#macro SKULLROCK 89
#macro GRAYTREE 90
#macro TALLBLUFIRESTICK 91
#macro TALLGRNFIRESTICK 92
#macro TALLREDFIRESTICK 93
#macro SHRTBLUFIRESTICK 94
#macro SHRTGRNFIRESTICK 95
#macro SHRTREDFIRESTICK 96
#macro STALAGMITE 97
#macro TALLTECHPILLAR 98
#macro CANDLE 99
#macro CANDELABRA 100
#macro TREE 126
#macro BURNINGBARREL 127

#macro TWITCHCORPSE1 101
#macro TWITCHCORPSE2 110
#macro HANGINGMAN1 102
#macro HANGINGMAN2 103
#macro HANGINGMAN3 104
#macro HANGINGMAN4 105
#macro HANGINGMAN5 106
#macro HANGINGMAN6 107
#macro HANGINGMAN7 108
#macro HANGINGMAN8 109
#macro HANGINGMAN9 128
#macro HANGINGMAN10 129
#macro HANGINGMAN11 130
#macro HANGINGMAN12 131
#macro HANGINGMAN13 132
#macro HANGINGMAN14 133

#macro DEADCACO 111
#macro DEADPLAYER 112
#macro DEADTROOPER 113
#macro DEADDEMON 114
#macro DEADLOSTSOUL 115
#macro DEADIMP 116
#macro DEADSERGEANT 117
#macro SLOP 118
#macro SLOP2 119
#macro SKULLPOLE1 120
#macro SKULLPOLE2 122
#macro BLOODPOOL1 121
#macro SKULLPILE 123
#macro BLOODPOOL2 134
#macro BLOODPOOL3 135
#macro BLOODPOOL4 136

#macro DEADCORPSE1 124
#macro TWITCHCORPSE3 125

#macro PUSH 137
#macro PULL 138
#macro DOGS 139
#macro MF_SPECIAL          0
#macro MF_SOLID            1
#macro MF_SHOOTABLE        2
#macro MF_NOSECTOR         3
#macro MF_NOBLOCKMAP       4

#macro MF_AMBUSH           5
#macro MF_JUSTHIT          6
#macro MF_JUSTATTACKED     7
#macro MF_SPAWNCEILING     8
#macro MF_NOGRAVITY        9

#macro MF_DROPOFF          10
#macro MF_PICKUP           11
#macro MF_NOCLIP           12
#macro MF_SLIDE            13
#macro MF_FLOAT            14
#macro MF_TELEPORT         15
#macro MF_MISSILE          16
#macro MF_DROPPED          17
#macro MF_SHADOW           18
#macro MF_NOBLOOD          19
#macro MF_CORPSE           20
#macro MF_INFLOAT          21

#macro MF_COUNTKILL        22
#macro MF_COUNTITEM        23

#macro MF_SKULLFLY         24

#macro MF_NOTDMATCH        25

#macro MF_TRANSLATION      26


#macro PLASMA_L 1
#macro PLASMAEXP_L 2
#macro ROCKET_L 3
#macro ROCKETEXP_L 4
#macro BFG_L 5
#macro BFGEXP_L 6
#macro BLUETALL_L 7
#macro GREENTALL_L 8
#macro REDTALL_L 9
#macro BLUESMALL_L 10
#macro GREENSMALL_L 11
#macro REDSMALL_L 12
#macro TECHLAMP_L 13
#macro TECHLAMP2_L 14
#macro COLUMN_L 15
#macro CANDLE_L 16
#macro CANDLEABRE_L 17
#macro REDBALL_L 18
#macro GREENBALL_L 19
#macro ROCKET2_L 20

#macro CORONA_TYPE 0
#macro CORONA_OFFX 1
#macro CORONA_OFFY 2
#macro CORONA_COLOR 3
#macro CORONA_SIZE 4

#macro LIGHT_COLOR 5
#macro LIGHT_RADIUS 6
#macro UNDEFINED_SPR 0
#macro CORONA_SPR 1
#macro DYNLIGHT_SPR 2
#macro LIGHT_SPR 3
#macro ROCKET_SPR 19

function SetPlaneLight( pos, level)
{
	planes[pos].Light = level;
}

// MACROS ------------------------------------------------------------------

//#define SHADE2LIGHT(s) (clamp (160-2*(s), 0, 255))
function SHADE2LIGHT(s){clamp (255-2*s, 0, 255)}

// TYPES -------------------------------------------------------------------

//ceilingstat/floorstat:
//   bit 0: 1 = parallaxing, 0 = not                                 "P"
//   bit 1: 1 = groudraw, 0 = not
//   bit 2: 1 = swap x&y, 0 = not                                    "F"
//   bit 3: 1 = double smooshiness                                   "E"
//   bit 4: 1 = x-flip                                               "F"
//   bit 5: 1 = y-flip                                               "F"
//   bit 6: 1 = Align texture to first wall of sector                "R"
//   bits 7-8:                                                       "T"
//          00 = normal floors
//          01 = masked floors
//          10 = transluscent masked floors
//          11 = reverse transluscent masked floors
//   bits 9-15: reserved

	//40 bytes
globalvar sectortype;
sectortype = {
	wallptr			: -1,
	wallnum			: -1,
	ceilingz		: 0,
	floorz			: 0,
	ceilingstat		: -1,
	floorstat		: -1,
	ceilingpicnum	: -1,
	ceilingheinum	: -1,
	ceilingshade	: 1,
	ceilingpal		: -1,
	ceilingxpanning : 0,
	ceilingypanning : 0,
	ftexz			: 0,
	ctexz			: 0,
	floorpicnum		: -1,
	floorheinum		: -1,
	floorshade		: 1,
	floorpal		: -1,
	floorxpanning	: 0,
	floorypanning	: 0,
	visibility		: 1,
	filler			: -1,
	lotag			: -1,
	hitag			: -1,
	extra			: -1,
	doorheight		: undefined,
	colorid			: c_white,
	specialtype		: -1,
	tag				: -1,
	lift			: 0,
	crush			: 0,
	colmap			: -1
};

globalvar blocktype;
blocktype = {
	x  : 0,
	y  : 0,
	cols  : 0,
	rows  : 0,
	offsets : noone
}

globalvar nodetype;
nodetype = {
	x:0,
	y:0,
	dx:0,
	dy:0,
	c_r:0,
	c_l:0
}

globalvar glverttype;
glverttype = {
	xm:0,
	x:0,
	ym:0,
	y:0
}

globalvar glssecttype;
glssecttype ={
	
}

//cstat:
//   bit 0: 1 = Blocking wall (use with clipmove, getzrange)         "B"
//   bit 1: 1 = bottoms of invisible walls swapped, 0 = not          "2"
//   bit 2: 1 = align picture on bottom (for doors), 0 = top         "O"
//   bit 3: 1 = x-flipped, 0 = normal                                "F"
//   bit 4: 1 = masking wall, 0 = not                                "M"
//   bit 5: 1 = 1-way wall, 0 = not                                  "1"
//   bit 6: 1 = Blocking wall (use with hitscan / cliptype 1)        "H"
//   bit 7: 1 = Transluscence, 0 = not                               "T"
//   bit 8: 1 = y-flipped, 0 = normal                                "F"
//   bit 9: 1 = Transluscence reversing, 0 = normal                  "T"
//   bits 10-15: reserved

	//32 bytes
globalvar walltype;
walltype = {
	x           : 0,
	y           : 0,
	point2      : 0,
	nextwall    : 0,
	nextsector  : 0,
	cstat       : 0,
	picnum      : 0,
	overpicnum  : 0,
	shade       : 1,
	pal         : 0,
	xrepeat     : 0,
	yrepeat     : 0,
	xpanning    : 0,
	ypanning    : 0,
	lotag       : -1,
	hitag       : -1,
	extra       : -1
};

globalvar linetype;
linetype = {
	startv	: -1,
	endv	: -1,
	front	: -1,
	back	: -1,
	flags	: -1,
	specialtype	: -1,
	sides	: -1,
	bsect	: -1,
	arg0	: 0,
	arg1	: 0,
	arg2	: 0,
	arg3	: 0,
	arg4	: 0,
}

globalvar lineFlagType;
lineFlagType = {
	blockall : 0,
	blockmonsters : 0,
	twosided : 0,
	pegupper : 0,
	peglower : 0,
	secret : 0,
	blocksound : 0,
	automaphide : 0,
	automapalways : 0
}

//cstat:
//   bit 0: 1 = Blocking sprite (use with clipmove, getzrange)       "B"
//   bit 1: 1 = transluscence, 0 = normal                            "T"
//   bit 2: 1 = x-flipped, 0 = normal                                "F"
//   bit 3: 1 = y-flipped, 0 = normal                                "F"
//   bits 5-4: 00 = FACE sprite (default)                            "R"
//             01 = WALL sprite (like masked walls)
//             10 = FLOOR sprite (parallel to ceilings&floors)
//   bit 6: 1 = 1-sided sprite, 0 = normal                           "1"
//   bit 7: 1 = Real centered centering, 0 = foot center             "C"
//   bit 8: 1 = Blocking sprite (use with hitscan / cliptype 1)      "H"
//   bit 9: 1 = Transluscence reversing, 0 = normal                  "T"
//   bits 10-14: reserved
//   bit 15: 1 = Invisible sprite, 0 = not invisible

	//44 bytes
globalvar spritetype;
spritetype = {
	x: 0,
	y: 0,
	z: 0,
	cstat: -1,
	picnum: 0,
	shade: 1,
	pal: 0,
	clipdist: 0,
	filler: -1,
	xrepeat: 0,
	yrepeat: 0,
	xoffset: 0,
	yoffset: 0,
	sectnum: 0,
	statnum: 0,
	ang: 0,
	owner: -1,
	xvel: 0,
	yvel: 0,
	zvel: 0,
	lotag: -1,
	hitag: -1,
	extra: -1
};

//Not sure what this is for just yet, but let's keep this code for future use!
/*
struct Xsprite
{
	BYTE NotReallyPadding[16];
	WORD Data1;
	WORD Data2;
	WORD Data3;
	WORD ThisIsntPaddingEither;
	DWORD NorThis:2;
	DWORD Data4:16;
	DWORD WhatIsThisIDontEven:14;
	BYTE ThisNeedsToBe56Bytes[28];
};

//Slopes aren't in use yet
struct SlopeWork
{
	walltype *wal;
	walltype *wal2;
	long dx, dy, i, x[3], y[3], z[3];
	long heinum;
};
*/
/*
function getspritefield( i, fieldnum)
{
	switch(fieldnum)
	{
		case 0: return(sprite[i].x);
		case 1: return(sprite[i].y);
		case 2: return(sprite[i].z);
		case 3: return(sprite[i].cstat);
		case 4: return(sprite[i].shade);
		case 5: return(sprite[i].pal);
		case 6: return(sprite[i].clipdist);
		case 7: return(sprite[i].xrepeat);
		case 8: return(sprite[i].yrepeat);
		case 9: return(sprite[i].xoffset);
		case 10: return(sprite[i].yoffset);
		case 11: return(sprite[i].picnum);
		case 12: return(sprite[i].ang);
		case 13: return(sprite[i].xvel);
		case 14: return(sprite[i].yvel);
		case 15: return(sprite[i].zvel);
		case 16: return(sprite[i].owner);
		case 17: return(sprite[i].sectnum);
		case 18: return(sprite[i].statnum);
		case 19: return(sprite[i].lotag);
		case 20: return(sprite[i].hitag);
		case 21: return(sprite[i].extra);
	}
	return(0);
}

function setspritefield( i,  fieldnum,  newval)
{
	switch(fieldnum)
	{
		case 0: sprite[i].x = newval; break;
		case 1: sprite[i].y = newval; break;
		case 2: sprite[i].z = newval; break;
		case 3: sprite[i].cstat = newval; break;
		case 4: sprite[i].shade = newval; break;
		case 5: sprite[i].pal = newval; break;
		case 6: sprite[i].clipdist = newval; break;
		case 7: sprite[i].xrepeat = newval; break;
		case 8: sprite[i].yrepeat = newval; break;
		case 9: sprite[i].xoffset = newval; break;
		case 10: sprite[i].yoffset = newval; break;
		case 11: sprite[i].picnum = newval; break;
		case 12: sprite[i].ang = newval; break;
		case 13: sprite[i].xvel = newval; break;
		case 14: sprite[i].yvel = newval; break;
		case 15: sprite[i].zvel = newval; break;
		case 16: sprite[i].owner = newval; break;
		case 17: sprite[i].sectnum = newval; break;
		case 18: sprite[i].statnum = newval; break;
		case 19: sprite[i].lotag = newval; break;
		case 20: sprite[i].hitag = newval; break;
		case 21: sprite[i].extra = newval; break;
	}
}
*/

function getwallfield( i,  fieldnum)
{
	switch(fieldnum)
	{
		case 64: return(mapLinedefs[| i].x);
		case 65: return(mapLinedefs[| i].y);
		case 66: return(mapLinedefs[| i].point2);
		case 67: return(mapLinedefs[| i].nextsector);
		case 68: return(mapLinedefs[| i].nextwall);
		case 69: return(mapLinedefs[| i].picnum);
		case 70: return(mapLinedefs[| i].overpicnum);
		case 71: return(mapLinedefs[| i].shade);
		case 72: return(mapLinedefs[| i].pal);
		case 73: return(mapLinedefs[| i].cstat);
		case 74: return(mapLinedefs[| i].xrepeat);
		case 75: return(mapLinedefs[| i].yrepeat);
		case 76: return(mapLinedefs[| i].xpanning);
		case 77: return(mapLinedefs[| i].ypanning);
		case 78: return(mapLinedefs[| i].lotag);
		case 79: return(mapLinedefs[| i].hitag);
		case 80: return(mapLinedefs[| i].extra);
	}
	return(0);
}

function setwallfield( i, fieldnum, newval)
{
	switch(fieldnum)
	{
		case 64: mapLinedefs[| i].x = newval; break;
		case 65: mapLinedefs[| i].y = newval; break;
		case 66: mapLinedefs[| i].point2 = newval; break;
		case 67: mapLinedefs[| i].nextsector = newval; break;
		case 68: mapLinedefs[| i].nextwall = newval; break;
		case 69: mapLinedefs[| i].picnum = newval; break;
		case 70: mapLinedefs[| i].overpicnum = newval; break;
		case 71: mapLinedefs[| i].shade = newval; break;
		case 72: mapLinedefs[| i].pal = newval; break;
		case 73: mapLinedefs[| i].cstat = newval; break;
		case 74: mapLinedefs[| i].xrepeat = newval; break;
		case 75: mapLinedefs[| i].yrepeat = newval; break;
		case 76: mapLinedefs[| i].xpanning = newval; break;
		case 77: mapLinedefs[| i].ypanning = newval; break;
		case 78: mapLinedefs[| i].lotag = newval; break;
		case 79: mapLinedefs[| i].hitag = newval; break;
		case 80: mapLinedefs[| i].extra = newval; break;
	}
}

function getsectorfield( i, fieldnum)
{
	switch(fieldnum)
	{
		case 32: return(mapSectors[| i].wallptr);
		case 33: return(mapSectors[| i].wallnum);
		case 34: return(mapSectors[| i].ceilingpicnum);
		case 35: return(mapSectors[| i].floorpicnum);
		case 36: return(mapSectors[| i].ceilingheinum);
		case 37: return(mapSectors[| i].floorheinum);
		case 38: return(mapSectors[| i].ceilingz);
		case 39: return(mapSectors[| i].floorz);
		case 40: return(mapSectors[| i].ceilingshade);
		case 41: return(mapSectors[| i].floorshade);
		case 42: return(mapSectors[| i].ceilingxpanning);
		case 43: return(mapSectors[| i].floorxpanning);
		case 44: return(mapSectors[| i].ceilingypanning);
		case 45: return(mapSectors[| i].floorypanning);
		case 46: return(mapSectors[| i].ceilingstat);
		case 47: return(mapSectors[| i].floorstat);
		case 48: return(mapSectors[| i].ceilingpal);
		case 49: return(mapSectors[| i].floorpal);
		case 50: return(mapSectors[| i].visibility);
		case 51: return(mapSectors[| i].lotag);
		case 52: return(mapSectors[| i].hitag);
		case 53: return(mapSectors[| i].extra);
	}
	return(0);
}

function setsectorfield( i, fieldnum, newval)
{
	switch(fieldnum)
	{
		case 32: mapSectors[| i].wallptr = newval; break;
		case 33: mapSectors[| i].wallnum = newval; break;
		case 34: mapSectors[| i].ceilingpicnum = newval; break;
		case 35: mapSectors[| i].floorpicnum = newval; break;
		case 36: mapSectors[| i].ceilingheinum = newval; break;
		case 37: mapSectors[| i].floorheinum = newval; break;
		case 38: mapSectors[| i].ceilingz = newval; break;
		case 39: mapSectors[| i].floorz = newval; break;
		case 40: mapSectors[| i].ceilingshade = newval; break;
		case 41: mapSectors[| i].floorshade = newval; break;
		case 42: mapSectors[| i].ceilingxpanning = newval; break;
		case 43: mapSectors[| i].floorxpanning = newval; break;
		case 44: mapSectors[| i].ceilingypanning = newval; break;
		case 45: mapSectors[| i].floorypanning = newval; break;
		case 46: mapSectors[| i].ceilingstat = newval; break;
		case 47: mapSectors[| i].floorstat = newval; break;
		case 48: mapSectors[| i].ceilingpal = newval; break;
		case 49: mapSectors[| i].floorpal = newval; break;
		case 50: mapSectors[| i].visibility = newval; break;
		case 51: mapSectors[| i].lotag = newval; break;
		case 52: mapSectors[| i].hitag = newval; break;
		case 53: mapSectors[| i].extra = newval; break;
	}
}
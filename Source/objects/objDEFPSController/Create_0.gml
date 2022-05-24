/// @description Insert description here

// Inherit the parent event
event_inherited();

image_blend = c_black;
image_alpha = 0.25;

// camera
center_x=display_get_width()/2;
center_y=display_get_height()/2;
display_mouse_set(center_x,center_y);

sx = x;
sy = y;

mouse_free=0;

//Player Specific
IDDQD = false;
NOCLIP = false;

randomize();

keyslot = [choose(0,1),choose(0,1),choose(0,1),choose(0,1),choose(0,1),choose(0,1)];

weaponslot = [];
var w = 0;
weaponslot[w++] = 1;
repeat 6 weaponslot[w++] = choose(0,1);

ammo1 = irandom(99);
armor = irandom(99);
frags = irandom(99);

armorclass = irandom(99);

mpColor = choose(0,1,2,3);

HP = irandom(50)+50;
maxHP = 100;

Clip = 0;
Shell = 1;
RocketAmmo = 2;
Cell = 3;

sigil = choose("1","2","3","4","5");

ammo[Clip] = 20;
ammo[Shell] = 30;
ammo[RocketAmmo] = 40;
ammo[Cell] = 50;

ammocapacity[Clip] = 400;
ammocapacity[Shell] = 100;
ammocapacity[RocketAmmo] = 100;
ammocapacity[Cell] = 600;

vel = [ 0.0, 0.0, 0.0 ]; // 2m/s along x-axis
acc = [ 0.0, 0.0, 0.0 ]; // no acceleration at first
mass = 1.0; // 1kg
drag = 0.1; // rho*C*Area - simplified drag for this example
vGravity = 0;
vFriction = 0.995;

//Define Actor Flags: Move this t another object
flags  = 0;
flags2 = 0;			// Heretic flags
flags3 = 0;			// [RH] Hexen/Heretic actor-dependant behavior made flaggable
flags4 = 0;			// [RH] Even more flags!
flags5 = 0;			// OMG! We need another one.
flags6 = 0;			// Shit! Where did all the flags go?
flags7 = 0;			// WHO WANTS TO BET ON 8!?

Height = PLAYER_HEIGHT;


switch wadGameInfo.game{
	case "Doom":
	case "Chex":
		wep_spr = ( "PISGA0" );
		//stbar_spr = DE_buildGraphic( "STBAR" );
	break;
	case "Heretic":
		wep_spr = ( "GWNDA0" );
		//stbar_spr = [ DE_buildGraphic( "BARBACK" ), DE_buildGraphic( "STATBAR" ) ];
	break;
	case "Hexen":
		wep_spr = ( "PISGA0" );
		//stbar_spr = DE_buildGraphic( "STBAR" );
	break;
	case "Strife":
		wep_spr = ( "PNCHA0" );
		//stbar_spr = DE_buildGraphic( "STBAR" );
	break;
}

alarm[0] = 1;

bob = 0;

weave = 0;


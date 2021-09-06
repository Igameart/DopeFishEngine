/// @description Insert description here

// Inherit the parent event
event_inherited();

image_blend = c_black;
image_alpha = 0.25;

// camera
center_x=display_get_width()/2;
center_y=display_get_height()/2;
display_mouse_set(center_x,center_y);

mouse_free=0;

//Player Specific
IDDQD = false;
NOCLIP = false;

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
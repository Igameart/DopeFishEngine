taggedSectors = ds_list_build();

taggedSectNum = 0;
sectsComplete = 0;

tag = -1;
line = -1
specialtype = -1;
alarm[0]=2;
time=random(360);

alarm[0] = 1;

image_alpha = 0;

//sOnTime = 2;
wait = 4;
time = 0;

doorSpeed = 16;

doorHeight = 0;

doorPos = 0;

ot = delta_time;

sndPlaying = noone;

routine = noone;

switched = false;

switchCount = 0;

switchIndex = undefined;

switchTex = undefined;

repeatable = true;

state = 0

CLASS = "Regular";
TRIG = ["P","R"];
LOCK = false;
SPEED = 16;
WAIT =	150;
MONST =	false;
FUNC = [ "Open" ];
funcPos = 0;
DIR = "Dn";
TEXTURE_CHANGE = "None";
MODEL = "--";
CRUSH = false;
TARGET = "--";
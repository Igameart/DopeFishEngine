/// @description  Initial settings

TexW = 32;
TexH = 32;

xOff = TexW/2;
yOff = TexH;

z = 0;

surf = noone;

secZ = 0;

Msect=-1;

thingType = -1;
thing = -1;

DESprite = noone;

alarm[0] = 1;

shader = shd_Sprite;

u_fogColor=shader_get_uniform(shader,"u_fogColor");
u_fogMinDist=shader_get_uniform(shader,"u_fogMinDist");
u_fogMaxDist=shader_get_uniform(shader,"u_fogMaxDist");

secL = 255;
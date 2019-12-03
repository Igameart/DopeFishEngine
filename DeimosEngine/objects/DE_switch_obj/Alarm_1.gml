/// @description Toggle Off

state = !state;

if switchIndex!=undefined{
	side[?switchIndex] = switchTex[state];
}

if switchIndex != undefined{
	sndPlaying = DE_getSound("DSSWTCHX");
	audio_play_sound(sndPlaying,random(16),false);
}
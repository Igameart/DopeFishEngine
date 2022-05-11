/// @description Start Music

var song = DE_getLevelMusic();
//var song = DE_fetchMusicByLabel(wadGameInfo.titlemusic);

DE_musLumpProcess( song );

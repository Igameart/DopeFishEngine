/// @description

//trace("Player Colliding With Door Switch");

if keyboard_check(ord("F")){
	switch state{
		
		case "CLOSED":
			state = "OPEN";
			var snd = DE_getSound("DSDOROPN");
			audio_play_sound(snd,random(16),false);
			audio_free_buffer_sound(snd);
		break;
		
		case "OPENED":
			state = "CLOSE";
		break;
	}
}

//var DT = (2/35)*((room_speed/fps));//translate(0,0,35,0,0);

//DT = 1/translate(fps,0,60,0,35);

if sndPlaying != noone && audio_exists(sndPlaying){
	if !audio_is_playing(sndPlaying){
		audio_free_buffer_sound(sndPlaying);
		sndPlaying = noone;
	}
}

/*
switch state{	
	case "OPEN":
	
		doorPos += doorSpeed*DT;
		doorPos = clamp(doorPos,0,doorHeight);
		sector[?"crush"]=doorPos;
		
		if doorPos == doorHeight{
			state = "WAIT";
		}
		
	break;
	case "CLOSE":
		doorPos -= doorSpeed*DT;
		doorPos = clamp(doorPos,0,doorHeight);
		sector[?"crush"]=doorPos;
		
		if doorPos == 0{
			state = "CLOSED";
		}
		
	break;
	case "WAIT":
		if wait!= -1{
			time += 1;
			if time>=wait*room_speed{
				time = 0;
				state = "CLOSE";
				var snd = DE_getSound("DSDORCLS");
				audio_play_sound(snd,random(16),false);
				audio_free_buffer_sound(snd);
			}
		}else state = "OPENED";
	break;
}
*/
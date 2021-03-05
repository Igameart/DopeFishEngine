function DE_getSound(sndnum) {

	var snd = wadSounds[? sndnum];

	if snd == undefined{
	
		DE_bufferSeekLump(sndnum);

		//format
		buffer_read(wadbuff,buffer_u16);

		var sampleRate=buffer_read(wadbuff,buffer_u16);
		var numSamples=buffer_read(wadbuff,buffer_u32);

		snd = audio_create_buffer_sound( wadbuff, buffer_u8, sampleRate, buffer_tell(wadbuff) + 16, numSamples-32, audio_mono);
		wadSounds[? sndnum] = snd;

	}

	return snd;



}

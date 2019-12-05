var n = argument[0];

var snd = wadSounds[? n];

if snd == undefined{
	
	DE_bufferSeekLump(n);

	//format
	buffer_read(wadbuff,buffer_u16);

	var sampleRate=buffer_read(wadbuff,buffer_u16);
	var numSamples=buffer_read(wadbuff,buffer_u32);

	snd = audio_create_buffer_sound( wadbuff, buffer_u8, sampleRate, buffer_tell(wadbuff) + 16, numSamples-32, audio_mono);
	wadSounds[? n] = snd;

}

return snd;

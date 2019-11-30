var n = argument[0];
	
DE_bufferSeekLump(n);

var format=buffer_read(wadbuff,buffer_u16);

var sampleRate=buffer_read(wadbuff,buffer_u16);
trace("Found Audio:"+n, "Sample Rate" + string(sampleRate));
var numSamples=buffer_read(wadbuff,buffer_u32);

repeat 16 buffer_read(wadbuff,buffer_u8);//16 Pad bytes

var snd = audio_create_buffer_sound(wadbuff,buffer_u8,sampleRate,buffer_tell(wadbuff),numSamples-32,audio_mono);

return snd;
function DE_bufferSeekLump(lump) {
	buffer_seek(wadbuff,buffer_seek_start,DE_getLumpOfs(lump));
}

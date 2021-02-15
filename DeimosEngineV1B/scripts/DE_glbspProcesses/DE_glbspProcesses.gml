function DE_glbspPreProcess( sourceWad ){
	
	var file = file_text_open_write(game_save_id+"wadBuildGLNodes.bat");
	
	file_copy(sourceWad,game_save_id+"tmp1.wad");
	
	var str = "glbsp.exe tmp1.wad -o tmp2.wad";
	
	trace("Preparing to build GL Nodes: "+str);
	
	file_text_write_string(file,str);
	file_text_close(file);
	
}

function DE_glbspProcessWad(sourceWad, destWad){
	
	DE_glbspPreProcess( sourceWad );
	
	var __tmp = external_define( "DE_GLBSP.dll", "wad_GLBSPProcess", dll_cdecl, ty_real, 1, ty_string);
	
	external_call( __tmp, "" );
	
	do{
	}until file_exists(game_save_id+"tmp2.wad");
	
	file_copy(game_save_id+"tmp2.wad",destWad);
	
	file_delete(game_save_id+"tmp1.wad");
	file_delete(game_save_id+"tmp2.wad");

}
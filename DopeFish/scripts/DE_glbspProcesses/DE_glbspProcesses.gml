function DE_glbspPreProcess( sourceWad ){
	
	var file = file_text_open_write(game_save_id+"wadBuildGLNodes.bat");
	
	file_copy(sourceWad,game_save_id+"tmp1.wad");
	
	var __drive = string_copy(game_save_id,1,1);
	
	var __path = string_replace(game_save_id,"/","//");
	
	var str = "chdir /"+__drive+" "+__path+"\nglbsp.exe "+__path+"tmp1.wad -o "+__path+"tmp2.wad";
	str += "\nping 127.0.0.1 -n 2 > nul";
	str += "\n"+ "glvis.exe "+__path+"tmp2.wad";
	
	file_text_write_string(file,str);
	file_text_close(file);
	
	
}

function DE_glbspProcessWad(sourceWad, destWad){
		
	file_copy(sourceWad,game_save_id+"tmp1.wad");
	
	do{
	}until file_exists(game_save_id+"tmp1.wad");
	
	DE_glbspPreProcess(sourceWad);
	
	do{
	}until file_exists(game_save_id+"wadBuildGLNodes.bat");
	
	var __tmp = external_define( "DE_GLBSP.dll", "wad_GLBSPProcess", dll_cdecl, ty_real, 1, ty_string );
	
	external_call( __tmp, game_save_id + "wadBuildGLNodes.bat" );
	
	do{
	}until file_exists(game_save_id+"tmp2.~wa");
	
	do{
		file_copy(game_save_id+"tmp2.wad",destWad);
	}until file_exists(destWad);
	
	file_delete(game_save_id+"tmp1.wad");
	file_delete(game_save_id+"tmp2.wad");
	file_delete(game_save_id+"tmp2.~wa");
	file_delete(game_save_id+"wadBuildGLNodes.bat");
	
	DE_wadBuffer_Recycle();
	DE_wadDataPopulate();
	
	with objDopeFishSys{
		
		WAD = destWad;
		wadName = WAD;
		repeat string_count("\\",wadName)
			wadName = string_lower(split(wadName,"\\"));
		
		alarm[1]=2;
	}

}

function DE_musLumpPreProcess( ){
	
	var file = file_text_open_write(game_save_id+"wadBuildGLNodes.bat");
		
	var __drive = string_copy(game_save_id,1,1);
	
	var __path = string_replace(game_save_id,"/","//");
	
	var str =__path+"\wildmidi.exe "+"tmp.mus -x "+"tmp.midi";
	
	file_text_write_string(file,str);
	file_text_close(file);
	
	
}

function DE_musLumpProcess( muslump ){
	
	DE_musLumpPreProcess();
	
	var lpos = DE_getLumpOfs( muslump );

	var len = ds_list_find_value_fixed(wadDirectory, DE_getLumpNum( muslump ) ).size;

	var __tmp = buffer_create(len,buffer_fixed,1);

	buffer_copy(wadbuff,lpos,len,__tmp,0);
	
	buffer_save(__tmp,game_save_id + "tmp.mus" );
	
	var __tmp = external_define( "DE_GLBSP.dll", "wad_GLBSPProcess", dll_cdecl, ty_real, 1, ty_string );
	
	external_call( __tmp, game_save_id + "wadBuildGLNodes.bat" );
	
	do{
	}until file_exists(game_save_id+"tmp.midi");
	
	var _mid = read_midi(game_save_id+"tmp.midi");
	
	noteslist = _mid[0];
	var events = _mid[1];

	var bpm = 60; //in case bpm is never declared
	for(var i = 0; i < ds_list_size(events); i++) {
		var event = ds_list_find_value(events, i);
		if (event[1] == "bpm change") {
			bpm = event[2];
			break;
		}
	}

	time = 0;
	realbpm = 4*bpm/room_speed; //4 is an arbitrary value
	
	clipboard_set_text(game_save_id);
	file_delete(game_save_id+"tmp.mus");
	file_delete(game_save_id+"tmp.midi");
	file_delete(game_save_id+"wadBuildGLNodes.bat");

}
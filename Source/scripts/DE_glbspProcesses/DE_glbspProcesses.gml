function DE_glbspPreProcess( sourceWad ){
	
	var file = file_text_open_write(game_save_id+"wadBuildGLNodes.bat");
	
	file_copy(sourceWad,game_save_id+"tmp1.wad");
	
	var __drive = string_copy(game_save_id,1,1);
	
	var __path = string_replace_all(game_save_id,"\\","//");
	//__path = string_replace_all(__path,"/","\\");
	
	var str = "chdir /"+__drive+" "+__path+"\nglbsp.exe "+__path+"tmp1.wad -o "+__path+"tmp2.wad";
	str += "\nping 127.0.0.1 -n 2 > nul";
	str += "\n"+ "glvis.exe "+__path+"tmp2.wad -v -noreject";
	
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
	
	var __tmp = external_define( game_save_id + "DE_GLBSP.dll", "wad_GLBSPProcess", dll_cdecl, ty_real, 1, ty_string );
	
	var result = external_call( __tmp, game_save_id + "wadBuildGLNodes.bat" );
	
	DEtrace("Creating GL Data",result);
	
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
	
	with objDEWadLab{
		
		WAD = destWad;
		wadName = WAD;
		repeat string_count("\\",wadName)
			wadName = string_lower(split(wadName,"\\"));
		
		alarm[1]=2;
	}

}

function DE_musLumpPreProcess( ){
	
	var file = file_text_open_write(game_save_id+"wadBuildGLNodes.bat");
	
	//var __drive = string_copy(game_save_id,1,1);
	
	var __path = string_replace_all(game_save_id,"\\","//");
	//__path = string_replace_all(__path,"/","\\");
	
	var str = "chdir "+__path+"\n"+"wildmidi.exe "+__path+"tmp.mus -x "+__path+"tmp.midi";
	
	file_text_write_string(file,str);
	file_text_close(file);
	
	return str;
	
	
}

function DE_musLumpExtractToFile( lmp, f){
	var lpos = DE_getLumpOfs( lmp );

	if lpos<0 return noone;

	var len = ds_list_find_value_fixed(wadDirectory, DE_getLumpNum( lmp ) ).size;

	var __tmp = buffer_create(len,buffer_fixed,1);

	buffer_copy(wadbuff,lpos,len,__tmp,0);
	
	buffer_save(__tmp,f );
	
	buffer_delete( __tmp );
	return true;
}

function DE_musLumpProcess( muslump ){
	
	DEtrace("Pre Processing Music Lump");
	if file_exists(game_save_id+"tmp.midi") file_delete(game_save_id+"tmp.midi");
	var str = DE_musLumpPreProcess();
	
	do{
	}until file_exists(game_save_id+"wadBuildGLNodes.bat");
	
	var file = game_save_id+"tmp.mus";
	
	DEtrace("Extracting Music Lump");
	if DE_musLumpExtractToFile(muslump,file){
	
		do{
		}until file_exists(file);
	
		var __tmp = external_define( "DE_GLBSP.dll", "wad_GLBSPProcess", dll_cdecl, ty_real, 1, ty_string );
	
		var result = external_call( __tmp, game_save_id+"wadBuildGLNodes.bat" );
	
		DEtrace("Converting Mus to Midi",result);
	
		var num = 0;
		do{
			num ++;
			if file_exists(game_save_id+"tmp.midi"){
			
				// Load sound
				sound = FMODGMS_Snd_LoadSound(game_save_id+"tmp.midi");
			
				// Play sound
				FMODGMS_Snd_Set_LoopMode(sound,1,999);
				FMODGMS_Snd_PlaySound(sound,FMODChannelBGM);
			
			
				DEtrace("Done Processing Music Lump");
		
				clipboard_set_text(game_save_id);
				file_delete(file);
				//file_delete(game_save_id+"tmp.midi");
				file_delete(game_save_id+"wadBuildGLNodes.bat");
			}
		}until file_exists(game_save_id+"tmp.midi") || num > 100000;
	}

}
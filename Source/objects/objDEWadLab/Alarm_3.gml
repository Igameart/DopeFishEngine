/// @description - Process Wad

if string_lower(wadName) != ""{
	var __tmpWad = wadFile;
	__question = show_question("Exit WadLab and begin building GL Nodes? (This may take some time to complete)");
	
	if __question
	__question = show_question("Overwrite original wad?");
			
	if !__question{
				
		__tmpWad = get_save_filename("Doom Wad|*.wad",__tmpWad);
		
		if __tmpWad !=""{
			
			DE_glbspProcessWad(wadFile,__tmpWad);
			
			game_end();
			
		}
				
	}
	
}

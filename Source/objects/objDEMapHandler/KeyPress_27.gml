///@description end game
var question = DE_fetchLocalizationByLabel(wadGameInfo.quitmessages);

question = string_replace(question,"\\n"," ");

if show_question(string_upper( question ))
	action_end_game();

function trace() {
	
	if !debug_mode return;
	
	var str = ">> ";
	var num = 0;

	repeat argument_count{
		var arg = argument[num];
		str += string( arg );
		if argument_count>num str+=" • ";
		num++;
	}

	show_debug_message(str);

}

function DEtrace() {
	
	var str = ">> ";
	var num = 0;

	repeat argument_count{
		var arg = argument[num];
		str += string( arg );
		if argument_count>num str+=" • ";
		num++;
	}

	show_debug_message(str);

}

function hex_to_text(argument0) {
	{
		var _data = argument0;
		var _text = "";
		for(var _i = 1; _i < string_length(_data); _i += 2) {
			_text += chr(hex_to_dec(string_copy(_data, _i, 2)));
		}
		return _text;
	}


}

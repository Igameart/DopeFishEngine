var _string=argument0;
var _split=argument1;
var _pos=string_pos(_split,_string);

return string_copy(_string,_pos+1,string_length(_string)-_pos+1);

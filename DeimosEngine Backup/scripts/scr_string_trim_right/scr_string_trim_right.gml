/// @description scr_string_trim_right(string, characterSet)
/// @param string
/// @param  characterSet

/**
 * Trims characters from the right of a string
 *
 * @param   string        The input string, string
 * @param   characterSet  (optional) Characters to remove from the side, string
 * 
 * @return  Returns a string with the characters trimmed from its right side, string
 */

var _charlist, _string, _a, _b, _t, _position;

_string = argument[0];
_charlist = " ";

if (argument_count >= 2) {
_charlist = argument[1];
}

while (string_pos("..", _charlist) > 1 and string_length(_charlist) > 2) {

    _position = string_pos("..", _charlist);
    _a = ord(string_char_at(_charlist, _position-1));
    _b = ord(string_char_at(_charlist, _position+2));
    _t = "";
    
    for (var _i=_a; _i<=_b; ++_i) {
        _t += chr(_i);
    }
    _charlist = string_insert(_t, string_delete(_charlist, _position-1, 4), _position-1);
}

while (string_length(_string) > 0) {
    if ( string_pos(string_char_at(_string, string_length(_string)), _charlist) > 0) {
        _string = string_delete(_string, string_length(_string), 1);
    } else {
        break;
    }
}

return _string;

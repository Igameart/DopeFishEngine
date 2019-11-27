/// @description scr_string_pad_right(string, length, subject)
/// @param string
/// @param  length
/// @param  subject

/**
 * Pads the string to the desired length with subject string from the right
 *
 * @param   string   The input string, string
 * @param   length   The desired length of the string, real
 * @param   subject  The subject string to use for padding, string
 * 
 * @return  Returns the string to the desired length with subject string from the right, real
 */

var _string, _length, _pad, _pad_size, _padding, _out;

_string = argument[0];
_length = argument[1];
_pad    = argument[2];

_pad_size = string_length(_pad);
_padding = max(0, _length - string_length(_string));

_out  = _string;
_out += string_repeat(_pad, _padding div _pad_size);
_out += string_copy(_pad, 1, _padding mod _pad_size);
_out  = string_copy(_out, 1, _length);

return _out;

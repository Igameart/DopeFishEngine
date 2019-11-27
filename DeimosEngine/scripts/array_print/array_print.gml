/// @description scr_array_print(array, filename)
/// @param array
/// @param  filename

/**
 * Prints the array items to the console
 *
 * @param   array      The input array, array
 * @param   filename   (optional) Output the data in a file instead, string
 * 
 * @return  nothing
 */

var _array       = argument[0];
var _filename    = "";
var _file_handle = -1;

if (argument_count >= 2) {
    _filename = argument[1];
}

if (_filename != "") {
    _file_handle = file_text_open_append(_filename);
    file_text_writeln(_file_handle);
} else {
    show_debug_message("");    
}

var _string = "  Array: [";

for (var _i=0; _i < array_length_1d(_array); ++_i) {
    _string += string(_array[_i])+", ";
}

if (_filename != "") {
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, scr_string_trim_right(_string, ", ")+"]");
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, "  Size: "+string(array_length_1d(_array)));
    file_text_writeln(_file_handle);
} else {
    show_debug_message(scr_string_trim_right(_string, ", ")+"]");
    show_debug_message("  Size: "+string(array_length_1d(_array)));
    show_debug_message("");
}

if (_filename != "") {
    file_text_close(_file_handle);
}


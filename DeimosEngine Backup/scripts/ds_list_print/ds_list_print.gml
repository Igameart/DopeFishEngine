/// @description scr_ds_list_print(DSListIndex, filename)
/// @param DSListIndex
/// @param  filename

/**
 * Prints the DS List items to the console
 *
 * @param   DSListIndex  The input DS list, DSList
 * @param   filename   (optional) Output the data in a file instead, string
 * 
 * @return  nothing
 */

var _list = argument[0];
var _filename = "";

if (argument_count >= 2) {
    _filename = argument[1];
}

// find longest string in list items
var _found = "";
var _longest = "";

for (var _i=0; _i < ds_list_size(_list); ++_i) {
    _found = string(_i);
    if (string_length(_found) > string_length(_longest)) { _longest = _found; }
}

var _maxlength = string_length(_longest);

if (_filename != "") {
    _file_handle = file_text_open_append(_filename);
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, "  DS List: "+string(_list)); 
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, "  Size: "+string(ds_list_size(_list))); 
    file_text_writeln(_file_handle);
} else {
    show_debug_message(""); 
    show_debug_message("  DS List: "+string(_list)); 
    show_debug_message("  Size: "+string(ds_list_size(_list))); 
    show_debug_message(""); 
}

for (var _i=0; _i < ds_list_size(_list); ++_i) {
    
    if (_filename != "") {
        file_text_write_string(_file_handle, " "+scr_string_pad_right(string(_i), _maxlength, " ")+" : "+_list[| _i] );
        file_text_writeln(_file_handle);
        file_text_writeln(_file_handle);
    } else {
        show_debug_message( " "+scr_string_pad_right(string(_i), _maxlength, " ")+" : "+_list[| _i] );
    }
    
}


if (_filename != "") {
    file_text_close(_file_handle);
} else {
    show_debug_message(""); 
}



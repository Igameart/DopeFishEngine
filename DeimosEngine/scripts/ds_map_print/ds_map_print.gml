/// @description scr_ds_map_print(dsMap, filename)
/// @param dsMap
/// @param  filename

/**
 * Prints the DS Map items to the console
 *
 * @param   DSMapIndex  The input DS map, DSMap
 * @param   filename   (optional) Output the data in a file instead, string
 * 
 * @return  nothing
 */

// note: only prints non-nested maps
 
var _filename = "";
var _file_handle = -1;
var _map  = argument[0];
var _size = ds_map_size(_map);
var _key = ds_map_find_first(_map);

if (argument_count >= 2) {
    _filename = argument[1];
}

if (_filename != "") {
    _file_handle = file_text_open_append(_filename);
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, "  DS Map: "+string(_map)); 
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, "  Size: "+string(ds_map_size(_map))); 
    file_text_writeln(_file_handle);
} else {
    show_debug_message("");
    show_debug_message("  DS Map: "+string(_map)); 
    show_debug_message("  Size: "+string(ds_map_size(_map)));
}

// find longest key string in map items
var _found   = "";
var _longest = "";

for (var _i=0; _i < _size; ++_i) {
    
    _found = string(_key);
    _key = ds_map_find_next(_map, _key);
    
    if (string_length(_found) > string_length(_longest)) {
        _longest = _found;
    }
}

var _maxlength = string_length(_longest);

if (_filename != "") {
    file_text_write_string(_file_handle, "  { "); 
    file_text_writeln(_file_handle);    
} else {
    show_debug_message("  { ");
}

// iterate top map keys
_key = ds_map_find_first(_map);
for (var _i=0; _i < _size; ++_i) {
    
    var _value = ds_map_find_value(_map, _key);
    
    if (_filename != "") {
        file_text_write_string(_file_handle, "      "+scr_string_pad_right(string(_key), _maxlength, " ") +" : "+string( _value )); 
        file_text_writeln(_file_handle);
    } else {
        show_debug_message("      "+scr_string_pad_right(string(_key), _maxlength, " ") +" : "+string( _value ));
    }
    
    _key = ds_map_find_next(_map, _key);
    
}

if (_filename != "") {
    file_text_write_string(_file_handle, "  }"); 
    file_text_writeln(_file_handle);
    file_text_writeln(_file_handle);
    file_text_close(_file_handle);
} else {
    show_debug_message("  }");
    show_debug_message(""); 
}


/// @description scr_ds_grid_print(DSGridIndex, filename, columnNames)
/// @param DSGridIndex
/// @param  filename
/// @param  columnNames

/**
 * Prints the DS Grid items to the console
 *
 * @param   DSGridIndex  The input DS grid, DSGrid
 * @param   filename     (optional) Output the data in a file instead, string
 * @param   columnNames  (optional) An array holding the column names, string
 * 
 * @return  nothing
 */

// note: Printing in GMS console may look a bit off because the console doesn't use a monospace font
//       at the moment, best print to a filename and open with a text editor without wordwrap on
 
var _grid, _width, _height, _string, _row, _column;

var _filename = "";
var _file_handle = -1;
var _column_names = -1;

_grid   = argument[0];
_width  = ds_grid_width(_grid);
_height = ds_grid_height(_grid);

if (argument_count >= 2) {
    _filename = argument[1];
}

if (argument_count >= 3) {
    _column_names = argument[2];
}

if (_filename != "") {
    _file_handle = file_text_open_append(_filename);
}

if (_filename == "") {
    show_debug_message("");
    
    show_debug_message("  DS Grid: "+string(_grid));
    show_debug_message("  Size: "+string(_width)+" x "+string(_height));
    
    show_debug_message("");
} else {
    
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, "  DS Grid: "+string(_grid));
    file_text_writeln(_file_handle);
    file_text_write_string(_file_handle, "  Size: "+string(_width)+" x "+string(_height));
    file_text_writeln(_file_handle);
    file_text_writeln(_file_handle);

}

// find longest string in grid items
var _found = "";
var _longest = "";

for (_row = 0; _row < _height; ++_row) {

    for (_column = 0; _column < _width; ++_column) {
        
        _found = string( _grid[# _column, _row]);
        if (string_length(_found) > string_length(_longest)) { _longest = _found; }
    
    }
}

var _maxlength = string_length(_longest)+1;
var _height_digits = string_length(string(_height));

// print column indexes
var _number_of_columns = 0;
var _columns = " "+scr_string_pad_right(" ", _height_digits, " ")+" |";
for (_column = 0; _column < _width; ++_column) {
    if (_column_names != -1) {
        _columns += " "+scr_string_pad_right(string(_column)+" "+_column_names[_column], _maxlength, " ")+"|";
    } else {
        _columns += " "+scr_string_pad_right(string(_column), _maxlength, " ")+"|";
    }
    _number_of_columns += 1;
}

// print separator
var _separator = " "+scr_string_pad_right(" ", _height_digits, " ")+" ";
repeat(_number_of_columns+1) { repeat(_maxlength) { _separator += "-"; } }

if (_filename == "") {
    show_debug_message(_columns);
    show_debug_message(_separator);
} else {
   file_text_write_string(_file_handle, _columns);
   file_text_writeln(_file_handle);
   file_text_write_string(_file_handle, _separator);
   file_text_writeln(_file_handle);
}

// print row indexes and items
for (_row = 0; _row < _height; ++_row) {
    
    _string = " ";
    _string += scr_string_pad_right(string(_row), _height_digits, " ")+" | ";
    
    for (_column = 0; _column < _width; ++_column) {
    
        if (_column >= _width-1) {
            _delimiter = "|";
        } else {
            _delimiter = ", ";
        }
         
        if (_grid[# _column, _row] == 0) {
            _string += scr_string_pad_right("0", _maxlength, " ")+_delimiter;
        } else {
            _string += scr_string_pad_right(string( _grid[# _column, _row] ), _maxlength, " ")+_delimiter;
        }
        
    }
    
    if (_filename == "") {
        show_debug_message(_string);
    } else {
        file_text_write_string(_file_handle, _string); 
        file_text_writeln(_file_handle);
    }
    
}

// print separator
if (_filename == "") {
    show_debug_message(_separator);
    show_debug_message("");
} else {
   file_text_write_string(_file_handle, _separator);    
   file_text_writeln(_file_handle); 
   file_text_writeln(_file_handle);
}

if (_filename != "") {
    file_text_close(_file_handle);
}
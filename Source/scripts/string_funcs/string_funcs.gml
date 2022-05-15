
function string_space_upper(_string){
	var _prev = "";
	for (i = 1; i < (string_length(_string)+1); i++) {
		var _str = string_char_at(_string,i);
		if string_is_upper(_str) && !string_is_upper(_prev){//Is upper case and last letter is lower case
			_string = string_insert(" ",_string,i);
		}
		_prev = _str;
	}
	return _string;
}

function string_is_upper(_string){
	if _string == string_upper(_string) return true;
	return false;
}

function split(_string, _split) {
	var _pos=string_pos(_split,_string);

	return string_copy(_string,_pos+1,string_length(_string)-_pos+1);

}

function string_to_list(string){
	var list = ds_list_build();

	var i;
	for (i = 1; i < (string_length(string)+1); i++) {
	    var currStr = string_copy(string, i, 1);
		list[| i-1] = currStr;
	}
	
	return list;
}

function string_to_array(string){
	var list = [];

	var i;
	for (i = 1; i < (string_length(string)+1); i++) {
	    var currStr = string_copy(string, i, 1);
		list[ i-1] = currStr;
	}
	
	return list;
}

function string_split_on_delimiter(){
	/// string_split(:string, delimiter:string, ?list<string>):list<string>
	var s = argument[0], d = argument[1], r;
	if (argument_count >= 3) {
	    r = argument[2];
	    ds_list_clear(r);
	} else r = ds_list_build();
	var p = string_pos(d, s), o = 1;
	var dl = string_length(d);
	
	if (dl) while (p) {
		
		var _str = string_copy(s, o, p - o);
		
		if _str != d && _str != ""{
			if string_pos(d,_str) == 1 _str = string_delete(_str,1,dl);
			ds_list_add(r, _str);
		}
	    o = p + dl;
	    p = string_pos_ext(d, s, o);
	
	}
	
	ds_list_add(r, string_delete(s, 1, o - 1));
	return r;
}

function string_split_on_delimiter_includes(){//Same as above, but check for include references, then load those into the list as well.
	/// string_split(:string, delimiter:string, ?list<string>):list<string>
	var s = argument[0], d = argument[1], r;
	if (argument_count >= 3) {
	    r = argument[2];
	    ds_list_clear(r);
	} else r = ds_list_build();
	var p = string_pos(d, s), o = 1;
	var dl = string_length(d);
	
	if (dl) while (p) {
		
		var _str = string_copy(s, o, p - o);
		
		if _str != d && _str != ""{
			if string_pos(d,_str) == 1 _str = string_delete(_str,1,dl);
			
			//Let's check for includes here to make life easier on everyone!
			var _include = DE_checkIncludes(_str);
		
			if _include != "NULL"{
				DE_loadTextData( _include, r );//This is recursive, so hopefully everthing just get's added in order making life worth living
			}
			else
			ds_list_add(r, _str);
		}
	    o = p + dl;
	    p = string_pos_ext(d, s, o);
	
	}
	
	ds_list_add(r, string_delete(s, 1, o - 1));
	return r;
}

function string_split_on_newline(s){
//trace("Splitting String Into Code",s);
	var d = "/n";
	var a = "/r/n";
	var r = ds_list_create();
	
	var p = 1;
	
	var sl = string_length(s);
	
	var tmp = "";
	
	repeat sl {
		
		var smpl = string_char_at(s,p);
		
		if ( smpl != d && smpl != a ){
				tmp += smpl;
			}else{
				ds_list_add(r,tmp);
				tmp = "";
			}
		p++;
	}
	
	if tmp!="" && tmp!=" " && tmp!="\r\n" && tmp!= "\n"{
		ds_list_add(r,tmp);
	}
	tmp = "";
	
	return r;
}

function string_split_as_code(s){
	
	trace("Splitting String Into Code",s);
	var d = " ,(){}[];";
	var a = "{}[];";
	var r = ds_list_create();
	
	var p = 1;
	
	var sl = string_length(s);
	
	if string_char_at(s,1) == " "
	do{
		sl--;
		s = string_copy(s,2,sl)
	} until string_char_at(s,1) != " ";
	
	sl = string_length(s);
	
	if string_char_at(s,1) == chr(9)
	do{
		sl--;
		s = string_copy(s,2,sl)
	} until string_char_at(s,1) != chr(9);
	
	sl = string_length(s);
	
	var tmp = "";
	var inquotes = false;
	
	var bracketed = 0;
	
	var prev = "";
	
	var commentBlock = false;
	
	repeat sl {
		
		var smpl = string_char_at(s,p);
		
		var next = string_char_at(s,p+1);
		
		if inquotes == false
			if smpl+next == "//" continue;
		
		if commentBlock == false{
			if inquotes == false{
				if smpl+next = "/*" commentBlock = true;
				if prev+smpl == "*/"{
					smpl =""
					commentBlock = false;
				}
			}
		}
		
		if commentBlock == true{
		}
		
		if commentBlock == false{
		
			if smpl == "[" || smpl == "]" || smpl == ";"{
				
				if tmp!="" && tmp!=" "
					ds_list_add(r,tmp);
					
				ds_list_add(r,smpl);
				tmp = "";
				smpl = "";
			}
		
			if smpl == "\"" && prev != "\\" inquotes = !inquotes;
		
			if smpl == "(" && inquotes == false{
				if bracketed == 0{
					ds_list_add(r,tmp);
					tmp = "";
				}
				bracketed++;
			}
		
			if bracketed > 0 && inquotes == false{
				tmp += smpl;
				if smpl == ")" bracketed--;
			}else
			if ( string_pos(smpl,d) == 0 || inquotes == true || string_pos(smpl,a) ){
				tmp += smpl;
			}else		
			if tmp!="" && tmp!=" " && tmp!="\r\n" && tmp!= "\n"{
				ds_list_add(r,tmp);
				tmp = "";
			}
		}
		
		p++;
		prev = smpl;
	}
	
	if tmp!="" && tmp!=" " && tmp!="\r\n" && tmp!= "\n"{
		ds_list_add(r,tmp);
		tmp = "";
	}
	
	//trace("Results",ds_list_to_string(r));
	return r;
}

function ds_list_to_string( list ){
	var str = "- ";
	for (var i=0; i<ds_list_size(list);i++)
		str += string(list[| i])+" - ";
	
	return str;
}

function string_wordwrap_width(_text_current,_width,_break,_split)
//
//  Returns a given string, word wrapped to a pixel width,
//  with line break characters inserted between words.
//  Uses the currently defined font to determine text width.
//
//      string      text to word wrap, string
//      width       maximum pixel width before a line break, real
//      break       line break characters to insert into text, string
//      split       split words that are longer than the maximum, bool
//
/// GMLscripts.com/license
{
    var pos_space, pos_current, text_output;
    pos_space = -1;
    pos_current = 1;
    if (is_real(_break)) _break = "#";
    text_output = "";
    while (string_length(_text_current) >= pos_current) {
        if (string_width(string_copy(_text_current,1,pos_current)) > _width) {
            //if there is a space in this line then we can break there
            if (pos_space != -1) {
                text_output += string_copy(_text_current,1,pos_space) + string(_break);
                //remove the text we just looked at from the current text string
                _text_current = string_copy(_text_current,pos_space+1,string_length(_text_current)-(pos_space));
                pos_current = 1;
                pos_space = -1;
            } else if (_split) {
                //if not, we can force line breaks
                text_output += string_copy(_text_current,1,pos_current-1) + string(_break);
                //remove the text we just looked at from the current text string
                _text_current = string_copy(_text_current,pos_current,string_length(_text_current)-(pos_current-1));
                pos_current = 1;
                pos_space = -1;
            }
        }
        pos_current += 1;
        if (string_char_at(_text_current,pos_current) == " ") pos_space = pos_current;
    }
    if (string_length(_text_current) > 0) text_output += _text_current;
    return text_output;
}

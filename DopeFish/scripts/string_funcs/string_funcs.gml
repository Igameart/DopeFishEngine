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
	    ds_list_add(r, string_copy(s, o, p - o));
	    o = p + dl;
	    p = string_pos_ext(d, s, o);
	}
	ds_list_add(r, string_delete(s, 1, o - 1));
	return r;
}

function string_split_as_code(s){
	
	var d = " ,(){};";
	var r = ds_list_create();
	
	var p = 1;
	
	var sl = string_length(s);
	
	var tmp = "";
	var inquotes = false;
	
	repeat sl {
		
		var smpl = string_char_at(s,p);
		
		if smpl == "\"" inquotes = !inquotes;
		
		if ( string_pos(smpl,d) == 0 || inquotes == true || smpl == "{" || smpl == "}"){
			tmp += smpl;
		}else		
		if tmp!="" && tmp!=" "{
			ds_list_add(r,tmp);
			tmp = "";
		}
		
		p++;
		
	}
	
	if tmp!="" && tmp!=" "{
		ds_list_add(r,tmp);
		tmp = "";
	}
	
	return r;
}
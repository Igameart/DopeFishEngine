/// @function struct_copy
/// @param	{struct}	source
/// @description Copies source and returns a new struct
function struct_copy( source){
	var srcNames = variable_struct_get_names( source);
	var ret = {};
	for( var i = 0; i < array_length( srcNames); ++i){
		variable_struct_set( ret, srcNames[i], variable_struct_get( source, srcNames[i]));
	}
	return ret;
}

/// @function struct_merge
/// @param {struct}	destination	Struct to copy to
/// @param {struct}	source		Struct to copy from
/// @description Merges source into destination, overwriting values if necessary
function struct_merge( destination, source){
	var srcNames = variable_struct_get_names( source);
	for( var i = 0; i < array_length( srcNames); ++i){
		variable_struct_set( destination, srcNames[i], variable_struct_get( source, srcNames[i]));
	}
	return destination;
}

/// @function struct_extract
/// @param	{struct}	source
/// @description Copies variables from surce struct to object
function struct_extract( source){
	var srcNames = variable_struct_get_names( source);
	for( var i = 0; i < array_length( srcNames); ++i){
		variable_instance_set( id, srcNames[i], variable_struct_get( source, srcNames[i]));
	}
}
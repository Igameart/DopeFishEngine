function DE_getFlatTexture(t_name) {

	if t_name!="-" and t_name!="F_SKY1" and t_name!="F_SKY" and t_name!="F_SKY001"	{

		var tex = wadCompedFlats[? t_name ];

		if tex == undefined{
			
			trace("Comped Flat Does Not Exist:",t_name);
	
			var sprite = ds_map_find_value(pload_flats,t_name);
	
			if sprite == undefined{
				sprite = DE_buildFlat(flats_[? t_name ]);
				pload_flats[? t_name ] = sprite;
			}
	
			tex = sprite_get_texture(sprite,0);
			wadCompedFlats[? t_name ] = tex;
	
		}

		return tex;

	} else return -1;

}

function DE_getFlat(t_name) {

	if t_name!="-" and t_name!="F_SKY1" and t_name!="F_SKY" and t_name!="F_SKY001"	{
	
		var sprite = ds_map_find_value(pload_flats,t_name);
	
		if sprite == undefined return -1;
			
		return sprite

	} else return noone;

}

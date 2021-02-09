var t_name = argument[0];

var tex = wadCompedTextures[? t_name ];

if t_name != "-"
if ((t_name!="F_SKY1" and t_name!="F_SKY" and t_name!="F_SKY001") or (t_name!="F_SKY1" and t_name!="F_SKY" and t_name!="F_SKY001")){

	if tex == undefined{
		trace("Comped Texture Does Not Exist:"+t_name);
	
		var sprite = ds_map_find_value(pload_tex,t_name);
	
		if sprite == undefined return 0;
	
		tex = sprite_get_texture(sprite[0],0);
		wadCompedTextures[? t_name ] = tex;
	
	}

	return tex;
}else return 0;
else return 0;
/// @description RFX_draw_sprite()
function RFX_draw_sprite() {
	if RFXenabled{
	
	    var sprite = argument[0];
		var index = argument[1]
		var xx = argument[2];
		var yy = argument[3];
		var xScale = argument_count>4? argument[4]: 1;
		var yScale = argument_count>5? argument[5]: 1;
		var Rot = argument_count>6? argument[6]: 0;
		var Col = argument_count>7? argument[7]: c_white;
		var Alph = argument_count>8? argument[8]: 1;
    
	    shader_set(RFXshader);
	    texture_set_stage(RFXpalsampler,RFXpal);
	    texture_set_stage(RFXdithsampler,RFXdith);
	    texture_set_repeat_ext(RFXpalsampler,false);
	    texture_set_repeat_ext(RFXdithsampler,true);
	
    
	    shader_set_uniform_f(RFXscreensize,sprite_get_width(sprite)*xScale,sprite_get_height(sprite)*yScale);
	    shader_set_uniform_f(RFXuspread,RFXspread);
	    shader_set_uniform_f(RFXudepth,RFXcdepth);
	    texture_set_interpolation(false);
	
		draw_sprite_ext(sprite,index,xx,yy,xScale,yScale,Rot,Col,Alph);
    
	    shader_reset();

	}



}

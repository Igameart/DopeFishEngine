/// @description 

draw_self();

if DENetPlay{
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,0,c_white,1);
}

if bGlow > -1{
	
	draw_sprite_ext(sprite_index,2+bGlow,x,y,image_xscale,image_yscale,0,c_white,1);
	
}


if !surface_exists(mSurf){
	
	mSurf = surface_create(mpos[2],mpos[3]);
	
}

	
surface_set_target(mSurf)

	draw_clear_alpha(c_black,0);
	
	var spr,pos,size;
	
	size = array_length_1d(_GameTitles);
	
	pos = [mpos[2]*.2,mpos[3]*.5];
	spr = _GameTitles[sMod(selMode-1,size)];
	draw_sprite_ext(spr,0,pos[0],pos[1],.75,.75,0,lgray,1);
	
	pos = [mpos[2]*.8,mpos[3]*.5];
	spr = _GameTitles[sMod(selMode+1,size)];
	draw_sprite_ext(spr,0,pos[0],pos[1],.75,.75,0,lgray,1);
	
	
	pos = [mpos[2]*.5,mpos[3]*.5];
	spr = _GameTitles[selMode];
	draw_sprite_ext(spr,0,pos[0]-10,pos[1],1,1,0,c_black,0.25);
	draw_sprite_ext(spr,0,pos[0]+10,pos[1],1,1,0,c_black,0.25);
	draw_sprite_ext(spr,0,pos[0]-20,pos[1],1,1,0,c_black,0.125);
	draw_sprite_ext(spr,0,pos[0]+20,pos[1],1,1,0,c_black,0.125);
	
	draw_sprite_ext(spr,0,pos[0],pos[1],1,1,0,c_white,1);

surface_reset_target();

draw_surface(mSurf,mpos[0],mpos[1]);

draw_set_font(_GamesFonts[selMode]);
	
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(mTextPos[0],mTextPos[1],string_lower(mapName),2,2,0);

draw_text_transformed(wTextPos[0],wTextPos[1],string_lower(wadName),2,2,0);

if blinker{
	draw_set_halign(fa_center);
	draw_text_transformed(mTextPos[0]+string_width(string_lower(mapName))/2,mTextPos[1]," |",2,2,0);	
}

var pos = skills[DESkillLevel]
draw_sprite_ext(_GameSelBo[selMode],0,-3+pos.x+pos.sprite_width/2,-2+pos.y+pos.sprite_height/2,image_xscale,image_yscale,0,c_white,1);

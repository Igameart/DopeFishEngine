/// @description 

draw_self();

if DENetPlay{
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,0,c_white,1);
}

if bGlow > -1{
	
	draw_sprite_ext(sprite_index,2+bGlow,x,y,image_xscale,image_yscale,0,c_white,1);
	
}

if wadGameInfo.titlepage != undefined{
	var pos;
	pos = [ mpos[0]+mpos[2]*.5-16, mpos[1]+mpos[3]*.5-8];
	var scale = 1;
	DE_drawimage_ext(wadGameInfo.titlepage,pos[0]-150*scale, pos[1]-120*scale,scale,scale*1.2);
}

draw_set_font(_GamesFonts[selMode]);
	
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text_transformed(mTextPos[0],mTextPos[1],string_lower(mapName),2,2,0);

draw_text_transformed(wTextPos[0],wTextPos[1],string_lower(wadName),2,2,0);

var xx,yy,ww,hh;
xx = processwad_button.bbox_left;
ww = xx - processwad_button.bbox_right;
yy = processwad_button.bbox_top;
hh = yy - processwad_button.bbox_bottom;

draw_text_transformed(pTextPos[0], pTextPos[1]-4,"process wad",2,2,0);

if blinker{
	draw_text_transformed(mTextPos[0]+string_width(string_lower(mapName))/2+23,mTextPos[1],"|",2,2,0);	
}

draw_set_valign(fa_top)

draw_text_transformed(readOut.x+readOut.sprite_width/2,readOut.y,string_lower(_wadDat),2,2,0);

var pos = skills[DESkillLevel]
draw_sprite_ext(_GameSelBo[selMode],0,-3+pos.x+pos.sprite_width/2,-2+pos.y+pos.sprite_height/2,image_xscale,image_yscale,0,c_white,1);

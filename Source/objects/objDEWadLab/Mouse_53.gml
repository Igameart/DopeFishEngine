/// @description 

for (var b = 0; b<array_length(buttons);b++){
	
	var btn = buttons[b];
	
	if instance_exists(btn)
		btn.clicked = false;
		
}

blinker = false;

mTyping = false;

if point_in_rectangle(mouse_x,mouse_y,mBox.bbox_left,mBox.bbox_top,mBox.bbox_right,mBox.bbox_bottom)
	mBox.clicked = true;

for (var b = 0; b<array_length(buttons);b++){
	
	var btn = buttons[b];
	
	if instance_exists(btn)
	if point_in_rectangle(mouse_x,mouse_y,btn.bbox_left,btn.bbox_top,btn.bbox_right,btn.bbox_bottom)
		btn.clicked = true;
		
}

for (var b = 0; b<array_length(skills);b++){
	
	var btn = skills[b];
	
	if instance_exists(btn)
	if point_in_rectangle(mouse_x,mouse_y,btn.bbox_left,btn.bbox_top,btn.bbox_right,btn.bbox_bottom)
		DESkillLevel = b;
		//btn.clicked = true;
		
}

var size = array_length(_GameTitles);

if mBox.clicked == true{
	mTyping = true;
	keyboard_string = mapName;
	alarm[0] = 1;
}
else
if left_button.clicked == true{
	selMode--;
	selMode = smod(selMode,size);
	//wadName = _wadName[selMode];
	sprite_index = _GameThemes[selMode];
	image_index = 0;
	image_speed = 0;
}
else
if processwad_button.clicked == true{
	wad_process();
}
else
if right_button.clicked == true{
	selMode++;
	selMode = smod(selMode,size);
	//wadName = _wadName[selMode];
	sprite_index = _GameThemes[selMode];
	image_index = 0;
	image_speed = 0;
}
else
if mp_button.clicked == true{
	DENetPlay = !DENetPlay;
}
else
if launch_button.clicked == true{
	
	launch_map();
	
}
else
if load_button.clicked == true{
	
	WAD = get_open_filename("GL IWAD|*.wad", "GLDOOM.wad");
	
	wadName = WAD;
	repeat string_count("\\",wadName)
		wadName = string_lower(split(wadName,"\\"));
		
	loading = true;
	alarm[1]=2;
}
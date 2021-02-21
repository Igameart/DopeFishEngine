/// @description 

bGlow = -1;
for (var b = 0; b<array_length_1d(buttons);b++){
	
	var btn = buttons[b];
	
	if instance_exists(btn)
	if point_in_rectangle(mouse_x,mouse_y,btn.bbox_left,btn.bbox_top,btn.bbox_right,btn.bbox_bottom)
		bGlow = b;
		
}
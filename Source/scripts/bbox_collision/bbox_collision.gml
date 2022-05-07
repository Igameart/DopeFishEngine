function bbox_collision( col ){
	
	slide_on_line( col.bbox_left, col.bbox_top, col.bbox_left, col.bbox_bottom );
	slide_on_line( col.bbox_left, col.bbox_bottom, col.bbox_right, col.bbox_bottom );
	slide_on_line( col.bbox_right, col.bbox_bottom, col.bbox_right, col.bbox_top );
	slide_on_line( col.bbox_right, col.bbox_top, col.bbox_left, col.bbox_top );
	
}

with other{// if (NOCLIP == false) {
	
	var _flr,_ceil;
	_flr = DE_FindSectorFloorHeight( other.sector );
	_ceil = DE_FindSectorCeilingHeight( other.sector );
	
	if z < _flr - 24 || z + Height + HeadRoom >= _ceil{
		
	    slide_on_line( other.x,other.y,other.x2,other.y2 );
		
	}

}

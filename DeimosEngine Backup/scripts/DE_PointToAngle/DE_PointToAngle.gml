var _x = argument[0], _y = argument[1];
_x -= DEcam.x;
_y -= DEcam.y;
    
if ( (!_x) && (!_y) )
return 0;

if (_x>= 0)
{
// _x >=0
if (_y>= 0)
{
	// _y>= 0

	if (_x>_y)
	{
	// octant 0
	return tantoangle[ DE_SlopeDiv(_y,_x)];
	}
	else
	{
	// octant 1
	return ANG90-1-tantoangle[ DE_SlopeDiv(_x,_y)];
	}
}
else
{
	// _y<0
	_y = -_y;

	if (_x>_y)
	{
	// octant 8
	return -tantoangle[DE_SlopeDiv(_y,_x)];
	}
	else
	{
	// octant 7
	return ANG270+tantoangle[ DE_SlopeDiv(_x,_y)];
	}
}
}
else
{
// _x<0
_x = -_x;

if (_y>= 0)
{
	// _y>= 0
	if (_x>_y)
	{
	// octant 3
	return ANG180-1-tantoangle[ DE_SlopeDiv(_y,_x)];
	}
	else
	{
	// octant 2
	return ANG90+ tantoangle[ DE_SlopeDiv(_x,_y)];
	}
}
else
{
	// _y<0
	_y = -_y;

	if (_x>_y)
	{
	// octant 4
	return ANG180+tantoangle[ DE_SlopeDiv(_y,_x)];
	}
	else
	{
		// octant 5
	return ANG270-1-tantoangle[ DE_SlopeDiv(_x,_y)];
	}
}
}
return 0;
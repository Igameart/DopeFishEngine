/// DE_PointOnSide( _x,  _y,  _node )

var _x = argument[0], _y = argument[1], _node = argument[2];

var	dx;
var	dy;
var	left;
var	right;

//ds_map_print(_node);
	
if (!_node[?"dx"])
{
if (_x <= _node[?"x"])
	return _node[?"dy"] > 0;
	
return _node[?"dy"] < 0;
}
if (!_node[?"dy"])
{
if (_y <= _node[?"y"])
	return _node[?"dx"] < 0;
	
return _node[?"dx"] > 0;
}
	
dx = (_x - _node[?"x"]);
dy = (_y - _node[?"y"]);
	
// Try to quickly decide by looking at sign bits.
if ( (_node[?"dy"] ^ _node[?"dx"] ^ dx ^ dy)&0x80000000 )
{
	if  ( (_node[?"dy"] ^ dx) & 0x80000000 )
	{
		// (left is negative)
		return 1;
	}
	return 0;
}

left = DE_FixedMul ( _node[?"dy"]>>FRACBITS , dx );
right = DE_FixedMul ( dy , _node[?"dx"]>>FRACBITS );
	
if (right < left)
{
	// front side
	return 0;
}
// back side
return 1;			
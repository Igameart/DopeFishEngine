//-----------------------------------------------------------------------------
//
// RemoveRange
//
//-----------------------------------------------------------------------------

function RemoveRange(range)
{
	if (range == cliphead)
	{
		cliphead = cliphead.next;
	}
	else
	{
		if (range.prev) range.prev.next = range.next;
		if (range.next) range.next.prev = range.prev;
	}
	
	delete (range);
}

//-----------------------------------------------------------------------------
//
// Clear
//
//-----------------------------------------------------------------------------

function Clear()
{
	var node = cliphead;
	var temp;
	
	blocked = false;
	while (node != null)
	{
		temp = node;
		node = node.next;
		delete (temp);
	}
	node = silhouette;

	while (node != null)
	{
		temp = node;
		node = node.next;
		delete (temp);
	}
	
	cliphead = null;
	silhouette = null;
	starttime++;
}

//-----------------------------------------------------------------------------
//
// SetSilhouette
//
//-----------------------------------------------------------------------------

function SetSilhouette()
{
	var node = cliphead;
	var last = null;

	while (node != null)
	{
		var snode = DE_NewRange(node._start, node._end);
		if (silhouette == null) silhouette = snode;
		snode.prev = last;
		if (last != null) last.next = snode;
		last = snode;
		node = node.next;
	}
}

//-----------------------------------------------------------------------------
//
// IsRangeVisible
//
//-----------------------------------------------------------------------------

function IsRangeVisible( startAngle, endAngle)
{
	var ci;
	ci = cliphead;
	
	if (endAngle==0 && ci && ci._start==0) return false;
	
	while (ci != undefined && ci._start < endAngle)
	{
		if (startAngle >= ci._start && endAngle <= ci._end)
		{
			return false;
		}
		ci = ci.next;
	}
	
	return true;
}

//-----------------------------------------------------------------------------
//
// AddClipRange
//
//-----------------------------------------------------------------------------

function AddClipRange( _start, _end)
{
	var node, temp, prevNode;

	if (cliphead)
	{
		//check to see if range contains any old ranges
		node = cliphead;
		while (node != null && node._start < _end)
		{
			if (node._start >= _start && node._end <= _end)
			{
				temp = node;
				node = node.next;
				RemoveRange(temp);
			}
			else if (node._start<=_start && node._end>=_end)
			{
				return;
			}
			else
			{
				node = node.next;
			}
		}
		
		//check to see if range overlaps a range (or possibly 2)
		node = cliphead;
		while (node != null && node._start <= _end)
		{
			if (node._end >= _start)
			{
				// we found the first overlapping node
				if (node._start > _start)
				{
					// the new range overlaps with this node's _start point
					node._start = _start;
				}

				if (node._end < _end) 
				{
					node._end = _end;
				}

				var node2 = node.next;
				while (node2 && node2._start <= node._end)
				{
					if (node2._end > node._end) node._end = node2._end;
					var delnode = node2;
					node2 = node2.next;
					RemoveRange(delnode);
				}
				return;
			}
			node = node.next;		
		}
		
		//just add range
		node = cliphead;
		prevNode = null;
		temp = DE_NewRange(_start, _end);
		
		while (node != null && node._start < _end)
		{
			prevNode = node;
			node = node.next;
		}
		
		temp.next = node;
		if (node == null)
		{
			temp.prev = prevNode;
			if (prevNode) prevNode.next = temp;
			if (!cliphead) cliphead = temp;
		}
		else
		{
			if (node == cliphead)
			{
				cliphead.prev = temp;
				cliphead = temp;
			}
			else
			{
				temp.prev = prevNode;
				prevNode.next = temp;
				node.prev = temp;
			}
		}
	}
	else
	{
		temp = DE_NewRange(_start, _end);
		cliphead = temp;
		return;
	}
}


//-----------------------------------------------------------------------------
//
// RemoveClipRange
//
//-----------------------------------------------------------------------------

function RemoveClipRange( _start, _end)
{
	var node;

	if (silhouette)
	{
		node = silhouette;
		while (node != null && node._end <= _start)
		{
			node = node.next;
		}
		if (node != null && node._start <= _start)
		{
			if (node._end >= _end) return;
			_start = node._end;
			node = node.next;
		}
		while (node != null && node._start < _end)
		{
			DoRemoveClipRange(_start, node._start);
			_start = node._end;
			node = node.next;
		}
		if (_start >= _end) return;
	}
	DoRemoveClipRange(_start, _end);
}
	
//-----------------------------------------------------------------------------
//
// RemoveClipRange worker function
//
//-----------------------------------------------------------------------------

function DE_DoRemoveClipRange( _start,  _end)
{
	var node, temp;

	if (cliphead)
	{
		//check to see if range contains any old ranges
		node = cliphead;
		while (node != null && node._start < _end)
		{
			if (node._start >= _start && node._end <= _end)
			{
				temp = node;
				node = node.next;
				RemoveRange(temp);
			}
			else
			{
				node = node.next;
			}
		}
		
		//check to see if range overlaps a range (or possibly 2)
		node = cliphead;
		while (node != null)
		{
			if (node._start >= _start && node._start <= _end)
			{
				node._start = _end;
				break;
			}
			else if (node._end >= _start && node._end <= _end)
			{
				node._end=_start;
			}
			else if (node._start < _start && node._end > _end)
			{
				temp = DE_NewRange(_end, node._end);
				node._end=_start;
				temp.next=node.next;
				temp.prev=node;
				node.next=temp;
				if (temp.next) temp.next.prev=temp;
				break;
			}
			node = node.next;
		}
	}
}

function DE_NewRange( _start, _end ){
	var temp ={
		prev : _start,
		next : _end
	}
	return temp;
}



//-----------------------------------------------------------------------------
//
// 
//
//-----------------------------------------------------------------------------

function DE_AngleToPseudo(ang)
{
	

	var vecx = cos( ang * M_PI / ANGLE_180 );
	var vecy = sin( ang * M_PI / ANGLE_180 );

	var result = vecy / (abs(vecx) + abs(vecy));
	
	if (vecx < 0)
	{
		result = 2 - result;
	}
	
	return (result);
}

//-----------------------------------------------------------------------------
//
// ! Returns the pseudoangle between the line p1 to (infinity, p1.y) and the 
// line from p1 to p2. The pseudoangle has the property that the ordering of 
// points by true angle around p1 and ordering of points by pseudoangle are the 
// same.
//
// For clipping exact angles are not needed. Only the ordering matters.
// This is about as fast as the fixed point R_PointToAngle2 but without
// the precision issues associated with that function.
//
//-----------------------------------------------------------------------------
/*
function DE_pointToPseudoAngle( X,  Y)
{
	var vecx = X - DEcam.x;
	var vecy = Y - DEcam.y;

	if (vecx == 0 && vecy == 0)
	{
		return 0;
	}
	else
	{
		var result = vecy / (abs(vecx) + abs(vecy));
		if (vecx < 0)
		{
			result = 2. - result;
		}
		return (result);
	}
}*/


function DE_pointToPseudoAngle(X,Y) {
	//angle_t Clipper::PointToPseudoAngle(double x, double y)
	//{
	//var X = argument[0];
	//var Y = argument[1];

	//return point_direction(X,Y,DEcam.x,DEcam.y);
	var vecx = X - DEcam.x;
	var vecy = Y - DEcam.y;

	if (vecx == 0 && vecy == 0)
	{
		return 0;
	}
	else
	{
		var result = vecy / (abs(vecx) + abs(vecy));
		if (vecx < 0)
		{
			result = 2. - result;
		}
		return (result);
	}
}

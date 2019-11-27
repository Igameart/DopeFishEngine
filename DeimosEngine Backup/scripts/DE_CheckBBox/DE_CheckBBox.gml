//boolean R_CheckBBox ( bspcoord )
//{

var bspcoord = argument[0];
var			boxx;
var			boxy;
var			boxpos;

var		x1;
var		y1;
var		x2;
var		y2;

var		angle1;
var		angle2;
var		span;
var		tspan;
    
var		start;

var		sx1;
var		sx2;
    
// Find the corners of the box
// that define the edges from current viewpoint.
if (DEcam.x <= bspcoord[|BBOX.BOXLEFT])
	boxx = 0;
else if (DEcam.x < bspcoord[|BBOX.BOXRIGHT])
	boxx = 1;
else
	boxx = 2;
		
if (DEcam.y >= bspcoord[|BBOX.BOXTOP])
	boxy = 0;
else if (DEcam.y > bspcoord[|BBOX.BOXBOTTOM])
	boxy = 1;
else
	boxy = 2;
		
boxpos = (boxy << 2)+boxx;
if (boxpos == 5)
return true;
	
var cCoord = checkcoord[boxpos];
	
x1 = bspcoord[| cCoord [0] ];
y1 = bspcoord[| cCoord [1] ];
x2 = bspcoord[| cCoord [2] ];
y2 = bspcoord[| cCoord [3] ];
    
// check clip list for an open space
angle1 = DE_PointToAngle (x1, y1) - DEcam.yaw;
angle2 = DE_PointToAngle (x2, y2) - DEcam.yaw;
	
span = angle1 - angle2;

// Sitting on a line?
if (span >= ANG180)
return true;

tspan = angle1 + clipangle;

if (tspan > 2*clipangle)
{
	tspan -= 2*clipangle;

	// Totally off the left edge?
	if (tspan >= span)
		return false;	

	angle1 = clipangle;
}
	
tspan = clipangle - angle2;
	
if (tspan > 2*clipangle)
{
	tspan -= 2*clipangle;

	// Totally off the left edge?
	if (tspan >= span)
		return false;
	
	angle2 = -clipangle;
}


// Find the first clippost
//  that touches the source post
//  (adjacent pixels are touching).
angle1 = (angle1+ANG90);//>>ANGLETOFINESHIFT;
angle2 = (angle2+ANG90);//>>ANGLETOFINESHIFT;
sx1 = dcos(angle1)*320;
sx2 = dcos(angle2)*320;

// Does not cross a pixel.
if (sx1 == sx2)
return false;			
sx2--;

/*
start = solidsegs;
var _seg = solidSeg[start];
while (_seg[?"last"] < sx2){
	start++;
	_seg = solidSeg[start];
}
    
if (sx1 >= start[?"first"]
&& sx2 <= start[?"last"])
{
	// The clippost contains the new span.
	return false;
}*/

return true;
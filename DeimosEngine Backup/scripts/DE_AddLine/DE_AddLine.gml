//void R_AddLine (seg_t*	line)
//{

/*

var line = argument[0];

var		x1;
var		x2;
var		angle1;
var		angle2;
var		span;
var		tspan;
    
var curline = line;

// OPTIMIZE: quickly reject orthogonal back sides.
angle1 = DE_PointToAngle (line->v1->x, line->v1->y);
angle2 = DE_PointToAngle (line->v2->x, line->v2->y);
    
// Clip to view edges.
// OPTIMIZE: make constant out of 2*clipangle (FIELDOFVIEW).
span = angle1 - angle2;
    
// Back side? I.e. backface culling?
if (span >= ANG180)
return;		

// Global angle needed by segcalc.
rw_angle1 = angle1;
angle1 -= viewangle;
angle2 -= viewangle;
	
tspan = angle1 + clipangle;
if (tspan > 2*clipangle)
{
tspan -= 2*clipangle;

// Totally off the left edge?
if (tspan >= span)
	return;
	
angle1 = clipangle;
}
tspan = clipangle - angle2;
if (tspan > 2*clipangle)
{
tspan -= 2*clipangle;

// Totally off the left edge?
if (tspan >= span)
	return;	
angle2 = -clipangle;
}
    
// The seg is in the view range,
// but not necessarily visible.
angle1 = (angle1+ANG90)>>ANGLETOFINESHIFT;
angle2 = (angle2+ANG90)>>ANGLETOFINESHIFT;
x1 = viewangletox[angle1];
x2 = viewangletox[angle2];

// Does not cross a pixel?
if (x1 == x2)
return;				
	
backsector = line->backsector;

// Single sided line?
if (!backsector)
goto clipsolid;		

// Closed door.
if (backsector->ceilingheight <= frontsector->floorheight
|| backsector->floorheight >= frontsector->ceilingheight)
goto clipsolid;		

// Window.
if (backsector->ceilingheight != frontsector->ceilingheight
|| backsector->floorheight != frontsector->floorheight)
goto clippass;	
		
// Reject empty lines used for triggers
//  and special events.
// Identical floor and ceiling on both sides,
// identical light levels on both sides,
// and no middle texture.
if (backsector->ceilingpic == frontsector->ceilingpic
&& backsector->floorpic == frontsector->floorpic
&& backsector->lightlevel == frontsector->lightlevel
&& curline->sidedef->midtexture == 0)
{
return;
}
    
				
clippass:
R_ClipPassWallSegment (x1, x2-1);	
return;
		
clipsolid:
R_ClipSolidWallSegment (x1, x2-1);
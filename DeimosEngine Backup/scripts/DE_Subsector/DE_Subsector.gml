//void R_Subsector (int num)
//{
var num = argument[0];
var	count;
var	line;
var	sub;

sub = mapGLSSects[|num];
//var frontsector = sub[?"sector"];

count = sub[?"count"];

var seg = sub[?"first_seg"];

line = mapGLSegs[|seg];

/*
if (frontsector[?"floor"] < DEcam.z)
{
	floorplane = R_FindPlane(frontsector[?"floor"],
				frontsector[?"tex_f"],
				frontsector[?"lightlevel"]);
}
else
	floorplane = pointer_null;
    
if (frontsector[?"ceiling"] > DEcam.z 
|| DE_isSkyFlat(frontsector[?"tex_c"]))
{
ceilingplane = R_FindPlane (frontsector[?"ceiling"],
				frontsector[?"tex_c"],
				frontsector[?"lightlevel"]);
}
else
	ceilingplane = pointer_null;
		
R_AddSprites (frontsector);	*/

while (count--)
{
	DE_RenderGLSeg(line);
	seg++;
	line = mapGLSegs[|seg];
}
//}
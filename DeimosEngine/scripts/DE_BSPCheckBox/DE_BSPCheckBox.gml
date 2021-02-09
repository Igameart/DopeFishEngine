///@description DE_BSPCheckBox( bspcoord );

var bspcoord = argument[0];

var angle1, angle2;

var boxpos;
var check;
	
// Find the corners of the box
// that define the edges from current viewpoint.
var vp = DEcam;

var bCheck;

bCheck[0] = (vp.x < bspcoord[| BBOX.BOXRIGHT ])? 1 : 2;
bCheck[1] = (vp.y > bspcoord[| BBOX.BOXBOTTOM ])? 4 : 8;

var boxpos =  ( ( vp.x <= bspcoord[| BBOX.BOXLEFT] ) ? 0 : bCheck[0])
			+ ( ( vp.y >= bspcoord[| BBOX.BOXTOP ] ) ? 0 : bCheck[1]);
	
if (boxpos == 5) return true;
	
var check = checkcoord[ boxpos ];
	
angle1 = DE_pointToPseudoAngle ( bspcoord[| check[0] ], bspcoord[| check[1] ] );
angle2 = DE_pointToPseudoAngle ( bspcoord[| check[2] ], bspcoord[| check[3] ] );
	
return DE_BSPSafeCheckRange(angle2, angle1);
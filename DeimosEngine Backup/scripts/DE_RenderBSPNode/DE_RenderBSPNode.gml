//DE_RenderBSPNode  ( int bspnum )
//{

var bspnum = argument[0];

var bsp ;
var side ;

// Found a subsector ?
if ( bspnum &CHILD_IS_SUBSEC )
{
	if ( bspnum == -1)
		DE_RenderGLSSect(0);
	else
		DE_RenderGLSSect( bspnum &CHILD_SUBSEC_MASK);
	return ;
}

bsp = mapGLNodes [| bspnum ];

if bsp == undefined return;

// Decide which side the view point is on.
side = DE_PointOnSide ( DEcam.x , DEcam.y , bsp ) ;

var front = side == 0? "c_l":"c_r";
var back  = side == 1? "c_l":"c_r";


// Recursively divide front space.
var child = bsp[?front];

//trace("Font/back?",front,back,"Child?",child);
DE_RenderBSPNode ( child ) ;

/*

// Possibly divide back space.
child = bsp[?back];
var cBBox = bsp[?back+"_bb"];
if ( DE_CheckBBox ( cBBox ) )
	DE_RenderBSPNode ( child ) ;
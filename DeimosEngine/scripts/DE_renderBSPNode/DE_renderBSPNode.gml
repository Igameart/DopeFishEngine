///@description DE_renderBSPNode (void *node)

var node = argument[0];

if ( node&CHILD_IS_SUBSEC ){
	
	var subsect = node&~CHILD_IS_SUBSEC;
	//if (DE_subsectIsVisible(subsect))
		DE_renderAddSubsector(subsect);
	return
}

if (DE_viewBufferFull())
	return;

var gl_node = mapGLNodes[|node&~CHILD_IS_SUBSEC];

var x1 = gl_node[?"x"];
var y1 = gl_node[?"y"];
var x2 = x1 + gl_node[?"dx"];
var y2 = y1 + gl_node[?"dy"];
var bbox = gl_node[?"bbox"];

var part = [x1,y1,x2,y2];

if (!DE_BSPPointOnSide(part, DEcam.x, DEcam.y))
{
	var children = gl_node[?"children"]
	
	if DE_BSPCheckBox(bbox[1])==1
		DE_renderBSPNode(children[1]);
	
	if DE_BSPCheckBox(bbox[0])==1
		DE_renderBSPNode(children[0]);
}
else
{
	var children = gl_node[?"children"]
	
	if DE_BSPCheckBox(bbox[0])==1
		DE_renderBSPNode(children[0]);
	
	if DE_BSPCheckBox(bbox[1])==1
		DE_renderBSPNode(children[1]);
}
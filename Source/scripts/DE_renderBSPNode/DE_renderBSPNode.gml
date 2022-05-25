///@description DE_renderBSPNode (void *node)
function DE_renderBSPNode(node) {

	if ( node&CHILD_IS_SUBSEC ){
		var subacksector = node & ~CHILD_IS_SUBSEC;
		if (DE_subacksectorIsVisible(subacksector))
			DE_renderAddSubsector(subacksector);
		return
	}

	//if (DE_viewBufferFull())
	//	return;

	var gl_node = mapGLNodes[| node & ~CHILD_IS_SUBSEC ];
	
	if !is_struct(gl_node) {trace(gl_node, node, node & ~CHILD_IS_SUBSEC );return;}

	var x1 = gl_node.x;
	var y1 = gl_node.y;
	var x2 = x1 + gl_node.dx;
	var y2 = y1 + gl_node.dy;
	var bbox = gl_node.bbox;

	var part = [x1,y1,x2,y2];
	
	//part = {
	//	x
	//}

	if (!DE_BSPPointOnSide( DEcam.x, DEcam.y, gl_node ))
	{
		var children = gl_node.children;
	
		if DE_BSPCheckBox(bbox[1])==1
			DE_renderBSPNode(children[1]);
	
		if DE_BSPCheckBox(bbox[0])==1
			DE_renderBSPNode(children[0]);
	}
	else
	{
		var children = gl_node.children;
	
		if DE_BSPCheckBox(bbox[0])==1
			DE_renderBSPNode(children[0]);
	
		if DE_BSPCheckBox(bbox[1])==1
			DE_renderBSPNode(children[1]);
	}

	//return;
}

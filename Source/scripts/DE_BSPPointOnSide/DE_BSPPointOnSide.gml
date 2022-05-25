///@description DE_BSPPointOnSide ( fixed_t x, fixed_t y, node_t* node ){
function DE_BSPPointOnSide(X,Y,node) {

	var dx;
	var dy;
	var left;
	var right;

	if (!node.dx) {
		if (X <= node.x)
			return node.dy > 0;
		return node.dy < 0;
	}

	if (!node.dy) {
		if (Y <= node.y)
			return node.dx < 0;
		return node.dx > 0;
	}

	dx = (X - node.x);
	dy = (Y - node.y);

	// Try to quickly decide by looking at sign bits.
	if ( (node.dy ^ node.dx ^ dx ^ dy)&0x80000000 ){
		if ( (node.dy ^ dx) & 0x80000000 ) {
			// (left is negative)
			return 1;
		}
		return 0;

	}

	left = DE_fixedMul ( node.dy>>FRACBITS * dx );
	right = DE_fixedMul ( dy * node.dx>>FRACBITS );

	if (right < left) {
		// front side
		return 0;
		}
	
	// back side
	return 1;



}

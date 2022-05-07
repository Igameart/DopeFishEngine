/// @description lines_intersect(x0, y0, x1, y1, x2, y2, x3, y3)
/// @param x0
/// @param  y0
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  x3
/// @param  y3
function lines_intersect() {
	/*
	**  Usage:
	**      intersection = lines_intersect(x0, y0, x1, y1, x2, y2, x3, y3);
	**
	**  Description:
	**      Determines if two given lines intersect.
	**
	**  Arguments:
	**      x0, y0    1st coordinate pair for the first line
	**      x1, y1    2nd coordinate pair for the first line
	**      x2, y2    1st coordinate pair for the second line
	**      x3, y3    2nd coordinate pair for the second line
	**
	**  Returns:
	**      TRUE when the lines intersect,
	**      or FALSE otherwise.
	**
	**  Dependences:
	**      is_clockwise()
	**
	**  copyright (c) 2006, John Leffingwell
	**  www.planetxot.com
	*/
	var x0, y0, x1, y1, x2, y2, x3, y3;
	x0 = argument[0];
	y0 = argument[1];
	x1 = argument[2];
	y1 = argument[3];
	x2 = argument[4];
	y2 = argument[5];
	x3 = argument[6];
	y3 = argument[7];
	return ((is_clockwise(x0, y0, x1, y1, x2, y2) != is_clockwise(x0, y0, x1, y1, x3, y3))
	&& (is_clockwise(x2, y2, x3, y3, x0, y0) != is_clockwise(x2, y2, x3, y3, x1, y1)));



}

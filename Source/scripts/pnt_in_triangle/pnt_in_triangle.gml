/// @description pnt_in_triangle(x0, y0, x1, y1, x2, y2, x3, y3);
/// @param x0
/// @param  y0
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  x3
/// @param  y3
function pnt_in_triangle() {
	/*
	**  Usage:
	**      inside = point_in_triangle(x0, y0, x1, y1, x2, y2, x3, y3);
	**
	**  Description:
	**      Determines if a given point lays within a given triangle.
	**
	**  Arguments:
	**      x0, y0    1st coordinate pair for the triangle
	**      x1, y1    2nd coordinate pair for the triangle
	**      x2, y2    3rd coordinate pair for the triangle
	**      x3, y3    Coordinate pair of the test point
	**
	**  Returns:
	**      TRUE when the test point is inside of the given triangle,
	**      or FALSE otherwise.
	**
	**  Dependencies:
	**      is_clockwise()
	**
	**  Notes:
	**      Triangle coordinates should be given in traditional
	**      counter-clockwise order.
	**
	**  copyright (c) 2006, John Leffingwell
	**  www.planetxot.com
	*/
	/*
	var x0, y0, x1, y1, x2, y2, x3, y3;
	x0 = argument[0];
	y0 = argument[1];
	x1 = argument[2];
	y1 = argument[3];
	x2 = argument[4];
	y2 = argument[5];
	x3 = argument[6];
	y3 = argument[7];
	return (not is_clockwise(x0,y0,x1,y1,x3,y3) && not is_clockwise(x1,y1,x2,y2,x3,y3) && not is_clockwise(x2,y2,x0,y0,x3,y3));


/* end pnt_in_triangle */
}

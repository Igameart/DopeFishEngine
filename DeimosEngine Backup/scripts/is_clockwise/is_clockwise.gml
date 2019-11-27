/// @description is_clockwise(x0, y0, x1, y1, x2, y2)
/// @param x0
/// @param  y0
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
/*
**  Usage:
**      clockwise = is_clockwise(x0, y0, x1, y1, x2, y2);
**
**  Description:
**      Given a sequence of three 2D points, return whether or not
**      the sequence is in clockwise or counter-clockwise order.
**
**  Arguments:
**      x0, y0    coordinate pair for the first point
**      x1, y1    coordinate pair for the second point
**      x2, y2    coordinate pair for the third point
**
**  Returns:
**      TRUE if the points are in clockwise order,
**      FALSE if the points are in counter-clockwize order,
**      or (-1) if there is no solution.
**
**  copyright (c) 2006, John Leffingwell
**  www.planetxot.com
*/
var x0, y0, x1, y1, x2, y2, m, b, clockwise;
x0 = argument[0];
y0 = argument[1];
x1 = argument[2];
y1 = argument[3];
x2 = argument[4];
y2 = argument[5];
clockwise = -1;
if ((x0 != x1) || (y0 != y1)) {
    if (x0 == x1) {
        clockwise = (x2 < x1) xor (y0 > y1);
    }else{
        m = (y0 - y1) / (x0 - x1);
        b = y0 - m * x0;
        clockwise = (y2 > (m * x2 + b)) xor (x0 > x1);
    }
}
return clockwise;

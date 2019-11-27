
var xx,yy,x1,y1,x2,y2;

xx = argument[0];
yy = argument[1];
x1 = argument[2];
y1 = argument[3];
x2 = argument[4];
y2 = argument[5];

return sign(( xx-x1 ) * ( y2-y1 ) - ( yy-y1 ) * ( x2-x1 ))/2+0.5;
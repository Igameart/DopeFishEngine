//IsRangeVisible(angle_t startAngle, angle_t endAngle)

var startAngle = argument[0];
var endAngle = argument[1];

//trace("Checking Angle Visibilities:",startAngle,endAngle);

var ci = obj_DE_clipHead;

with ci{

	startAngle *= weight;
	endAngle *= weight;

	//var check = 
	return !ds_grid_get_min(clipBuffer,0,startAngle,endAngle,0);
	
	//if check == 0 return true; else return false;
}
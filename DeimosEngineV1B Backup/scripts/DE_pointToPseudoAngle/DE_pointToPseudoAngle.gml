function DE_pointToPseudoAngle() {
	//angle_t Clipper::PointToPseudoAngle(double x, double y)
	//{
	var X = argument[0];
	var Y = argument[1];

	return point_direction(X,Y,DEcam.x,DEcam.y);

	//var vecx = X - DEcam.x;
	//var vecy = Y - DEcam.y;

	/*if (vecx == 0 && vecy == 0)
	{
		return 0;
	}
	else
	{
		var result = vecy / ( abs(vecx) + abs(vecy) );
	
		if (vecx < 0)
		{
			result = 2. - result;
		}
	
		return result;//xs_Fix<30>::ToFix(result);
	
	}*/
	//}


}

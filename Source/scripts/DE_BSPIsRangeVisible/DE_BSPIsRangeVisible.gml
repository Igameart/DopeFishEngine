function DE_BSPIsRangeVisible(startAngle, endAngle) {
	//IsRangeVisible(angle_t startAngle, angle_t endAngle)

	//trace("Checking Angle Visibilities:",startAngle,endAngle);

	var ci = objDEHWClipper;

	with ci{

		startAngle *= weight;
		endAngle *= weight;

		//var check = 
		return !ds_grid_get_min(clipBuffer,0,startAngle,endAngle,0);
	
		//if check == 0 return true; else return false;
	}

return true;

}

function DE_BSPSafeCheckRange() {
	//bool SafeCheckRange(angle_t startAngle, angle_t endAngle)

	var startAngle = argument[0];
	var endAngle = argument[1];

	if(startAngle > endAngle)
	{
		return ( DE_BSPIsRangeVisible( startAngle, 360) || DE_BSPIsRangeVisible( 0, endAngle));
	}
		
	return DE_BSPIsRangeVisible( startAngle, endAngle);


}

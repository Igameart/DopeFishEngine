function DE_BSPSafeCheckRange(startAngle, endAngle) {
	if(startAngle > endAngle)
	{
		return ( IsRangeVisible( startAngle, ANGLE_MAX) || IsRangeVisible( 0, endAngle));
	}
	return IsRangeVisible( startAngle, endAngle);
}

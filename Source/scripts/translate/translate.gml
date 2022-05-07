/// @description translate(num,min1,max1,min2,max2,clamping)
/// @param num
/// @param min1
/// @param max1
/// @param min2
/// @param max2
/// @param clamps
function translate() {

	var num		= argument[0]
	var min1	= argument[1]
	var max1	= argument[2]
	var min2	= argument[3]
	var max2	= argument[4]
	var clamps	= ( argument_count>5 )? argument[5] : false;
	
	//trace("Translating:",num,min1,max1,min2,max2,clamps);
	
	var check1 = num-min1;
	var check2 = max1-min1;
	
	if check2 == 0 return min2;
	
	var val		= ( (check1) / (check2) * (max2-min2) ) + min2;
	return clamps ? (min2 < max2 ? clamp(val,min2,max2) : clamp(val,max2,min2)) : val;


}

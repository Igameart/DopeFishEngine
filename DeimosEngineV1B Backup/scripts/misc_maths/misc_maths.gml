// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lowest_value(A,B){
	if (A>B) return B;
	if (B>A) return A;
	return A;
}
function highest_value(A,B){
	if (A>B) return A;
	if (B>A) return B;
	return A;
}
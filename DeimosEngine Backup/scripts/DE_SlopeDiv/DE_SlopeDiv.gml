var num = argument[0],den = argument[1];

var ans;

if (den < 512)
	return SLOPERANGE;
ans = (num<<3)/(den>>8);
return ans <= SLOPERANGE ? ans : SLOPERANGE;
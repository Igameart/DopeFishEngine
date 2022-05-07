function bam2rad(ang)
{
	return (ang >> 1) * (pi / ANGLE_90);
}
function rad2bam(ang)
{
	return (ang * ((1<<30) / pi)) << 1;
}

// Returns rand# - rand#
function mRandom2()
{
	return Random2(255);
}

function Random2( mask)
{
	var t = GenRand32() & mask & 255;
	return t - ( GenRand32() & mask & 255 );
}

// HITDICE macro used in Heretic and Hexen
function HitDice( count)
{
	return (1 + (GenRand32() & 7)) * count;
}

function GenRand32()
{
	var r;

	r = irandom_range(-2147483648,2147483647);
	
	return r;
}

function Vec2To( _other )
{
	var ret = { x : _other.x - x, y : _other.y - y };
	return ret;
}
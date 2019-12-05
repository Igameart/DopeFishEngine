var No = false;
var Yes = true;
var Slow,Fast;
Slow = 16;
Fast = 32;
var Open = "Open", Wait = "Wait", Close = "Close";
var Blue = "Blue", Red = "Red", Yell = "Yellow";
var Reg = "Regular", Ext = "Extended";

	//Prepare all door sectors for receiving:
DE_prepDoors();

	//If this Linedef triggers a door, set routine
if DE_IdTypeIsDoor(type) routine = DERoutines.DOOR;

switch type{
		//Regular and extended door types:
	case	1	: CLASS = Reg;	TRIG = ["P","R"];	LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	Yes	; FUNC = [Open, Wait, Close];break;
	case	117	: CLASS = Reg;	TRIG = ["P","R"];	LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	63	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	114	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	29	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	111	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	90	: CLASS = Reg;	TRIG = ["W","R"];	LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	105	: CLASS = Reg;	TRIG = ["W","R"];	LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	4	: CLASS = Reg;	TRIG = ["W","1"];	LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	Yes	; FUNC = [Open, Wait, Close];break;
	case	108	: CLASS = Reg;	TRIG = ["W","1"];	LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
	case	31	: CLASS = Reg;	TRIG = ["P","1"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	118	: CLASS = Reg;	TRIG = ["P","1"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	61	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	115	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	103	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	112	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	86	: CLASS = Reg;	TRIG = ["W","R"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	106	: CLASS = Reg;	TRIG = ["W","R"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	2	: CLASS = Reg;	TRIG = ["W","1"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	109	: CLASS = Reg;	TRIG = ["W","1"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	46	: CLASS = Reg;	TRIG = ["G","R"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
	case	42	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	116	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	50	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	113	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	75	: CLASS = Reg;	TRIG = ["W","R"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	107	: CLASS = Reg;	TRIG = ["W","R"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	3	: CLASS = Reg;	TRIG = ["W","1"];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	110	: CLASS = Reg;	TRIG = ["W","1"];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
	case	196	: CLASS = Ext;	TRIG = ["S","R"];	LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
	case	175	: CLASS = Ext;	TRIG = ["S","1"];	LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
	case	76	: CLASS = Reg;	TRIG = ["W","R"];	LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
	case	16	: CLASS = Reg;	TRIG = ["W","1"];	LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
		//Regular and extended locked door types:
	case	26	: CLASS = Reg;	TRIG = ["P","R"];	LOCK = Blue;	SPEED = Slow;	WAIT = 4 ;	MONST = No; FUNC = [Open, Wait, Close];break;
	case	28	: CLASS = Reg;	TRIG = ["P","R"];	LOCK = Red;		SPEED = Slow;	WAIT = 4 ;	MONST = No; FUNC = [Open, Wait, Close];break;
	case	27	: CLASS = Reg;	TRIG = ["P","R"];	LOCK = Yell;	SPEED = Slow;	WAIT = 4 ;	MONST = No; FUNC = [Open, Wait, Close];break;
	case	32	: CLASS = Reg;	TRIG = ["P","1"];	LOCK = Blue;	SPEED = Slow;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	33	: CLASS = Reg;	TRIG = ["P","1"];	LOCK = Red;		SPEED = Slow;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	34	: CLASS = Reg;	TRIG = ["P","1"];	LOCK = Yell;	SPEED = Slow;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	99	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = Blue;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	134	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = Red;		SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	136	: CLASS = Reg;	TRIG = ["S","R"];	LOCK = Yell;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	133	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = Blue;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	135	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = Red;		SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	case	137	: CLASS = Reg;	TRIG = ["S","1"];	LOCK = Yell;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	

}

	//Let's designate our collision type based on trigger info!
DE_lineDefDefineCollision();

if routine == DERoutines.DOOR{
	trace("Door Type Defined:",CLASS,TRIG,LOCK,SPEED,WAIT,MONST,FUNC)
	DE_switchRetrieveDoorSectors();
}

if TRIG[0] == "S"	//This is a switch
	DE_prepSwitch();
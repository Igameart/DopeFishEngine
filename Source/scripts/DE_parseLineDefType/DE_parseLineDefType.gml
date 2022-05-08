function DE_parseLineDefType() {
	
	var No = false;
	var Yes = true;
	var Slow,Fast;
	Slow = 16;
	Fast = 32;
	var Open = "Open", Wait = "Wait", Close = "Close";
	var Blue = "Blue", Red = "Red", Yell = "Yellow";
	var Reg = "Regular", Ext = "Extended";
	var Push = "P", Repeatable = "R", Switched = "S", Walkover = "W", Gun = "G", Once = "1";

	if WAD_FORMAT == "DOOM"{//Disable hexen format for now, that requires implementing different functions

			//If this Linedef triggers a door, set routine
		if DE_IdTypeIsDoor(specialtype) routine = DERoutines.DOOR;
		else
		if DE_IdTypeIsFloor(specialtype) routine = DERoutines.FLOOR;

		switch specialtype{
			
				//Regular and extended door types:
			case	1	: CLASS = Reg;	TRIG = [Push,Repeatable];		LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	Yes	; FUNC = [Open, Wait, Close];break;
			case	117	: CLASS = Reg;	TRIG = [Push,Repeatable];		LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	63	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	114	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	29	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	111	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	90	: CLASS = Reg;	TRIG = [Walkover,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	105	: CLASS = Reg;	TRIG = [Walkover,Repeatable];	LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	4	: CLASS = Reg;	TRIG = [Walkover,Once];			LOCK = No;	SPEED = Slow;	WAIT =	4;	MONST =	Yes	; FUNC = [Open, Wait, Close];break;
			case	108	: CLASS = Reg;	TRIG = [Walkover,Once];			LOCK = No;	SPEED = Fast;	WAIT =	4;	MONST =	No	; FUNC = [Open, Wait, Close];break;
			case	31	: CLASS = Reg;	TRIG = [Push,Once];				LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	118	: CLASS = Reg;	TRIG = [Push,Once];				LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	61	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	115	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	103	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	112	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	86	: CLASS = Reg;	TRIG = [Walkover,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	106	: CLASS = Reg;	TRIG = [Walkover,Repeatable];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	2	: CLASS = Reg;	TRIG = [Walkover,Once];			LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	109	: CLASS = Reg;	TRIG = [Walkover,Once];			LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	46	: CLASS = Reg;	TRIG = [Gun,Repeatable];		LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Open];break;
			case	42	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	116	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	50	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	113	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	75	: CLASS = Reg;	TRIG = [Walkover,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	107	: CLASS = Reg;	TRIG = [Walkover,Repeatable];	LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	3	: CLASS = Reg;	TRIG = [Walkover,Once];			LOCK = No;	SPEED = Slow;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	110	: CLASS = Reg;	TRIG = [Walkover,Once];			LOCK = No;	SPEED = Fast;	WAIT =	-1;	MONST =	No	; FUNC = [Close];break;
			case	196	: CLASS = Ext;	TRIG = [Switched,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
			case	175	: CLASS = Ext;	TRIG = [Switched,Once];			LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
			case	76	: CLASS = Reg;	TRIG = [Walkover,Repeatable];	LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
			case	16	: CLASS = Reg;	TRIG = [Walkover,Once];			LOCK = No;	SPEED = Slow;	WAIT =	30;	MONST =	No	; FUNC = [Close, Wait, Open];break;
			
				//Regular and extended locked door types:
			case	26	: CLASS = Reg;	TRIG = [Push,Repeatable];		LOCK = Blue;	SPEED = Slow;	WAIT = 4 ;	MONST = No; FUNC = [Open, Wait, Close];break;
			case	28	: CLASS = Reg;	TRIG = [Push,Repeatable];		LOCK = Red;		SPEED = Slow;	WAIT = 4 ;	MONST = No; FUNC = [Open, Wait, Close];break;
			case	27	: CLASS = Reg;	TRIG = [Push,Repeatable];		LOCK = Yell;	SPEED = Slow;	WAIT = 4 ;	MONST = No; FUNC = [Open, Wait, Close];break;
			case	32	: CLASS = Reg;	TRIG = [Push,Once];				LOCK = Blue;	SPEED = Slow;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	33	: CLASS = Reg;	TRIG = [Push,Once];				LOCK = Red;		SPEED = Slow;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	34	: CLASS = Reg;	TRIG = [Push,Once];				LOCK = Yell;	SPEED = Slow;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	99	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = Blue;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	134	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = Red;		SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	136	: CLASS = Reg;	TRIG = [Switched,Repeatable];	LOCK = Yell;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	133	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = Blue;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	135	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = Red;		SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
			case	137	: CLASS = Reg;	TRIG = [Switched,Once];			LOCK = Yell;	SPEED = Fast;	WAIT = -1;	MONST = No; FUNC = [Open];break;
	
				//Regular and extended floor types
			case	60	: CLASS = Reg; TRIG =[Switched,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	23	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	82	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	38	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	177	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	159	: CLASS = Ext; TRIG =[Switched,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	84	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	37	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Floor";break;
			case	69	: CLASS = Reg; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	18	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	128	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	119	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	132	: CLASS = Reg; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	131	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	129	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	130	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	222	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	221	: CLASS = Ext; TRIG =[Switched,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	220	: CLASS = Ext; TRIG =[Walkover,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	219	: CLASS = Ext; TRIG =[Walkover,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Next Neighbor Floor";break;
			case	64	: CLASS = Reg; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Ceiling";break;
			case	101	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Ceiling";break;
			case	91	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Ceiling";break;
			case	5	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Ceiling";break;
			case	24	: CLASS = Reg; TRIG =[Gun,Once];			DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Lowest Neighbor Ceiling";break;
			case	65	: CLASS = Reg; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = Yes;	TARGET = "Lowest Neighbor Ceiling - 8";break;
			case	55	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = Yes;	TARGET = "Lowest Neighbor Ceiling - 8";break;
			case	94	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = Yes;	TARGET = "Lowest Neighbor Ceiling - 8";break;
			case	56	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = Yes;	TARGET = "Lowest Neighbor Ceiling - 8";break;
			case	45	: CLASS = Reg; TRIG =[Switched,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor";break;
			case	102	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor";break;
			case	83	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor";break;
			case	19	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Dn"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor";break;
			case	70	: CLASS = Reg; TRIG =[Switched,Repeatable];	DIR = "Dn"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor + 8";break;
			case	71	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Dn"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor + 8";break;
			case	98	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Dn"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor + 8";break;
			case	36	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Dn"; SPEED = Fast; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Highest Neighbor Floor + 8";break;
			case	180	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	161	: CLASS = Ext; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	92	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	58	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	179	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	160	: CLASS = Ext; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	93	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	59	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "Absolute 24";break;
			case	176	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Abs Shortest Lower Texture";break;
			case	158	: CLASS = Ext; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Abs Shortest Lower Texture";break;
			case	96	: CLASS = Reg; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Abs Shortest Lower Texture";break;
			case	30	: CLASS = Reg; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Abs Shortest Lower Texture";break;
			case	178	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 512";break;
			case	140	: CLASS = Reg; TRIG =[Switched,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 512";break;
			case	147	: CLASS = Ext; TRIG =[Walkover,Repeatable];	DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 512";break;
			case	142	: CLASS = Ext; TRIG =[Walkover,Once];		DIR = "Up"; SPEED = Slow; TEXTURE_CHANGE = "None"; MODEL = "--" ; MONST= No; CRUSH = No;	TARGET = "Absolute 512";break;
			case	190	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "None";break;
			case	189	: CLASS = Ext; TRIG =[Switched,Once];		DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "None";break;
			case	154	: CLASS = Ext; TRIG =[Walkover,Repeatable];	DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "None";break;
			case	153	: CLASS = Ext; TRIG =[Walkover,Once];		DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Trg"; MONST= No; CRUSH = No;	TARGET = "None";break;
			case	78	: CLASS = Ext; TRIG =[Switched,Repeatable];	DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "None";break;
			case	241	: CLASS = Ext; TRIG =[Switched,Once];		DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "None";break;
			case	240	: CLASS = Ext; TRIG =[Walkover,Repeatable];	DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "None";break;
			case	239	: CLASS = Ext; TRIG =[Walkover,Once];		DIR = "--"; SPEED = "--"; TEXTURE_CHANGE = "TxTy"; MODEL = "Num"; MONST= No; CRUSH = No;	TARGET = "None";break;

		}
	
	}

		//Let's designate our collision type based on trigger info!
	DE_lineDefDefineCollision();

	switch routine {
		
		case DERoutines.DOOR:
			repeatable = ( TRIG[1] == Repeatable );
			//DEtrace("Door Type Defined:",CLASS,TRIG,LOCK,SPEED,WAIT,MONST,FUNC)
			DE_switchRetrieveDoorSectors();
			routine = DERoutines.DOOR;
		break;
		
		case DERoutines.FLOOR:
			instance_destroy();
			//DEtrace("Floor Type Defined:",CLASS,TRIG,LOCK,SPEED,WAIT,MONST,FUNC)
			//DE_switchRetrieveDoorSectors();
		break;
		
	}

	if TRIG[0] == "S"	//This is a switch
		DE_prepSwitch();


}

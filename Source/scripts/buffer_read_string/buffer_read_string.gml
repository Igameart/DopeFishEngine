function buffer_read_string(argument0, argument1) {
	//buffer_read_string(buffer,string length)
	var buffer,str,len;
	buffer=argument0
	len=argument1;
	str=""
	repeat len
	  str+=chr(buffer_read(buffer,buffer_u8));
	return str;



}

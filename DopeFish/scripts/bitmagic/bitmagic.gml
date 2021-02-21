function byte_get_bit( byte, N ){
	
	//var bit = (b & (1 << bitNumber-1)) != 0;
	//return bit;
	// get Nth bit in byte 
	var bit = byte & (1 << N);

	//make it into a bool:
	var b = (bit != 0);
	return b;
	
}

function bit_get(_val, _bit) {
  return ((_val & (1 << _bit)) != 0);
}

function bit_set(_val, _bit) {
  return (_val | (1 << _bit));
}

function bit_clear(_val, _bit) {
  return (_val & ~(1 << _bit));
}

function bit_toggle(_val, _bit) {
  return (_val ^ (1 << _bit));
}
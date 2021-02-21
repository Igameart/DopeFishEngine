function DE_viewBufferFull() {
	var cl = obj_DE_clipHead;

	with cl return ds_grid_get_min(clipBuffer,0,0,span*weight,0);


}

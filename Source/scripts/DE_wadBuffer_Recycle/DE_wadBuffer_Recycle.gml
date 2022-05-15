function DE_wadBuffer_Recycle(){
	buffer_delete(wadbuff);
	ds_data_recycle();
	ds_data_init();
}
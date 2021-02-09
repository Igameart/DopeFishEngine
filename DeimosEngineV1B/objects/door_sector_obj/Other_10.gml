/// @description 

//sector = mapSectors[|sector];

//ds_map_print(sector);

if (sector[?"door height"] != undefined && sector[?"floor"] != undefined){

	doorHeight = sector[?"door height"] - sector[?"floor"];

	doorPos = 0;//doorHeight;
}
var l,b;
//this.wad.flats=[];
globalvar flats_;
flats_=ds_map_build();

var readflats=false;
for(l=0;l<ds_list_size(wadDirectory);l+=1){
    lump=ds_list_find_value_fixed(wadDirectory,l);
    var n=ds_map_find_value_fixed(lump,"name")
    switch(n){
        case "F1_START":case "F1_END":readflats=!readflats;break;
        case "F2_START":case "F2_END":readflats=!readflats;break;
        default:
        if(readflats){
            buffer_seek(wadbuff,buffer_seek_start,ds_map_find_value_fixed(lump,"filepos"));
            var flat=ds_list_build();
        show_debug_message("NOTICE: Found FLAT:"+n+"="+string(flat));
            repeat 4096{
                ds_list_add(flat,buffer_read(wadbuff,buffer_u8));
            }
            ds_map_add(flats_,n,flat);
        }
        break;
    }
}


show_debug_message("NOTICE: Found "+string(ds_map_size(flats_))+" FLATS.");

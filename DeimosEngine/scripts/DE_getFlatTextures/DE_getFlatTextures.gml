var l,b;
//this.wad.flats=[];

var readflats=false;
for(l=0;l<ds_list_size(wadDirectory);l+=1){
    var lump=ds_list_find_value_fixed(wadDirectory,l);
    var n=ds_map_find_value_fixed(lump,"name")
    switch(n){
        case "F_START": case "F_END": readflats=!readflats; break;
        case "FF_START": case "FF_END": readflats=!readflats; break;
        case "F1_START": case "F1_END": readflats=!readflats; break;
        case "F2_START": case "F2_END": readflats=!readflats; break;
        case "F3_START": case "F3_END": readflats=!readflats; break;
        case "F4_START": case "F4_END": readflats=!readflats; break;
        case "F5_START": case "F5_END": readflats=!readflats; break;
        case "F6_START": case "F6_END": readflats=!readflats; break;
        default:
        if(readflats){
			
            buffer_seek(wadbuff,buffer_seek_start,ds_map_find_value_fixed(lump,"filepos"));
            var flat=ds_list_build();
			show_debug_message("NOTICE: Found FLAT:"+n);
			
            repeat 4096{
                ds_list_add(flat,buffer_read(wadbuff,buffer_u8));
            }
			
            flats_[?n]=(flat);
			
			
        }
        break;
    }
}


show_debug_message("NOTICE: Found "+string(ds_map_size(flats_))+" FLATS.");

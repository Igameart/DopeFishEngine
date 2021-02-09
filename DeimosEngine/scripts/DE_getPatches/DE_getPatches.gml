
var l,len,curl,pcount,patch,poff;

DE_bufferSeekLump("PNAMES");

pcount=buffer_read(wadbuff,buffer_u32);

//he3d.log("NOTICE","Found "+pcount+" wadPatches in Lump:",'PNAMES');
show_debug_message("NOTICE: Found "+string(pcount)+" wadPatches in Lump: PNAMES");


for(var p=0;p<pcount;p++){
    var str=buffer_read_string(wadbuff,8)
	trace("NOTICE: Found PNAME "+str);
    ds_list_add(wadPNames,string_upper(str));
}
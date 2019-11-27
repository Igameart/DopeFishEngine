var e=argument0;
var file=e;
var filename=e;

repeat 30
    wad = string_lower(split(wad,"\\"));

var fileType=string_lower(split(filename,"."));
show_debug_message("Map File Extension: "+fileType);

if file_exists(file)=false{
    show_debug_message("FATAL: Failed to retrieve Map:"+file);
    return false;
}else{
    switch(fileType){
        case "wad":
        show_debug_message("SUCCESS: Retrieved Map:"+file);
        wadbuff = buffer_load(file);
        return true;
        break;
        default:
        show_debug_message("WARNING: Unknown map file type"+fileType)
        return false;
        break;
    };
}

var e=argument0;
var file=e;//working_directory+"\"+e;
var filename=e;

repeat string_count("\\",wad)
    wad = string_lower(split(wad,"\\"));

var fileType=string_lower(split(filename,"."));
show_debug_message("Map File Extension: "+fileType);

if file_exists(file)=false{
    show_debug_message("FATAL: Failed to retrieve Map:"+file);
    return false;
}else{
    
    //mxhr.addEventListener('load',function(){
    //if(mxhr.status!=200){
    //    show_debug_message('FATAL: Failed to retrieve Map: '+file);
    //    return
    //}
    
    switch(fileType){
        case "wad":
        show_debug_message("SUCCESS: Retrieved Map:"+file);
        //parse(filename,curmap,"arraybuffer");
        //wad=file_bin_open(file,0);
        wadbuff = buffer_load(file);
        return true;
        break;
        default:
        show_debug_message("WARNING: Unknown map file type"+fileType)
        return false;
        break;
    };
}

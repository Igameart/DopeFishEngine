var e=argument0;
var file=e;//working_directory+"\"+e;
var filename=e;

repeat string_count("\\",wad)
    wad = string_lower(split(wad,"\\"));
	
globalvar wadbuff;

// Some WAD defines
globalvar MAP_SCALE; MAP_SCALE = 1.0;
globalvar MAX_THINGS; MAX_THINGS = 137;
globalvar NOINDEX; NOINDEX = 65536;
globalvar SUBSECTOR; SUBSECTOR = (1<<15);
globalvar VERT_IS_GL;// VERT_IS_GL = (1<<15);
globalvar ANIM_FPS; ANIM_FPS = 35.0;
globalvar FF_FRAMEMASK; FF_FRAMEMASK = $7fff;
globalvar FF_FULLBRIGHT; FF_FULLBRIGHT = $8000;
globalvar PLAYER_HEIGHT; PLAYER_HEIGHT = 40;
globalvar NOGROUND; NOGROUND = -9999;
globalvar ANGLE_MASK; ANGLE_MASK = $FFFFFFFF;
globalvar WAD_FORMAT; WAD_FORMAT = "DOOM";
globalvar glversion; glversion = -1;

globalvar wadHeader; wadHeader = noone;
globalvar wadDirectory; wadDirectory = noone;
globalvar wadColorMaps; wadColorMaps = noone;
globalvar wadPlaypal; wadPlaypal = noone;
globalvar wadPatches; wadPatches = noone;
globalvar wadPNames; wadPNames = noone;
globalvar wadWallTextures; wadWallTextures = noone;
globalvar wadFlatTextures; wadFlatTextures = noone;

globalvar mapLinedefs; mapLinedefs = noone;
globalvar mapVertexes; mapVertexes = noone;
globalvar mapSidedefs; mapSidedefs = noone;
globalvar mapSectors; mapSectors = noone;
globalvar mapThings; mapThings = noone;
globalvar mapGLVerts; mapGLVerts = noone;
globalvar mapGLSegs; mapGLSegs = noone;
globalvar mapGLSSects; mapGLSSects = noone;

//globalvar null; null=NOINDEX;

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

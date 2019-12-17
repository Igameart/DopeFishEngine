var j = argument[0];

var segs = mapGLSegs;//ds_map_find_value_fixed(wad_levels,"linedefs");
var lines = mapLinedefs;//ds_map_find_value_fixed(wad_levels,"linedefs");
var sects = mapSectors;//ds_map_find_value_fixed(wad_levels,"sectors");
var sides = mapSidedefs;//ds_map_find_value_fixed(wad_levels,"sidedefs");

var seg = segs[|j];

var l = seg[?"linedef"];

if l = 65535 return;

var linedef = ds_list_find_value(lines,l);
	
/** /
var verts = mapVertexes;//ds_map_find_value_fixed(wad_levels,"vertexes");
var gverts = mapGLVerts;//ds_map_find_value_fixed(wad_levels,"glverts");
var startv,endv;

startv = seg[?"start"];
endv = seg[?"end"];
	
var sx,sy,ex,ey,vert,vcheck;
vcheck=verts;
if(startv&VERT_IS_GL){
    startv=startv&~VERT_IS_GL;
    vcheck=gverts;
}
    
vert=ds_list_find_value(vcheck,startv);
sx = ds_map_find_value(vert,"x");
sy = ds_map_find_value(vert,"y");
    
vcheck=verts;
if(endv&VERT_IS_GL){
    endv=endv&~VERT_IS_GL;
    vcheck=gverts;
}
    
vert=ds_list_find_value(vcheck,endv);
ex = ds_map_find_value(vert,"x");
ey = ds_map_find_value(vert,"y");
    
if !is_clockwise(sx,sy,ex,ey,DEcam.x,DEcam.y) return;
/**/

var lSides = ["right","left"];
var s = lSides[seg[?"side"]];

s = linedef[?s];
var side = sides[|s];

var flags = ds_map_find_value_fixed(linedef,"flags");
    
var s=ds_map_find_value(side,"sector");
s = ds_list_find_value(sects,s);
            
var bs = lSides[!seg[?"side"]];
bs = linedef[?bs];
var bside = ds_list_find_value_fixed(sides,bs);
var b=ds_map_find_value_fixed(bside,"sector");
b = ds_list_find_value_fixed(sects,b);

var zadd = ds_map_find_value(s,"lift");
    
shader_set_uniform_f(u_midBotOff,zadd);
var crushing = ds_map_find_value_fixed(b,"crush");
    
shader_set_uniform_f(u_lowBotOff,zadd);
shader_set_uniform_f(u_upBotOff,crushing);
    
zadd = ds_map_find_value_fixed(b,"lift");
shader_set_uniform_f(u_lowTopOff,zadd);
        
crushing = ds_map_find_value(s,"crush");
shader_set_uniform_f(u_midTopOff,crushing);
    
shader_set_uniform_f(u_upTopOff,crushing);
    
var val=ds_map_find_value_fixed(flags,"peg_lower");
if is_real(val)
shader_set_uniform_f(u_LowPeg,val);
    
val=ds_map_find_value_fixed(flags,"peg_upper");
if is_real(val)
shader_set_uniform_f(u_UpPeg,val);
    

var vbuffer=ds_map_find_value_fixed(seg,"vbuffer");
var tex_l=ds_map_find_value_fixed(side,"tex_l");
var tex_u=ds_map_find_value_fixed(side,"tex_u");
var tex_m=ds_map_find_value_fixed(side,"tex_m");
    
    
if tex_l!="-" or tex_u!="-" or tex_m!="-"{
        
    var vtex_l=ds_map_find_value(pload_tex,tex_l);
    var vtex_u=ds_map_find_value(pload_tex,tex_u);
    var vtex_m=ds_map_find_value(pload_tex,tex_m);
        
    if is_undefined(vtex_m){
        vtex_m = [0,0,0];
    }else{
        shader_set_uniform_f(u_TexHM,sprite_get_height(vtex_m[0]));
    }
        
    if !is_undefined(vtex_l){
						
        if sprite_exists(vtex_l[0]){
								
            shader_set_uniform_f(u_TexHL,sprite_get_height(vtex_l[0]));
				
			shader_set_uniform_f(shd_uLuv,vtex_l[1],vtex_l[2]);
				
            texture_set_stage(shd_ltex,sprite_get_texture(vtex_l[0],0));
				
        }
			
    }else texture_set_stage(shd_ltex,0);
        
    if !is_undefined(vtex_u){
			
        if sprite_exists(vtex_u[0]){
								
            shader_set_uniform_f(u_TexHU,sprite_get_height(vtex_u[0]));
				
			shader_set_uniform_f(shd_uUuv,vtex_u[1],vtex_u[2]);
				
            texture_set_stage(shd_utex,sprite_get_texture(vtex_u[0],0));
				
        }
            
    }else texture_set_stage(shd_utex,0);
			
		shader_set_uniform_f(shd_uMuv,vtex_m[1],vtex_m[2]);
			
		vertex_submit(vbuffer,pr_trianglelist,sprite_get_texture(vtex_m[0],0));
}
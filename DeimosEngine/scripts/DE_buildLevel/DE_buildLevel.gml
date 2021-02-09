level=argument0;

//he3d.log("DEBUG","Level Vertexes: ",
//this.wad.levels[level].vertexes.length+this.wad.levels[level].glverts.length);

var map=ds_map_find_value_fixed(wad_levels,level);

globalvar worldbb;
worldbb[0]=null;
worldbb[1]=null;
worldbb[2]=null;
worldbb[3]=null;
worldbb[4]=0;
worldbb[5]=0;

globalvar data;data=ds_map_build();
var flats=ds_map_build();
ds_map_add(flats,"verts",ds_list_build());
ds_map_add(flats,"colors",ds_list_build());
ds_map_add(flats,"uv",ds_list_build());
ds_map_add(flats,"brightness",ds_list_build());
ds_map_add(flats,"type",ds_list_build());
ds_map_add(flats,"sector",ds_list_build());
ds_map_add(flats,"indices",ds_list_build());
ds_map_add(flats,"cf",ds_list_build());
ds_map_add(flats,"i",0);


ds_map_add(data,"verts",ds_list_build());
ds_map_add(data,"normals",ds_list_build());
ds_map_add(data,"indices",ds_list_build());
ds_map_add(data,"colours",ds_list_build());
ds_map_add(data,"textures",ds_list_build());
ds_map_add(data,"flats",flats);
ds_map_add(data,"flattextures",ds_list_build());
ds_map_add(data,"uv",ds_list_build());
ds_map_add(data,"type",ds_list_build());
ds_map_add(data,"sector",ds_list_build());
ds_map_add(data,"brightness",ds_list_build());
ds_map_add(data,"i",0);

//ds_map_add(wad_levels,"glnodes",glnodes);
show_debug_message("DEBUG: Building Nodes. Total: "+string(ds_list_size(ds_map_find_value_fixed(wad_levels,"glnodes"))));

map_glnodes=ds_map_find_value_fixed(wad_levels,"glnodes");

var node,bsplines=ds_list_build(),bspidx=ds_list_build(),bspi=0;
for(var n=0;n<ds_list_size(map_glnodes);n+=1){
node=ds_list_find_value_fixed(map_glnodes,n);
node_c_r=ds_map_find_value_fixed(node,"c_r");
node_c_l=ds_map_find_value_fixed(node,"c_l");
if(node_c_r&SUBSECTOR)
	DE_buildSSectorOld(data,map,node,0,node_c_r&~SUBSECTOR);
if(node_c_l&SUBSECTOR)
	DE_buildSSectorOld(data,map,node,1,node_c_l&~SUBSECTOR);

//bsplines.push(
//node.x,this.wad.worldbb[5],node.y,2.1,
//node.x+node.dx,this.wad.worldbb[5],node.y+node.dy,2.1
//);
//bspidx.push(bspi++,bspi++);

}


var nodes=map_glnodes;
var sectors=ds_map_find_value_fixed(wad_levels,"sectors");
/*
spawnPos=[0,0,0];
spawnDir=0;
/*
for(var t=0;t<map.things.length;t++){
if(map.things[t].type==1){
this.wad.spawnPos=[
-map.things[t].x*MAP_SCALE,
((map.things[t].y*MAP_SCALE)+PLAYER_HEIGHT),
-map.things[t].z*MAP_SCALE
];
this.wad.spawnDir=Math.round((map.things[t].angle/360)*8)||8;
if(this.wad.spawnDir<0)this.wad.spawnDir+=360;
he3d.log("NOTICE","Found Spawn Point:",this.wad.spawnPos[0]+"x"+this.wad.spawnPos[2]);
}
}*/

// Build Heightmap
//wadLoader.buildHeightmap(data);

//he3d.log("DEBUG","Building Textures"," ");
show_debug_message("DEBUG: Building Textures.");

//DE_buildWallTextures(data);
//DE_buildFlatTextures(data);
//DE_buildSkyTextures(data);

//this.wad.bsplinesdata=new Float32Array(bsplines);
//this.wad.bsplinesindices=new Float32Array(bspidx);

//he3d.log("DEBUG","Total Wall Triangles",data.verts.length/3);
/* this tool doesnt exist in GM so we'll skip it for now
this.wad.mapdata=he3d.tools.interleaveFloat32Arrays([3,3,2,1,1,1],
[data.verts,data.normals,data.uv,data.brightness,data.type,data.sector]);
this.wad.indices=data.indices;

//he3d.log("DEBUG", "Building Flat Normals");
//var flatnormals = he3d.tools.createNormalsFromVerts(data.flats.verts);

//he3d.log("DEBUG","Total Flats Triangles",data.flats.verts.length/3);

this.wad.flatdata=he3d.tools.interleaveFloat32Arrays([3,3,2,1,1,1,1],
[data.flats.verts,flatnormals,data.flats.uv,data.flats.frames,
data.flats.brightness,data.flats.type,data.flats.sector]);*/

//this.wad.flatindices=data.flats.indices;

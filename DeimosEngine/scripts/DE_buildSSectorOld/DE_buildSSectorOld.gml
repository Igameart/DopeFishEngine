/// @description DE_buildSSector=function(data,map,node,side,ss){
/// @param data
/// @param map
/// @param node
/// @param side
/// @param ss
/*
var data=argument0;
var map=argument1;
var node=argument2;
var side=argument3;
var ss=argument4;

var glssect=ds_map_find_value_fixed(wad_levels,"glssects");
var glsegs=ds_map_find_value_fixed(wad_levels,"glsegs");
var glverts=ds_map_find_value_fixed(wad_levels,"glverts");
var vertexes=ds_map_find_value_fixed(wad_levels,"vertexes");
var linedefs=ds_map_find_value_fixed(wad_levels,"linedefs");
var sidedefs=ds_map_find_value_fixed(wad_levels,"sidedefs");

var off=ds_map_find_value_fixed(ds_list_find_value_fixed(glssect,ss),"start");
var lines=ds_list_build();

for(var segno=0;segno<ds_map_find_value_fixed(ds_list_find_value_fixed(glssect,ss),"count");segno++){
	
	var off_segno=ds_list_find_value_fixed(glsegs,off+segno)
	var start=ds_map_find_value_fixed(off_segno,"start");
	var end_=ds_map_find_value_fixed(off_segno,"end");

	var line=ds_list_find_value_fixed(linedefs,ds_map_find_value_fixed(off_segno,"linedef"));

	var line_left=ds_map_find_value_fixed(line,"left");
	var line_right=ds_map_find_value_fixed(line,"right");
	var line_flags=ds_map_find_value_fixed(line,"flags");

	ds_list_add(lines,start);

	if(!line)
	continue;

	if(ds_map_find_value_fixed(line,"type")==1){
	trace("DEBUG","Part of a door at segno:",off+segno);
}


/*
if(ds_map_find_value_fixed(off_segno,"side")==0){
if(line_left){
	DE_addWall(data,map,ds_map_find_value_fixed(sidedefs,line_right),ds_map_find_value_fixed(sidedefs,line_left),start,end_,line_flags);
}else{
	DE_addWall(data,map,ds_map_find_value_fixed(sidedefs,line_right),null,start,end_,line_flags);
}
} else {
if(line_right){
	DE_addWall(data,map,ds_map_find_value_fixed(sidedefs,line_left),ds_map_find_value_fixed(sidedefs,line_right),start,end_,line_flags);
}else{
	DE_addWall(data,map,ds_map_find_value_fixed(sidedefs,line_left),null,start,end_,line_flags);
}
}
}*/

/*if(!ds_map_find_value_fixed(node,"sector"))
ds_map_replace(node,"sector",ds_map_find_value_fixed(data,"fsector"));

//SKIP THIS FOR NOW AS I'M MORE CONCERNED ABOUT LEVEL GEOMETRY
// Get Thing Heights
//DE_findThingInSSector(map,(!side)?node.bb_r:node.bb_l,data.floor);* /

var node_bb_r=ds_map_find_value_fixed(node,"bb_r");
var node_bb_l=ds_map_find_value_fixed(node,"bb_l");

/*
// World Bounding Box
if(!side){
if(worldbb[0]==null||ds_list_find_value_fixed(node_bb_r[0]<worldbb[0])
worldbb[0]=ds_list_find_value_fixed(node_bb_r,0);
if(worldbb[1]==null||ds_list_find_value_fixed(node_bb_r[1]>worldbb[1])
worldbb[1]=ds_list_find_value_fixed(node_bb_r,1);
if(worldbb[2]==null||ds_list_find_value_fixed(node_bb_r[2]<worldbb[2])
worldbb[2]=ds_list_find_value_fixed(node_bb_r,2);
if(worldbb[3]==null||ds_list_find_value_fixed(node_bb_r[3]>worldbb[3])
worldbb[3]=ds_list_find_value_fixed(node_bb_r,3);
}else{
if(worldbb[0]==null||ds_list_find_value_fixed(node_bb_l[0]<worldbb[0])
worldbb[0]=ds_list_find_value_fixed(node_bb_l,0);
if(worldbb[1]==null||ds_list_find_value_fixed(node_bb_l[1]>worldbb[1])
worldbb[1]=ds_list_find_value_fixed(node_bb_l,1);
if(worldbb[2]==null||ds_list_find_value_fixed(node_bb_l[2]<worldbb[2])
worldbb[2]=ds_list_find_value_fixed(node_bb_l,2);
if(worldbb[3]==null||ds_list_find_value_fixed(node_bb_l[3]>worldbb[3])
worldbb[3]=ds_list_find_value_fixed(node_bb_l,3);
}
* /
var data_floor=ds_map_find_value_fixed(data,"floor");
var data_ceiling=ds_map_find_value_fixed(data,"ceiling");

if(data_floor<worldbb[4])
worldbb[4]=data.floor;
if(data_ceiling>worldbb[5])
worldbb[5]=data_ceiling;

// Floor
var sv=0;
var nv=1;
var itr=false;
var ev=ds_list_size(lines)-1;
var tris=ds_list_size(lines)-2;

if tris<1 then return 0;

var data_flats=ds_map_find_value_fixed(data,"flats")
var data_floor=ds_map_find_value_fixed(data,"floor");
var verts=ds_map_find_value_fixed(data_flats,"verts");

var first=true;
while(tris--){
if(first){
if(ds_list_find_value_fixed(lines,sv)&VERT_IS_GL){
	var glvert=ds_list_find_value_fixed(glverts,ds_list_find_value_fixed(lines,sv)&~VERT_IS_GL);
	ds_list_add(verts,ds_map_find_value_fixed(glvert,"x")*MAP_SCALE);
	ds_list_add(verts,data_floor);
	ds_list_add(verts,ds_map_find_value_fixed(glvert,"y")*MAP_SCALE);
}else{
	var vert=ds_list_find_value_fixed(vertexes,ds_list_find_value_fixed(lines,sv));
	ds_list_add(verts,ds_map_find_value_fixed(vert,"x")*MAP_SCALE);
	ds_list_add(verts,data_floor);
	ds_list_add(verts,ds_map_find_value_fixed(vert,"y")*MAP_SCALE);
}
if(ds_list_find_value_fixed(lines,ev)&VERT_IS_GL){
	//data_flats.verts.push(map.glverts[lines[ev]&~VERT_IS_GL].x*MAP_SCALE,
	//data_floor,map.glverts[lines[ev]&~VERT_IS_GL].y*MAP_SCALE);
	var glvert=ds_list_find_value_fixed(glverts,ds_list_find_value_fixed(lines,ev)&~VERT_IS_GL);
	ds_list_add(verts,ds_map_find_value_fixed(glvert,"x")*MAP_SCALE);
	ds_list_add(verts,data_floor);
	ds_list_add(verts,ds_map_find_value_fixed(glvert,"y")*MAP_SCALE);
}else{
	var vert=ds_list_find_value_fixed(vertexes,ds_list_find_value_fixed(lines,ev));
	ds_list_add(verts,ds_map_find_value_fixed(vert,"x")*MAP_SCALE);
	ds_list_add(verts,data_floor);
	ds_list_add(verts,ds_map_find_value_fixed(vert,"y")*MAP_SCALE);
}

if(ds_list_find_value_fixed(lines,nv)&VERT_IS_GL){
	var glvert=ds_list_find_value_fixed(glverts,ds_list_find_value_fixed(lines,nv)&~VERT_IS_GL);
	ds_list_add(verts,ds_map_find_value_fixed(glvert,"x")*MAP_SCALE);
	ds_list_add(verts,data_floor);
	ds_list_add(verts,ds_map_find_value_fixed(glvert,"y")*MAP_SCALE);
}else{
	var vert=ds_list_find_value_fixed(vertexes,ds_list_find_value_fixed(lines,nv));
	ds_list_add(verts,ds_map_find_value_fixed(vert,"x")*MAP_SCALE);
	ds_list_add(verts,data_floor);
	ds_list_add(verts,ds_map_find_value_fixed(vert,"y")*MAP_SCALE);
}
var indices=ds_map_find_value_fixed(data_flats,"indices");

var dat_flats_i=ds_map_find_value_fixed(data_flats,"i");
ds_map_replace(data_flats,"i",dat_flats_i+1);
dat_flats_i=ds_map_find_value_fixed(data_flats,"i");
ds_list_add(indices,dat_flats_i);

dat_flats_i=ds_map_find_value_fixed(data_flats,"i");
ds_map_replace(data_flats,"i",dat_flats_i+1);
dat_flats_i=ds_map_find_value_fixed(data_flats,"i");
ds_list_add(indices,dat_flats_i);

dat_flats_i=ds_map_find_value_fixed(data_flats,"i");
ds_map_replace(data_flats,"i",dat_flats_i+1);
dat_flats_i=ds_map_find_value_fixed(data_flats,"i");
ds_list_add(indices,dat_flats_i);

var uv;
uv[0]=ds_map_build();
ds_map_add(uv[0],"t",ds_map_find_value_fixed(data,"tex_f"));
ds_map_add(uv[0],"v",0);
ds_map_add(uv[0],"u",1);

uv[1]=ds_map_build();
ds_map_add(uv[1],"t",ds_map_find_value_fixed(data,"tex_f"));
ds_map_add(uv[1],"v",0);
ds_map_add(uv[1],"u",3);

uv[2]=ds_map_build();
ds_map_add(uv[2],"t",ds_map_find_value_fixed(data,"tex_f"));
ds_map_add(uv[2],"v",2);
ds_map_add(uv[2],"u",1);

var dat_flat_uv=ds_map_find_value_fixed(data_flats,"uv");
ds_list_add(dat_flat_uv,uv[0]);
ds_list_add(dat_flat_uv,uv[1]);
ds_list_add(dat_flat_uv,uv[2]);

var dat_light=ds_map_find_value_fixed(data,"light");
var brightness=ds_map_find_value_fixed(data_flats,"brightness");
repeat 3 ds_list_add(brightness,dat_light);
//data.flats.brightness.push(data.light,data.light,data.light);

var dat_stype=ds_map_find_value_fixed(data,"stype");
var type=ds_map_find_value_fixed(data_flats,"type");
repeat 3 ds_list_add(type,dat_stype);
//data.flats.type.push(data.stype,data.stype,data.stype);

var cf=ds_map_find_value_fixed(data_flats,"cf");
repeat 9 ds_list_add(cf,"f");
//data.flats.cf.push('f','f','f','f','f','f','f','f','f');

var dat_fsector=ds_map_find_value_fixed(data,"fsector");
var sec=ds_map_find_value_fixed(data_flats,"sector");
repeat 3 ds_list_add(sec,dat_fsector);
//data.flats.sector.push(data.fsector,data.fsector,data.fsector);
first=false;
continue;

}/* else {

if(itr){
sv=nv;
nv++;
if(lines[sv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[sv]&~VERT_IS_GL].x*MAP_SCALE,
data.floor,map.glverts[lines[sv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[sv]].x*MAP_SCALE,
data.floor,map.vertexes[lines[sv]].y*MAP_SCALE);

if(lines[ev]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[ev]&~VERT_IS_GL].x*MAP_SCALE,
data.floor,map.glverts[lines[ev]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[ev]].x*MAP_SCALE,
data.floor,map.vertexes[lines[ev]].y*MAP_SCALE);

if(lines[nv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[nv]&~VERT_IS_GL].x*MAP_SCALE,
data.floor,map.glverts[lines[nv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[nv]].x*MAP_SCALE,
data.floor,map.vertexes[lines[nv]].y*MAP_SCALE);

data.flats.indices.push(data.flats.i++,data.flats.i++,data.flats.i++);
data.flats.uv.push(
{t:data.tex_f,v:0,u:1},
{t:data.tex_f,v:0,u:3},
{t:data.tex_f,v:2,u:1}
);
data.flats.brightness.push(data.light,data.light,data.light);
data.flats.type.push(data.stype,data.stype,data.stype);
data.flats.cf.push('f','f','f','f','f','f','f','f','f');
data.flats.sector.push(data.fsector,data.fsector,data.fsector);
} else {
sv=ev;
ev--;

if(lines[sv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[sv]&~VERT_IS_GL].x*MAP_SCALE,
data.floor,map.glverts[lines[sv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[sv]].x*MAP_SCALE,
data.floor,map.vertexes[lines[sv]].y*MAP_SCALE);

if(lines[ev]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[ev]&~VERT_IS_GL].x*MAP_SCALE,
data.floor,map.glverts[lines[ev]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[ev]].x*MAP_SCALE,
data.floor,map.vertexes[lines[ev]].y*MAP_SCALE);

if(lines[nv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[nv]&~VERT_IS_GL].x*MAP_SCALE,
data.floor,map.glverts[lines[nv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[nv]].x*MAP_SCALE,
data.floor,map.vertexes[lines[nv]].y*MAP_SCALE);

data.flats.indices.push(data.flats.i++,data.flats.i++,data.flats.i++);
data.flats.uv.push(
{t:data.tex_f,v:0,u:3},
{t:data.tex_f,v:2,u:3},
{t:data.tex_f,v:2,u:1}
);
data.flats.brightness.push(data.light,data.light,data.light);
data.flats.type.push(data.stype,data.stype,data.stype);
data.flats.cf.push('f','f','f','f','f','f','f','f','f');
data.flats.sector.push(data.fsector,data.fsector,data.fsector);
}

}
itr=!itr;
}

// Ceiling
if(data.tex_c.indexOf('SKY')!=-1)
return;
sv=0;
nv=1;
itr=true;
ev=lines.length-1;
tris=lines.length-2;
first=true;
while(tris--){
if(first){
if(lines[sv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[sv]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[sv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[sv]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[sv]].y*MAP_SCALE);

if(lines[nv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[nv]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[nv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[nv]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[nv]].y*MAP_SCALE);

if(lines[ev]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[ev]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[ev]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[ev]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[ev]].y*MAP_SCALE);

data.flats.indices.push(data.flats.i++,data.flats.i++,data.flats.i++);
data.flats.uv.push(
{t:data.tex_c,v:0,u:1},
{t:data.tex_c,v:0,u:3},
{t:data.tex_c,v:2,u:1}
);
data.flats.brightness.push(data.light,data.light,data.light);
data.flats.type.push(data.stype,data.stype,data.stype);
data.flats.cf.push('c','c','c','c','c','c','c','c','c');
data.flats.sector.push(data.fsector,data.fsector,data.fsector);
first=false;
continue;

} else {

if(itr){
sv=nv;
nv++;
if(lines[sv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[sv]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[sv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[sv]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[sv]].y*MAP_SCALE);

if(lines[nv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[nv]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[nv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[nv]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[nv]].y*MAP_SCALE);

if(lines[ev]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[ev]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[ev]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[ev]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[ev]].y*MAP_SCALE);

data.flats.indices.push(data.flats.i++,data.flats.i++,data.flats.i++);
data.flats.uv.push(
{t:data.tex_c,v:0,u:1},
{t:data.tex_c,v:0,u:3},
{t:data.tex_c,v:2,u:1}
);
data.flats.brightness.push(data.light,data.light,data.light);
data.flats.type.push(data.stype,data.stype,data.stype);
data.flats.cf.push('c','c','c','c','c','c','c','c','c');
data.flats.sector.push(data.fsector,data.fsector,data.fsector);

} else {
sv=ev;
ev--;
if(lines[sv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[sv]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[sv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[sv]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[sv]].y*MAP_SCALE);

if(lines[nv]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[nv]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[nv]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[nv]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[nv]].y*MAP_SCALE);

if(lines[ev]&VERT_IS_GL)
data.flats.verts.push(map.glverts[lines[ev]&~VERT_IS_GL].x*MAP_SCALE,
data.ceiling,map.glverts[lines[ev]&~VERT_IS_GL].y*MAP_SCALE);
else
data.flats.verts.push(map.vertexes[lines[ev]].x*MAP_SCALE,
data.ceiling,map.vertexes[lines[ev]].y*MAP_SCALE);

data.flats.indices.push(data.flats.i++,data.flats.i++,data.flats.i++);
data.flats.uv.push(
{t:data.tex_c,v:0,u:3},
{t:data.tex_c,v:2,u:3},
{t:data.tex_c,v:2,u:1}
);
data.flats.brightness.push(data.light,data.light,data.light);
data.flats.type.push(data.stype,data.stype,data.stype);
data.flats.cf.push('c','c','c','c','c','c','c','c','c');
data.flats.sector.push(data.fsector,data.fsector,data.fsector);
}
}

itr=!itr;
}

if(!data.flattextures[data.tex_f])
data.flattextures[data.tex_f]={count:0};
data.flattextures[data.tex_f].count++;

if(!data.flattextures[data.tex_c])
data.flattextures[data.tex_c]={count:0};
data.flattextures[data.tex_c].count++;

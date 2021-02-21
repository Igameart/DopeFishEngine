function DE_addWall() {
	//DE_addWall=function(data,map,front,back,start,end_,flags){
	/*
	var sides=ds_map_find_value_fixed(wad_levels,"sidedefs");
	var verts=ds_map_find_value_fixed(wad_levels,"vertexes");
	var glverts=ds_map_find_value_fixed(wad_levels,"glverts");
	var sects=ds_map_find_value_fixed(wad_levels,"sectors");

	data=argument0;
	map=argument1;
	front=ds_list_find_value_fixed(sides,argument2);
	back=ds_list_find_value_fixed(sides,argument3);
	start=argument4;
	end_=argument5;
	flags=argument6;

	fronty=ds_map_find_value_fixed(front,"y");

	var tc=0;
	var frontsec=ds_map_find_value_fixed(front,"sector");
	var skybox=false;
	/* ADD VALUES TO THE DATA CHUNK FOR USE IN OTHER SCRIPTS
	data.fsector=front.sector;
	data.floor=frontsec.floor*MAP_SCALE;
	data.tex_f=frontsec.tex_f;
	data.ceiling=frontsec.ceiling*MAP_SCALE;
	data.tex_c=frontsec.tex_c;
	data.light=frontsec.lightlevel/255;
	data.stype=getLightType(frontsec.type);
	* /

	if(back){
	var backsec=ds_map_find_value_fixed(back,"sector")
	//if(frontsec.tex_c.indexOf('SKY')!=-1&&backsec.tex_c.indexOf('SKY')!=-1)
	//skybox=true;
	}
	/*
	if(ds_map_find_value_fixed(front,"tex_l")!=='-'){
	if(!data.textures[front.tex_l])
	data.textures[front.tex_l]=0;
	data.textures[front.tex_l]++;
	tc++;
	}
	if(front.tex_m!=='-'){
	if(!data.textures[front.tex_m])
	data.textures[front.tex_m]=0;
	data.textures[front.tex_m]++;
	tc++;
	}
	if(front.tex_u!=='-'){
	if(!data.textures[front.tex_u])
	data.textures[front.tex_u]=0;
	data.textures[front.tex_u]++;
	tc++;
	}

	// No Texture, don't bother building
	if(tc==0)
	return;
	*/

	// Build Verts
	/*
	var sv=ds_map_create();
	ds_map_add(sv,"x",0);
	ds_map_add(sv,"y",0);

	var ev=ds_map_create();
	ds_map_add(ev,"x",0);
	ds_map_add(ev,"y",0);

	var xx,yy,vrt;
	if(start&VERT_IS_GL){ //svx=map.glverts[start&~VERT_IS_GL].x*MAP_SCALE

	vrt=ds_list_find_value_fixed(glverts,start&~VERT_IS_GL);
	xx=ds_map_find_value_fixed(vrt,"x")*MAP_SCALE;
	ds_list_replace(sv,"x",xx);
	xx=ds_map_find_value_fixed(vrt,"y")*MAP_SCALE;
	ds_list_replace(sv,"y",xx);

	}else{//svx=map.vertexes[start].x*MAP_SCALE;
	vrt=ds_list_find_value_fixed(verts,start);
	xx=ds_map_find_value_fixed(vrt,"x")*MAP_SCALE;
	ds_list_replace(sv,"x",xx);
	xx=ds_map_find_value_fixed(vrt,"y")*MAP_SCALE;
	ds_list_replace(sv,"y",xx);
	}

	if(end_&VERT_IS_GL){ //svx=map.glverts[start&~VERT_IS_GL].x*MAP_SCALE

	vrt=ds_list_find_value_fixed(glverts,end_&~VERT_IS_GL);
	xx=ds_map_find_value_fixed(vrt,"x")*MAP_SCALE;
	ds_list_replace(ev,"x",xx);
	svx=xx;
	xx=ds_map_find_value_fixed(vrt,"y")*MAP_SCALE;
	ds_list_replace(ev,"y",xx);
	svy=xx

	}else{//svx=map.vertexes[start].x*MAP_SCALE;
	vrt=ds_list_find_value_fixed(verts,end_);
	xx=ds_map_find_value_fixed(vrt,"x")*MAP_SCALE;
	ds_list_replace(ev,"x",xx);
	evx=xx;
	xx=ds_map_find_value_fixed(vrt,"y")*MAP_SCALE;
	ds_list_replace(ev,"y",xx);
	evy=xx;
	}

	//if(start&VERT_IS_GL) svy=map.glverts[start&~VERT_IS_GL].y*MAP_SCALE
	//else svy=map.vertexes[start].y*MAP_SCALE;
	//if(end_&VERT_IS_GL) evx=map.glverts[end_&~VERT_IS_GL].x*MAP_SCALE
	//else evx=map.vertexes[end_].x*MAP_SCALE;
	//if(end_&VERT_IS_GL) evy=map.glverts[end_&~VERT_IS_GL].y*MAP_SCALE
	//else evy=map.vertexes[end_].y*MAP_SCALE;

	var width=DE_wallLength(sv,ev);
	var height=0;
	var peg='';

	// 1 height chunk wall -----
	if(!ds_map_find_value_fixed(back,"tex_m")&&ds_map_find_value_fixed(front,"tex_m")!='-'){
	// Height
	var ceiling=ds_map_find_value_fixed(frontsec,"ceiling")*MAP_SCALE;
	var floor_=ds_map_find_value_fixed(frontsec,"floor")*MAP_SCALE;
	height=abs(ceiling-floor_);

	// Width
	var wchunks=1;
	var texwidth=64;//this.wad.textures[front.tex_m].width*MAP_SCALE;
	if(width>texwidth)
	wchunks=ceil(width/texwidth);
	var dir=(sqrt(svx*svx+svy*svy)<sqrt(evx*evx+evy*evy));
	var uvec=array_2((evx-svx)/width,(evy-svy)/width);
	if(!dir)
	uvec=array_2((svx-evx)/width,(svy-evy)/width);

	/*if(height>(this.wad.textures[front.tex_m].height-fronty)*MAP_SCALE){
	var bottom=ceiling-(this.wad.textures[front.tex_m].height-fronty)*MAP_SCALE;
	DE_buildFace(data,front,
	ceiling,bottom,ceiling,floor_,sv,ev,
	front.tex_m,fronty,flags,texwidth,
	dir,uvec,width,wchunks);

	} else {* /
	DE_buildFace(data,front,
	ceiling,floor_,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_m"),fronty,flags,texwidth,
	dir,uvec,width,wchunks);
	//}

	// Multi Textured Wall -----
	} else {
	var ceiling,floor_;

	var dir=(sqrt(svx*svx+svy*svy)<sqrt(evx*evx+evy*evy));
	var uvec; uvec[0]=(evx-svx)/width;
	uvex[1]=(evy-svy)/width;
	if(!dir){
	uvec[0]=(svx-evx)/width;
	uvec[1]=(svy-evy)/width;
	}

	// Lower
	if(ds_map_find_value_fixed(front,"tex_l")!='-'){
	// Height
	//ceiling=frontsec.ceiling*MAP_SCALE;
	//floor_=frontsec.floor_*MAP_SCALE;

	ceiling=ds_map_find_value_fixed(frontsec,"ceiling")*MAP_SCALE;
	floor_=ds_map_find_value_fixed(frontsec,"floor")*MAP_SCALE;

	if(back)
	//ceiling=backsec.floor_*MAP_SCALE;
	ceiling=ds_map_find_value_fixed(backsec,"floor")*MAP_SCALE;
	height=abs(ceiling-floor_);

	// Width
	var wchunks=1;
	var texwidth=32;//this.wad.textures[front.tex_l].width*MAP_SCALE;
	if(width>texwidth)
	wchunks=ceil(width/texwidth);

	var ftex = ds_map_find_value_fixed(textures,ds_map_find_value_fixed(front,"tex_l"));

	if(back&&ds_map_find_value_fixed(flags,"peg_lower")&&height<(ds_map_find_value_fixed(ftex,"height"))*MAP_SCALE){
	var tyoff=0;//(height+floor)+fronty;
	DE_buildFace(data,front,
	ceiling,floor_,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_l"),tyoff,flags,texwidth,
	dir,uvec,width,wchunks);
	}else if(height>(ds_map_find_value_fixed(ftex,"height")-fronty)*MAP_SCALE){
	var bottom=ceiling-(ds_map_find_value_fixed(ftex,"height")*MAP_SCALE);
	DE_buildFace(data,front,
	ceiling,bottom,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_l"),0,flags,texwidth,
	dir,uvec,width,wchunks);
	}else{
	DE_buildFace(data,front,
	ceiling,floor_,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_l"),fronty,flags,texwidth,
	dir,uvec,width,wchunks);
	}
	}

	// Middle
	if(ds_map_find_value_fixed(front,"tex_m")!='-'){
	// Height
	ceiling=ds_map_find_value_fixed(frontsec,"ceiling")*MAP_SCALE;
	floor_=ds_map_find_value_fixed(frontsec,"floor")*MAP_SCALE;
	if(back){
	ceiling=ds_map_find_value_fixed(backsec,"ceiling")*MAP_SCALE;
	floor_=ds_map_find_value_fixed(backsec,"floor")*MAP_SCALE;
	}
	height=abs(ceiling-floor_);

	// Width
	var wchunks=1;
	var texwidth=32;//this.wad.textures[front.tex_m].width*MAP_SCALE;
	if(width>texwidth)
	wchunks=ceil(width/texwidth);

	DE_buildFace(data,front,
	ceiling,floor_,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_m"),fronty,flags,texwidth,
	dir,uvec,width,wchunks);
	}

	// Upper
	if(ds_map_find_value_fixed(front,"tex_u")!='-'){
	if(skybox)
	return // Don't draw sky tagged faces

	// Height
	ceiling=ds_map_find_value_fixed(frontsec,"ceiling")*MAP_SCALE;
	floor_=ds_map_find_value_fixed(frontsec,"floor")*MAP_SCALE;
	if(back)
	floor_=ds_map_find_value_fixed(backsec,"ceiling")*MAP_SCALE;
	height=abs(ceiling-floor_);

	// Width
	var wchunks=1;
	var texwidth=32;//this.wad.textures[front.tex_u].width*MAP_SCALE;
	if(width>texwidth)
	wchunks=ceil(width/texwidth);
	var dir=(sqrt(svx*svx+svy*svy)<sqrt(evx*evx+evy*evy));
	var uvec; uvec[0]=(evx-svx)/width;
	uvec[1]=(evy-svy)/width;
	if(!dir){
	uvec[0]=(svx-evx)/width
	uvec[1]=(svy-evy)/width;
	}

	var utex = ds_map_find_value_fixed(textures,ds_map_find_value_fixed(front,"tex_u"));

	if(back&&!ds_map_find_value_fixed(flags,"peg_upper")&&
	height>(ds_map_find_value_fixed(utex,"height")-fronty)*MAP_SCALE){
	var bottom=ceiling-(ds_map_find_value_fixed(utex,"height"))*MAP_SCALE;
	DE_buildFace(data,front,
	ceiling,bottom,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_u"),0,flags,texwidth,
	dir,uvec,width,wchunks);
	}else if(height>(ds_map_find_value_fixed(utex,"height")-fronty)*MAP_SCALE){

	var bottom=ceiling-(ds_map_find_value_fixed(utex,"height")-fronty)*MAP_SCALE;
	DE_buildFace(data,front,
	ceiling,bottom,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_u"),fronty,flags,texwidth,
	dir,uvec,width,wchunks);
	}else{
	// Typically 'upper' door faces will be lower pegged
	if(!ds_map_find_value_fixed(flags,"peg_upper"))
	ds_map_replace(flags,"peg_lower",'lower');

	DE_buildFace(data,front,
	ceiling,floor_,ceiling,floor_,sv,ev,
	ds_map_find_value_fixed(front,"tex_u"),fronty,flags,texwidth,
	dir,uvec,width,wchunks);
	}
	}
	}


/* end DE_addWall */
}

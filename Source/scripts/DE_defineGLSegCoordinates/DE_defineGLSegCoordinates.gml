//==========================================================================
//
// 
//
//==========================================================================

/*function DE_defineGLSegCoordinates( seg, tci, texturetop,
								topleft,topright, bottomleft,bottomright, t_ofs){
	//
	//
	// set up texture coordinate stuff
	//
	// 
	
	var l_ul;
	var texlength;

	var length = seg.sidedef? seg.sidedef.TexelLength: point_distance(seg.x1, seg.y1, seg.x2, seg.y2);

	l_ul=tci.FloatToTexU( FIXED2FLOAT( tci.TextureOffset( t_ofs ) ) );
	texlength = tci.FloatToTexU( length );


	//
	//
	// set up coordinates for the left side of the polygon
	//
	// check left side for intersections
	if (topleft>=bottomleft)
	{
		// normal case
		ztop[0]=FIXED2FLOAT(topleft);
		zbottom[0]=FIXED2FLOAT(bottomleft);

		if (tci)
		{
			uplft.v=tci->FloatToTexV(-ztop[0] + texturetop);
			lolft.v=tci->FloatToTexV(-zbottom[0] + texturetop);
		}
	}
	else
	{
		// ceiling below floor - clip to the visible part of the wall
		fixed_t dch=topright-topleft;
		fixed_t dfh=bottomright-bottomleft;
		fixed_t coeff=FixedDiv(bottomleft-topleft, dch-dfh);

		fixed_t inter_y=topleft+FixedMul(coeff,dch);
											 
		float inter_x= FIXED2FLOAT(coeff);

		glseg.x1 = glseg.x1 + inter_x * (glseg.x2 - glseg.x1);
		glseg.y1 = glseg.y1 + inter_x * (glseg.y2 - glseg.y1);
		glseg.fracleft = inter_x;

		zbottom[0]=ztop[0]=FIXED2FLOAT(inter_y);	

		if (tci)
		{
			lolft.v=uplft.v=tci->FloatToTexV(-ztop[0] + texturetop);
		}
	}

	//
	//
	// set up coordinates for the right side of the polygon
	//
	// check left side for intersections
	if (topright >= bottomright)
	{
		// normal case
		ztop[1]=FIXED2FLOAT(topright)		;
		zbottom[1]=FIXED2FLOAT(bottomright)		;

		if (tci)
		{
			uprgt.v=tci->FloatToTexV(-ztop[1] + texturetop);
			lorgt.v=tci->FloatToTexV(-zbottom[1] + texturetop);
		}
	}
	else
	{
		// ceiling below floor - clip to the visible part of the wall
		fixed_t dch=topright-topleft;
		fixed_t dfh=bottomright-bottomleft;
		fixed_t coeff=FixedDiv(bottomleft-topleft, dch-dfh);

		fixed_t inter_y=topleft+FixedMul(coeff,dch);
											 
		float inter_x= FIXED2FLOAT(coeff);

		glseg.x2 = glseg.x1 + inter_x * (glseg.x2 - glseg.x1);
		glseg.y2 = glseg.y1 + inter_x * (glseg.y2 - glseg.y1);
		glseg.fracright = inter_x;

		zbottom[1]=ztop[1]=FIXED2FLOAT(inter_y);
		if (tci)
		{
			lorgt.v=uprgt.v=tci->FloatToTexV(-ztop[1] + texturetop);
		}
	}

	uplft.u = lolft.u = l_ul + texlength * glseg.fracleft;
	uprgt.u = lorgt.u = l_ul + texlength * glseg.fracright;


	if (gltexture && gltexture->tex->bHasCanvas && flags&GLT_CLAMPY)
	{
		// Camera textures are upside down so we have to shift the y-coordinate
		// from [-1..0] to [0..1] when using texture clamping

		uplft.v+=1.f;
		uprgt.v+=1.f;
		lolft.v+=1.f;
		lorgt.v+=1.f;
	}
	return true;
}
}*/
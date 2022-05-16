//
// Simple passthrough fragment shader
//
#extension GL_OES_standard_derivatives : require
precision highp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
//varying float v_eyeDist;
varying vec4 v_vPosition;
varying float v_isSky;

uniform vec4 u_fogColor;
uniform float u_fogMaxDist;
uniform float u_fogMinDist;

uniform float u_hightlight;

uniform vec4 u_sectFloorTex;
uniform vec4 u_sectCeilTex;
uniform vec2 u_sectAtlas;

uniform sampler2D u_skySampler;
uniform vec2 u_res;


//uniform sampler2D tex_C;
vec4 smoothTex2D( sampler2D tex, vec2 tUV){//, vec2 tRes ){
	
	vec2 UV = tUV * u_sectAtlas;
	
	vec2 alpha = .45 * vec2(abs(dFdx(UV.x)), abs(dFdy(UV.y)));//+0.06;

	vec2 x = fract(UV);
	vec2 x_ = clamp(.5 / alpha * x, 0., 0.5) +
				clamp(.5 / alpha * (x - 1.) + .5, 0., .5);
			
	vec2 texCoord = (floor(UV) + x_) / u_sectAtlas;

	return texture2D( tex, texCoord );
	
}

vec4 fourTapSample(vec2 tileOffset, //Tile offset in the atlas 
                  vec2 tileUV, //Tile coordinate (as above)
                  vec2 tileSize) //Size of a tile in atlas
				  {
	//Initialize accumulators
	vec4 color = vec4(0.0);
	float totalWeight = 0.0;

	for(int dx=-1; dx<1; ++dx){
		for(int dy=-1; dy<1; ++dy) {
			//Compute coordinate in 2x2 tile patch
			vec2 tileCoord = 2.0 * fract(0.5 * ((tileUV) + vec2(dx,dy)));

			//Weight sample based on distance to center
			float w = pow(1.0 - max(abs(tileCoord.x-1.0), abs(tileCoord.y-1.0)), 16.0);

			//Compute atlas coord
			vec2 atlasUV = tileOffset + tileCoord * tileSize;

			//Sample and accumulate
			color += w * texture2D(gm_BaseTexture, atlasUV);
			totalWeight += w;
	  }
  }

  //Return weighted color
  return color / totalWeight;
}

vec2 smoothUV( vec2 UV ){
	
	vec2 alpha = .5 * vec2(abs(dFdx(UV.x)), abs(dFdy(UV.y)))+0.01;

	vec2 x = fract(UV);
	vec2 x_ = clamp(.5 / alpha * x, 0., 0.5) +
				clamp(.5 / alpha * (x - 1.) + .5, 0., .5);
			
	vec2 texCoord = ( floor(UV) + x_ ) / (64.);

	return texCoord;
	
}

float computeLinearFogFactor()
{
	float factor;
   
	// Compute linear fog equation
	factor = (u_fogMaxDist - (v_vPosition.z)) /
	        (u_fogMaxDist - u_fogMinDist );
   
	// Clamp in the [0,1] range
	factor = clamp( factor, 0.0, 1.0 );
	factor = floor(factor*16.0+0.5)/16.0;
	return factor;            
}

float computeLightCorrection()
{
	float factor;
   
	// Compute linear fog equation
   factor = (u_fogMaxDist/16.0 - (v_vPosition.z)) /
            (u_fogMaxDist/16.0);
   
	// Clamp in the [0,1] range
	factor = clamp( factor, 0.0, 1.0 );
	factor = floor(factor*8.0+0.5)/8.0;
	return factor * 0.5;            
}

void main()
{
    float fogger = computeLinearFogFactor();
	float lighten = computeLightCorrection();
    vec4 vcol = v_vColour + lighten;
    vec4 col;
	
	//float aspect = u_sectAtlas.y / u_sectAtlas.x;
	
	vec2 uv = fract(smoothUV(v_vTexcoord));
	//uv.y /= aspect;
    
	//If Floor
    if (v_vTIndex == 0.0){
		
		
		uv = (u_sectFloorTex.xy/u_sectAtlas) + (u_sectFloorTex.zw/u_sectAtlas) * fract(uv);
		
		col = texture2D( gm_BaseTexture, uv, 0.0 );
		//col = fourTapSample( u_sectFloorTex.xy, v_vTexcoord, u_sectFloorTex.zw );
		
	}else{//If Ceiling
		
		//uv = u_sectCeilTex.xy + (( uv )) * u_sectCeilTex.zw / vec2(64.0);
		uv = (u_sectCeilTex.xy/u_sectAtlas) + (u_sectCeilTex.zw/u_sectAtlas) * fract(uv);
		
        col = texture2D( gm_BaseTexture, uv, -3.0 );
		//col = fourTapSample(u_sectCeilTex.xy, ( uv ), u_sectCeilTex.zw);
	}
        
    fogger = floor(fogger*16.0+0.5)/16.0;
    
    gl_FragColor=(col * vcol * ( 1.0 + u_hightlight ) ) * fogger + u_fogColor * (1.0 - fogger);
    gl_FragColor.a = col.a * vcol.a;
	
	if (v_isSky > 0.5){
		vec2 uv = gl_FragCoord.xy / u_res;
		gl_FragColor = texture2D( u_skySampler, uv );
	}
}


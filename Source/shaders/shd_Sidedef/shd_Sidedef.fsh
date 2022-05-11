//
// Simple passthrough fragment shader
//
#extension GL_OES_standard_derivatives : require
precision highp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
varying float v_vMiddle;
//varying float v_eyeDist;
varying vec4 v_vPosition;

uniform vec4 tex_L;
uniform vec4 tex_M;
uniform vec4 tex_U;

uniform vec2 u_Luv;
uniform vec2 u_Uuv;
uniform vec2 u_Muv;

uniform vec4 u_fogColor;
uniform float u_fogMaxDist;
uniform float u_fogMinDist;

uniform vec2 u_sectAtlas;

//varying vec2 vResL;
//varying vec2 vResM;
//varying vec2 vResU;

vec4 smoothTex2D( sampler2D tex, vec2 tUV, vec2 tRes ){
	
	vec2 UV = tUV * tRes;
	
	vec2 alpha = .45 * vec2(abs(dFdx(UV.x)), abs(dFdy(UV.y)));//+0.06;

	vec2 x = fract(UV);
	vec2 x_ = clamp(.5 / alpha * x, 0., 0.5) +
				clamp(.5 / alpha * (x - 1.) + .5, 0., .5);
			
	vec2 texCoord = (floor(UV) + x_) / tRes;

	return texture2D( tex, texCoord );
	
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

    vec4 col;
    
    if (v_vMiddle==0.0){
        if (v_vTIndex==0.0){
			vec2 UV = (v_vTexcoord);
			
			/*if (UV != vec2(1.0,1.0)){
				UV =  floor(UV);
				vec2 rmn = v_vTexcoord - UV;
				//rmn *= u_Luv;
				UV += rmn;
			}*/
		
		
			UV = (tex_L.xy/u_sectAtlas) + (tex_L.zw/u_sectAtlas) * fract(UV);
			col = smoothTex2D( gm_BaseTexture, UV, u_sectAtlas );
			col.a = texture2D( gm_BaseTexture, UV).a;// , u_sectAtlas );
		}
        else{
			vec2 UV = (v_vTexcoord);
			/*if (UV != vec2(1.0,1.0)){
				UV =  floor(UV);
				vec2 rmn = v_vTexcoord - UV;
				//rmn *= u_Uuv;
				UV += rmn;
			}*/
		
			UV = (tex_U.xy/u_sectAtlas) + (tex_U.zw/u_sectAtlas) * fract(UV);
			col = smoothTex2D( gm_BaseTexture, UV, u_sectAtlas );
			col.a = texture2D( gm_BaseTexture, UV).a;// , u_sectAtlas );
		}
    }else{
		vec2 UV = (v_vTexcoord);
		/*if (UV != vec2(1.0,1.0)){
			UV =  floor(UV);
			vec2 rmn = v_vTexcoord - UV;
			//rmn *= u_Muv;
			UV += rmn;
		}*/
		
		UV = (tex_M.xy/u_sectAtlas) + (tex_M.zw/u_sectAtlas) * fract(UV);
		
		col = smoothTex2D( gm_BaseTexture, UV , u_sectAtlas );
		col.a = texture2D( gm_BaseTexture, UV).a;// , u_sectAtlas );
		
	}

	col.a = floor(col.a+0.5);

	if (col.a < 0.5) discard;
	
	/*#extension GL_EXT_frag_depth : require
	#ifdef GL_EXT_frag_depth
		float vDepth = length(v_vPosition.xyz)-0.0;
		float dDiff = u_fogMaxDist - 0.2;
		gl_FragDepthEXT = 0.2/dDiff + vDepth/(dDiff);
	#endif*/
	
    float fogger = computeLinearFogFactor();
	float lighten = computeLightCorrection();
    vec4 vcol = v_vColour + lighten;
	//vcol.rgb = min(vcol.rgb,vec3(1.0));
    
    gl_FragColor=( col * vcol ) * fogger + u_fogColor * (1.0 - fogger);
    //gl_FragColor.a = texture2D( gm_BaseTexture, UV).a; 
    
}


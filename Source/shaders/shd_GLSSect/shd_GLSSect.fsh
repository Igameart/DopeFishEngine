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

uniform vec4 u_fogColor;
uniform float u_fogMaxDist;
uniform float u_fogMinDist;

uniform float u_hightlight;

uniform sampler2D tex_C;

vec4 smoothTex2D( sampler2D tex, vec2 UV ){
	
	vec2 alpha = .5 * vec2(abs(dFdx(UV.x)), abs(dFdy(UV.y)));//+0.06;

	vec2 x = fract(UV);
	vec2 x_ = clamp(.5 / alpha * x, 0., 0.5) +
				clamp(.5 / alpha * (x - 1.) + .5, 0., .5);
			
	vec2 texCoord = (floor(UV) + x_) / vec2(64.,64.);

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
    float fogger = computeLinearFogFactor();
	float lighten = computeLightCorrection();
    vec4 vcol = v_vColour + lighten;
	//vcol.rgb = min(vcol.rgb,vec3(1.0));
    //vcol.a=1.0;
    vec4 col;
	
	
	/*#extension GL_EXT_frag_depth : require
	#ifdef GL_EXT_frag_depth
		float vDepth = length(v_vPosition.xyz)+12.0*0.0;
		float dDiff = u_fogMaxDist - 0.2;
		gl_FragDepthEXT = 0.2/dDiff + vDepth/(dDiff);
	#endif*/
    
	//If Floor
    if (v_vTIndex == 0.0){
        col = smoothTex2D( gm_BaseTexture, v_vTexcoord );
	}else{//Is Ceiling
        col = smoothTex2D( tex_C, v_vTexcoord );
	}
        
    fogger = floor(fogger*16.0+0.5)/16.0;
    
    gl_FragColor=(col * vcol * ( 1.0 + u_hightlight ) ) * fogger + u_fogColor * (1.0 - fogger);
    gl_FragColor.a = col.a * vcol.a;
}

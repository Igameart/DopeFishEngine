//
// Simple passthrough fragment shader
//
#extension GL_OES_standard_derivatives : require
precision highp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
varying float v_vMiddle;
varying vec4 v_eyePosition;
varying vec4 v_vPosition;

uniform vec4 u_fogColor;
uniform float u_fogMaxDist;
uniform float u_fogMinDist;

uniform vec3 u_spriteColorize;

varying vec2 vUv;
varying vec2 vRes;

vec4 smoothTex2D( sampler2D tex, vec2 UV ){
	
	vec2 alpha = .45 * vec2(abs(dFdx(UV.x)), abs(dFdy(UV.y)));//+0.06;

	vec2 x = fract(UV);
	vec2 x_ = clamp(.5 / alpha * x, 0., 0.5) +
				clamp(.5 / alpha * (x - 1.) + .5, 0., .5);
			
	vec2 texCoord = (floor(UV) + x_) / vRes;

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
	
	vec4 col = smoothTex2D( gm_BaseTexture, vUv );//texture2D( gm_BaseTexture, v_vTexcoord );
	
	//col.a += 0.33;
	//col.a = floor( col.a );
	
	if (col.a < 0.1 ) discard;

    float fogger = computeLinearFogFactor();
	float lighten = computeLightCorrection();
    vec4 vcol = v_vColour + lighten;
	//vcol.rgb = min(vcol.rgb,vec3(1.0));
	
    gl_FragColor=( col * vcol * v_vColour ) * fogger + u_fogColor * (1.0 - fogger);
    gl_FragColor.a = col.a;
    
}


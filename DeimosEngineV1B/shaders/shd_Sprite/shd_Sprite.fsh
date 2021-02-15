//
// Simple passthrough fragment shader
//
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

float computeLinearFogFactor()
{
   float factor;
   
   // Compute linear fog equation
   factor = (u_fogMaxDist - length(v_vPosition.xyz)) /
            (u_fogMaxDist - u_fogMinDist );
   
   // Clamp in the [0,1] range
   factor = clamp( factor, 0.0, 1.0 );
            
   return factor;            
}

void main()
{
	
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (col.a <= 0.1) discard;

    float fogger = computeLinearFogFactor();
    
	vec4 vcol = vec4(u_spriteColorize,0.0) * 1.01;
	
    fogger = floor(fogger*16.0+0.5)/16.0; 
	
    gl_FragColor=( col * vcol * v_vColour ) * fogger + u_fogColor * (1.0 - fogger);
    gl_FragColor.a = col.a;
    
}


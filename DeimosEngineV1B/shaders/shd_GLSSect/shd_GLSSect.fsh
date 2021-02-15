//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
//varying float v_eyeDist;
varying vec4 v_vPosition;

uniform vec4 u_fogColor;
uniform float u_fogMaxDist;
uniform float u_fogMinDist;

uniform sampler2D tex_C;

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
    float fogger = computeLinearFogFactor();
    vec4 vcol = v_vColour * 1.01;
    //vcol.a=1.0;
    vec4 col;
	
	
	/*#extension GL_EXT_frag_depth : require
	#ifdef GL_EXT_frag_depth
		float vDepth = length(v_vPosition.xyz)+12.0*0.0;
		float dDiff = u_fogMaxDist - 0.2;
		gl_FragDepthEXT = 0.2/dDiff + vDepth/(dDiff);
	#endif*/
    
    if (v_vTIndex==0.0)
        col = texture2D( gm_BaseTexture, v_vTexcoord );
    else
        col = texture2D( tex_C, v_vTexcoord );
        
    fogger = floor(fogger*16.0+0.5)/16.0; 
    
    gl_FragColor=(col * vcol ) * fogger + u_fogColor * (1.0 - fogger);
    gl_FragColor.a = col.a * vcol.a;
}


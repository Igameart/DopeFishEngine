//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
varying float v_vMiddle;
//varying float v_eyeDist;
varying vec4 v_vPosition;

uniform sampler2D tex_L;
uniform sampler2D tex_U;
uniform vec4 u_fogColor;
uniform float u_fogMaxDist;
uniform float u_fogMinDist;

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
    vec4 vcol = v_vColour;
    vec4 col;
    
    //gl_FragColor = vec4(0.0,0.0,0.0,1.0);
    
    
    if (v_vMiddle==0.0)
    {
        if (v_vTIndex==0.0) col = texture2D( tex_L, v_vTexcoord );
        else col = texture2D( tex_U, v_vTexcoord );
    }else
     col = texture2D( gm_BaseTexture, v_vTexcoord );

    fogger = floor(fogger*16.0+0.5)/16.0; 
    
    gl_FragColor=( col * vcol ) * fogger + u_fogColor * (1.0 - fogger);
    gl_FragColor.a = col.a;// * ( ( fogFactor -0.1 ) * 13.0 );  
    
}


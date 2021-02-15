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

uniform vec2 u_Luv;
uniform vec2 u_Uuv;
uniform vec2 u_Muv;

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

    vec4 col;
    
    if (v_vMiddle==0.0){
        if (v_vTIndex==0.0){
			vec2 UV = (v_vTexcoord);
			if (UV != vec2(1.0,1.0)){
				UV =  floor(UV);
				vec2 rmn = v_vTexcoord - UV;
				rmn *= u_Luv;
				UV += rmn;
			}
			col = texture2D( tex_L, UV );
		}
        else{
			vec2 UV = (v_vTexcoord);
			if (UV != vec2(1.0,1.0)){
				UV =  floor(UV);
				vec2 rmn = v_vTexcoord - UV;
				rmn *= u_Uuv;
				UV += rmn;
			}
			col = texture2D( tex_U, UV );
		}
    }else{
		vec2 UV = (v_vTexcoord);
		if (UV != vec2(1.0,1.0)){
			UV =  floor(UV);
			vec2 rmn = v_vTexcoord - UV;
			rmn *= u_Muv;
			UV += rmn;
		}
		col = texture2D( gm_BaseTexture, UV );
		
	}

	if (col.a < 0.1) discard;
	
	/*#extension GL_EXT_frag_depth : require
	#ifdef GL_EXT_frag_depth
		float vDepth = length(v_vPosition.xyz)-0.0;
		float dDiff = u_fogMaxDist - 0.2;
		gl_FragDepthEXT = 0.2/dDiff + vDepth/(dDiff);
	#endif*/
	
    float fogger = computeLinearFogFactor();
    vec4 vcol = v_vColour * 1.01;
    fogger = floor(fogger*16.0+0.5)/16.0; 
    
    gl_FragColor=( col * vcol ) * fogger + u_fogColor * (1.0 - fogger);
    gl_FragColor.a = col.a * vcol.a; 
    
}


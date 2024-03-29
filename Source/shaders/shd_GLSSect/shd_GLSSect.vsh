//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_TextureCoord2;                     // 
//attribute vec3 in_TextureCoord3;                     // 

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
varying vec4 v_vPosition;
varying float v_isSky;
varying float v_vDist;

uniform float u_sectBotOff;
uniform float u_sectTopOff;

void main()
{
    vec3 vPos = in_Position;
    
    if (in_TextureCoord2.x==0.0){
        vPos.z+=u_sectBotOff;
    }else{
        vPos.z+=u_sectTopOff;
    }
    
    vec4 object_space_pos = vec4( vPos.x, vPos.y, vPos.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * (object_space_pos);
    
    v_vPosition = (gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos);
	
	v_vDist = length(gl_Position.xy);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord * vec2(64.,64.);
    v_vTIndex = in_TextureCoord2.x;
	v_isSky = floor(in_TextureCoord2.y+.05);
}


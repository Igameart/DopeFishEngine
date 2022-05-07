//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_TextureCoord2;                     // 
attribute vec3 in_TextureCoord3;                     // 

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
varying float v_vMiddle;
varying vec4 v_vPosition;

uniform vec3 u_camVec;

uniform vec2 uRes;
varying vec2 vUv;
varying vec2 vRes;

void main()
{

	vec4 object_space_pos = vec4(in_Position.x, -in_Position.y, -in_Position.z, 1.0);
    mat4 V = gm_Matrices[MATRIX_WORLD_VIEW];
    
	V[0].xyz = vec3(1., 0., 0.);
	
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * V * (object_space_pos);
    
    v_vPosition = (gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos);
    v_vColour = in_Colour;
	
	vRes = uRes;
	
	vUv = in_TextureCoord * uRes;
    
    v_vTexcoord = in_TextureCoord;
    
    
}


//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec3 in_TextureCoord2;                     // 
attribute vec3 in_TextureCoord3;                     // 
//attribute vec3 in_TextureCoord3;                     // 

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_vTIndex;
varying float v_vMiddle;
//varying float v_eyeDist;
varying vec4 v_vPosition;

uniform vec2 u_lowOff;
//uniform float u_lowTopOff;

uniform vec2 u_upOff;
//uniform float u_upTopOff;

uniform vec2 u_midOff;
//uniform float u_midTopOff;

uniform float u_LowPeg;
uniform float u_UpPeg;

uniform float u_TexHL;
uniform float u_TexHU;
uniform float u_TexHM;

uniform float uRes[6];

varying vec2 vResL;
varying vec2 vResM;
varying vec2 vResU;

void main()
{

    vec3 vPos = in_Position;
    vec2 vtcoord = in_TextureCoord;
    v_vTIndex = in_TextureCoord2.x;
    v_vMiddle = in_TextureCoord2.y;
    float isTop = in_TextureCoord3.x;
	
	vResL = vec2(uRes[0],uRes[1]);
	
	vResM = vec2(uRes[2],uRes[3]);
	
	vResU = vec2(uRes[4],uRes[5]);
	
    if (v_vMiddle==0.0)
    {
        if (v_vTIndex==0.0){//Lower Wall
            if (isTop==0.0){//Is Bottom Vertex.
                vPos.z+=u_lowOff.x;
                if (u_LowPeg==0.0){
                    vtcoord.y += u_lowOff.y/u_TexHL;
                }
                vtcoord.y -= u_lowOff.x/u_TexHL;
            }else{//Is Top Vertex.
                vPos.z+=u_lowOff.y;
                if (u_LowPeg==1.0){
                    vtcoord.y -= u_lowOff.x/u_TexHL;
                }
            }
			vtcoord = vtcoord;//*vResL;
        }
        else{//Upper Wall
            if (isTop==0.0){//Is Bottom Vertex.
                vPos.z+=u_upOff.x;
                if (u_UpPeg==1.0){
                    vtcoord.y -= u_upOff.y/u_TexHU;
                }
                //vtcoord.y += u_upBotOff/u_TexHU;
            }else{//Is Top Vertex.
                vPos.z+=u_upOff.y;
                if (u_UpPeg==0.0){
                    vtcoord.y += u_upOff.x/u_TexHU;
                }
            }
			vtcoord = vtcoord;//*vResU;
        }
    }else{//Middle Wall
        if (isTop==0.0){//Is Bottom Vertex.
            vPos.z-=u_midOff.x;
            vtcoord.y -= u_midOff.x/u_TexHM;
        }else{
            vPos.z+=u_midOff.y;
            vtcoord.y += u_midOff.y/u_TexHM;
        }
		vtcoord = vtcoord;//*vResM;
    }
    

    vec4 object_space_pos = vec4( vPos.x, vPos.y, vPos.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * (object_space_pos);
    
    v_vPosition = (gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos);
	
    v_vColour = in_Colour;
    
    v_vTexcoord = vtcoord;
    
}


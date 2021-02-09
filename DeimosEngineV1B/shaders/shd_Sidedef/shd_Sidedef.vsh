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

uniform float u_lowBotOff;
uniform float u_lowTopOff;
uniform float u_upBotOff;
uniform float u_upTopOff;
uniform float u_LowPeg;
uniform float u_UpPeg;
uniform float u_TexHU;
uniform float u_TexHL;
uniform float u_TexHM;
uniform float u_midBotOff;
uniform float u_midTopOff;

void main()
{

    vec3 vPos = in_Position;
    vec2 vtcoord = in_TextureCoord;
    v_vTIndex = in_TextureCoord2.x;
    v_vMiddle = in_TextureCoord2.y;
    float isTop = in_TextureCoord3.x;
    
    if (v_vMiddle==0.0)
    {
        if (v_vTIndex==0.0){//Lower Wall
            if (isTop==0.0){//Is Bottom Vertex.
                vPos.z+=u_lowBotOff;
                if (u_LowPeg==0.0){
                    vtcoord.y += u_lowTopOff/u_TexHL;
                }
                vtcoord.y -= u_lowBotOff/u_TexHL;
            }else{//Is Top Vertex.
                vPos.z+=u_lowTopOff;
                if (u_LowPeg==1.0){
                    vtcoord.y -= u_lowTopOff/u_TexHL;
                }
            }
        }
        else{//Upper Wall
            if (isTop==0.0){//Is Bottom Vertex.
                vPos.z+=u_upBotOff;
                if (u_UpPeg==1.0){
                    vtcoord.y -= u_upTopOff/u_TexHU;
                }
                //vtcoord.y += u_upBotOff/u_TexHU;
            }else{//Is Top Vertex.
                vPos.z+=u_upTopOff;
                if (u_UpPeg==0.0){
                    vtcoord.y += u_upBotOff/u_TexHU;
                }
            }
        }
    }else{//Middle Wall
        if (isTop==0.0){//Is Bottom Vertex.
            vPos.z-=u_midBotOff;
            vtcoord.y -= u_midBotOff/u_TexHM;
        }else{
            vPos.z+=u_midTopOff;
            vtcoord.y += u_midTopOff/u_TexHM;
        }
    }
    

    vec4 object_space_pos = vec4( vPos.x, vPos.y, vPos.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = (gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos);
    v_vColour = in_Colour;
    
    v_vTexcoord = vtcoord;
    
    
}


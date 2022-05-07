attribute vec3 in_Position;  
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;
varying vec4 v_color;

varying vec4 projection_plane;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    
    v_texcoord = in_TextureCoord;
    
    vec4 outpos = gl_Position.xyzw;
    projection_plane = (outpos + outpos.w) * 0.5;
}

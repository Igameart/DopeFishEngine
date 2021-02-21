//
// Simple billboard vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (x,y,z)     unused in this shader.
//attribute vec4 in_Colour;                    // (r,g,b,a) Not really necessary here...
attribute vec2 in_TextureCoord;              // (u,v)
attribute float in_TextureCoord2;            // current     Starting frame, corresponds to initial value of variable current in obj_display

varying vec2   v_vTexcoord;

uniform float  u_iCurrent;                   // Current frame to be shown for displays that started at frame 0 (so actually just another offset...)
uniform vec2   u_vFrameSize;                 // Texel dimensions of single frame
uniform float  u_fNoFrames;                  // Number of frames
uniform float  u_iCountPerRow;               // Number of images in a single row

uniform float  u_fCamDir;                    // Billboard angle

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    // Rotate towards camera
    object_space_pos.x = cos(-u_fCamDir)*in_Position.x*2.0;
    object_space_pos.y = sin(-u_fCamDir)*in_Position.x*2.0;  // untransformed billboard vertices are aligned along x-axis
    
    // Add actual position
    object_space_pos.xyz += in_Normal;
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    // Select frame by modifying UV's
    float myFrame = mod(u_iCurrent+in_TextureCoord2,u_fNoFrames);
    
    float div = floor(myFrame/u_iCountPerRow);
    float rest = mod(myFrame,u_iCountPerRow);
    
    vec2 offset_index = vec2(div,rest);
    
    v_vTexcoord = ((in_TextureCoord+offset_index) / u_iCountPerRow);
    
}

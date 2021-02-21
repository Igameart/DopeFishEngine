//
// Simple billboard fragment shader
//
varying vec2 v_vTexcoord;

void main()
{
    //gl_FragColor = vec4(1.0,0.0,0.0,1.0); // Useful for quick visual testing
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
}

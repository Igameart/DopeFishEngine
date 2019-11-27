varying vec2 v_texcoord;
varying vec4 v_color;

varying vec4 projection_plane;

uniform sampler2D s_lutmap;
uniform sampler2D s_dithmap;

uniform vec2 screensize;
uniform float dspread;



vec3 sample3DTexture(sampler2D texture, vec3 color, float width) {
    
    float lutSize = sqrt(width); //size of grid, e.g. 8x8
	
    float sliceSize = 1.0 / lutSize; //size of slice (0.0 - 1.0)
	
    float PixelSize = sliceSize / width; // space of 1 pixel
	
    float sliceInnerSize = PixelSize * (width - 1.0);  // space of width pixels
	
    color = clamp(color,0.001,0.999);
	
    float p_x = color.r / width; //r value position
    float p_y = floor( color.g * width ) / width; //g value position
    p_x += floor( color.b * width ) / width; //b value position
    
    vec3 result = texture2D( texture, vec2( p_x, p_y ) ).rgb; //get the new color from the LUT Texture
	
    return result;
}


void main()
{
    vec4 oCol = texture2D(gm_BaseTexture, v_texcoord);
	vec3 t_color;
    t_color = oCol.rgb;
    vec3 o_color = t_color;
    vec2 dCoord = v_texcoord;
    dCoord.x *= screensize.x/128.0;
    dCoord.y *= screensize.y/128.0;
    
    float ditherValue = 2.0 * texture2D(s_dithmap, dCoord).r - 1.0;
    t_color += ditherValue/dspread;
    t_color = clamp(t_color,0.001,0.999);
    
    // Final color 
    vec3 t_col = sample3DTexture(s_lutmap, t_color, 16.0);
	
    gl_FragColor = vec4(t_col.rgb,oCol.a);
}

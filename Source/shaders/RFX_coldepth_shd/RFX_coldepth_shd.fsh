varying vec2 v_texcoord;
varying vec4 v_color;

varying vec4 projection_plane;

uniform sampler2D s_lutmap;
uniform sampler2D s_dithmap;

uniform vec2 screensize;
uniform float dspread;
uniform float cdepth;

uniform float u_Gamma;
uniform bool u_NoMask;

void main()
{
    vec4 t_color;
    t_color = texture2D(gm_BaseTexture, v_texcoord);
    vec3 o_color = t_color.rgb;
    vec2 dCoord = v_texcoord;
    dCoord.x *= screensize.x/128.0;
    dCoord.y *= screensize.y/128.0;
	
	float gamma = u_Gamma;
    t_color.rgb = pow(t_color.rgb, vec3(1.0/gamma));
    
    float ditherValue = 2.0 * texture2D(s_dithmap, dCoord).r - 1.0;
    t_color.rgb += ditherValue/dspread;
    
    //t_color.r = floor(t_color.r*cdepth)*cdepth;
    
    // Final color 
    t_color.rgb = floor(t_color.rgb*cdepth+0.5)/cdepth;
   
    gl_FragColor = t_color;
	
	if (u_NoMask == true){
		gl_FragColor.a = 1.0;
	}
}

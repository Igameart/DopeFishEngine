#extension GL_OES_standard_derivatives : require
precision highp float;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Modification of
//
// No Geometry 360 Video
// By KylBlz
// https://www.shadertoy.com/view/Ml33z2

#define PI 3.14159265
#define DEG2RAD 0.01745329251994329576923690768489

uniform vec2 fov;

uniform vec3 camRot; //camRot is angle vec in rad
uniform vec2 iResolution;
uniform vec2 texRes;
uniform vec2 skyUvs;


vec4 smoothTex2D( sampler2D tex, vec2 tUV){//, vec2 tRes ){
	
	vec2 UV = tUV * texRes;
	
	vec2 alpha = .45 * vec2(abs(dFdx(UV.x)), abs(dFdy(UV.y)));//+0.06;

	vec2 x = fract(UV);
	vec2 x_ = clamp(.5 / alpha * x, 0., 0.5) +
				clamp(.5 / alpha * (x - 1.) + .5, 0., .5);
			
	vec2 texCoord = (floor(UV) + x_) / texRes;

	return texture2D( tex, texCoord );
	
}

//tools
vec3 rotateXY(vec3 p, vec2 angle) {
    vec2 c = cos(angle), s = sin(angle);
    p = vec3(p.x, c.x*p.y + s.x*p.z, -s.x*p.y + c.x*p.z);
    return vec3(c.y*p.x + s.y*p.z, p.y, -s.y*p.x + c.y*p.z);
}

void main() {
    //place 0,0 in center from -1 to 1 ndc
    vec2 uv = gl_FragCoord.xy * 2./iResolution.xy - 1.;
	
    //to spherical
    vec3 camDir = normalize(vec3(uv.xy * vec2(tan( 0.5 * fov )), 1.0));
    
    //rotate
    vec3 rd = normalize(rotateXY(camDir, camRot.yx));
    
    //radial azmuth polar
    vec2 texCoord = vec2(atan(rd.z, rd.x) + PI, acos(-rd.y)) / vec2(2.0 * PI, PI) * skyUvs;
	
	texCoord.x *= floor(1024.0/texRes.x);
	texCoord.y *= 2.50;
	texCoord.y -= 0.33;
	
	texCoord.y = clamp(texCoord.y, 0.5/texRes.y, 1.0-0.5/texRes.y);

    gl_FragColor = smoothTex2D(gm_BaseTexture, texCoord);
    
    // Uncomment to visualize input
    //fragColor = texture(iChannel0, gl_FragCoord.xy/iResolution.xy);
}


#ifdef GL_ES
precision lowp float;
#endif

#define DISPLACE_FACTOR 0.1

uniform sampler2D tex;
uniform sampler2D maskTex;
uniform vec3 tint;

varying vec2 v_texCoord;

void main(void)
{
    vec3 final;
    
    vec3 img = texture2D(tex,v_texCoord).rgb;
    float mask = texture2D(maskTex,v_texCoord).r;
    
    //apply tint
    final = mix(img, tint, mask);
    
    
    gl_FragColor = vec4(final, 1.0);
}
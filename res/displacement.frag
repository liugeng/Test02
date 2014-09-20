#ifdef GL_ES
precision lowp float;
#endif

#define DISPLACE_FACTOR 0.1

uniform sampler2D tex;
uniform sampler2D normalMap;

varying vec2 v_texCoord;

void main(void)
{
    vec3 normalColor = texture2D(normalMap,v_texCoord).xyz;
    
    if(normalColor.z > 0.0)
    {
        vec2 offsetUV = (vec2(normalColor.x, normalColor.y) - vec2(0.5)) * normalColor.z * DISPLACE_FACTOR;
        gl_FragColor = texture2D(tex, v_texCoord + offsetUV);
    }
    else
    {
        gl_FragColor = texture2D(tex, v_texCoord);
    }
}
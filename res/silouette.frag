#ifdef GL_ES
precision lowp float;
#endif

uniform sampler2D tex;
uniform float sampleSize;
uniform int sampleQuality;

varying vec2 v_texCoord;
varying vec4 v_fragmentColor;

void main(void)
{
    const int sampleRange = 1;
    const float sampleSize = 0.01;

    vec4 finalColor = texture2D(tex,v_texCoord);
    
    float sampleCount = 0.0;
    for(int x=-sampleRange; x<=sampleRange; x++){
        for(int y=-sampleRange; y<=sampleRange; y++){
            vec2 sampleUV = v_texCoord + (vec2(x,y) * sampleSize);
            finalColor += texture2D(tex, sampleUV);
            
            sampleCount += 1.0;
        }
    }
    finalColor.rgb /= sampleCount;
    finalColor.a = min(finalColor.a, 1.0);
    
    finalColor *= v_fragmentColor;
    
    gl_FragColor = finalColor;
}
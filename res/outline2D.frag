#ifdef GL_ES
precision highp float;
#endif

#define LINE_THICKNESS 0.0006

uniform sampler2D tex;

varying vec2 uv;

void main(void)
{
    vec4 finalColor = texture2D(tex,uv);
    
    for(int x=-2; x<=2; x++){
        for(int y=-2; y<=2; y++){
            vec2 sampleUV = uv + (vec2(x,y) * LINE_THICKNESS);
            float alphaSample = texture2D(tex, sampleUV).a;
            if(alphaSample < 0.9)
            {
                finalColor.rgb *= alphaSample;
            }
        }
    }
    
    
    gl_FragColor = finalColor;
}
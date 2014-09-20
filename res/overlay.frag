uniform sampler2D tex;
uniform sampler2D destTex;

#define BlendOverlayf(base, blend) 	(base < 0.5 ? (2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend)))
#define Blend(base, blend, funcf) 		vec4(funcf(base.r, blend.r), funcf(base.g, blend.g), funcf(base.b, blend.b), funcf(base.a, blend.a))
#define BlendOverlay(base, blend) 		Blend(base, blend, BlendOverlayf)

varying vec2 uv;

void main()
{
	vec4 color = texture2D(tex, uv);
	vec4 destColor = texture2D(destTex, uv);
	
	// Final
	gl_FragColor = BlendOverlay(destColor, color);
}
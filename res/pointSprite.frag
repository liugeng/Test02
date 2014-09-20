precision mediump float;
uniform sampler2D s_texture;
varying vec4 v_color;

void main()
{
	vec2 texCoord = (rotMatrix * vec4(gl_PointCoord, 0, 1)).xy
	gl_FragColor = v_color * texture2D(s_texture, texCoord);
}
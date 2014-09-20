attribute vec3 vertex;
attribute vec3 normal;
attribute vec2 uv1;

uniform mat4 _mvProj;

varying vec2 uv;

void main(void) {
	// compute position
	gl_Position = _mvProj * vec4(vertex, 1.0);

	uv = uv1;
}
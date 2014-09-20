attribute vec4 a_position;
attribute vec4 a_color;
attribute float a_size;
attribute float a_angle;
varying vec4 v_color;
varying mat4 v_rotationMatrix;


void main()
{
    v_color = a_color;
    gl_Position = CC_MVPMatrix * a_position;
    gl_PointSize = a_size;
	
	float cos = cos(a_angle);
    float sin = sin(a_angle);
    v_rotationMatrix = mat3(cos, -sin, 0.0, sin, cos, 0.0, (1.0-cos-sin)*0.5, (1.0+sin-cos)*0.5, 1.0);
//	or - rotate other direction
//	v_rotationMatrix = mat3(cos, sin, 0.0,
//							-sin, cos, 0.0,
//							(sin-cos+1.0)*0.5, (-sin-cos+1.0)*0.5, 1.0);
}
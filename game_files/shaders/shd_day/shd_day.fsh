//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec3 day_color = vec3(1.0, 1.0, 1.0);
const vec3 night_color = vec3(0.2, 0.2, 0.5);

uniform float time_of_day;

void main()
{
	vec4 pixel = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec3 color = mix(day_color, night_color, time_of_day);
	
    gl_FragColor = vec4(pixel.rgb*color.rgb, pixel.a);
}

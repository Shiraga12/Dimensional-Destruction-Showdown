
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform vec2 direction;
uniform float smoothness;
uniform sampler2D texture2;

const vec2 center = vec2(0.5);

void main() {
	vec2 uv = v_vTexcoord;
	
	vec2 v = normalize(direction);
	v /= abs(v.x) + abs(v.y);
	float d = v.x * center.x + v.y * center.y;
	float m = 1.0 - smoothstep(-smoothness, 0.0, v.x * uv.x + v.y * uv.y - (d - 0.5 + (1.0-progress) * (1.0 + smoothness)));
	
	vec4 col_tex = texture2D(gm_BaseTexture, (uv - 0.5) * m + 0.5);
	
	gl_FragColor = mix(vec4(color, 1.0), col_tex, m);
}


/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 pos_res;
uniform float progress;
uniform vec3 color;
uniform vec2 squares;
uniform vec2 direction;
uniform float smoothness;
uniform float smooth_edges;
uniform bool invert;

float smoothclamp(float x, float a, float b) {
	return smoothstep(0.0, 1.0, (x - a)/(b - a))*(b - a) + a;
}

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = v_vTexcoord;
	vec2 uv2 = vPos/pos_res.zw;
	
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	
	vec2 center = vec2(0.5);
	vec2 v = normalize(direction);
	v /= abs(v.x) + abs(v.y);
	
	float d = v.x * center.x + v.y * center.y;
	float hf = smoothstep(-smoothness, 0.0, (v.x * uv2.x + v.y * uv2.y) - (d-0.5+progress * (1.0+smoothness)));
	if (invert) hf = 1.0 - hf;
	
	vec2 sqrep = fract(uv2 * vec2(squares));
	vec2 sqmin = vec2(hf/2.0);
	vec2 sqmax = vec2(1.0 - hf/2.0);
	
	float s = (hf < 1.0) ? smooth_edges : 0.0;
	float halftone = (1.0 - step(progress, 0.0)) *
	smoothstep(sqmin.x-s, sqmin.x, sqrep.x) *
	smoothstep(sqmin.y-s, sqmin.y, sqrep.y) *
	smoothstep(sqrep.x-s, sqrep.x, sqmax.x) *
	smoothstep(sqrep.y-s, sqrep.y, sqmax.y);
	
	gl_FragColor = vec4(mix(col_tex.rgb, color, halftone), 1.0);
}


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
uniform bool invert;
uniform float smooth_edges;
uniform float angle_max;

float smoothclamp(float x, float a, float b) {
	return smoothstep(0.0, 1.0, (x - a)/(b - a))*(b - a) + a;
}

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = v_vTexcoord;
	vec2 uv2 = (vPos-0.5*pos_res.zw) / min(pos_res.z, pos_res.w);
	
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec3 col_dmg = vec3(0.0);
	
	float angle = radians(progress * angle_max);
	uv2 *= mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
	uv2 = abs(uv2);
	float dmd = dot(uv2, normalize(vec2(1.0))); //1.73
	//dmd = max(dmd, uv2.x);
	float d = smooth_edges;
	col_dmg += (invert) ?
	1.0-smoothstep(dmd, dmd+d, smoothclamp(progress, -smooth_edges, 1.0)) :
	smoothstep(dmd, dmd+d, 1.0-smoothclamp(progress, -smooth_edges, 1.0));
	
	gl_FragColor = vec4(mix(color, col_tex.rgb, col_dmg), 1.0);
}

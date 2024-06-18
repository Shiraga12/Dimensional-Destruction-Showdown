
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
uniform float inner;
uniform vec2 center;
uniform bool invert;
uniform sampler2D texture2;

float smoothclamp(float x, float a, float b) {
	return smoothstep(0.0, 1.0, (x - a)/(b - a))*(b - a) + a;
}

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = v_vTexcoord;
	float pw = min(progress, 1.0 - progress)*2.0;
	
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec4 col_tex2 = texture2D(texture2, uv);
	
	vec2 uvc = vPos/pos_res.w;
	vec2 offset = vec2(center.x * pos_res.z/pos_res.w, center.y);
	
	float d = length(uvc - offset);
	float col_circ = (invert) ?
	smoothstep(d-inner, d, smoothclamp(pw, -inner, 1.1)) :
	smoothstep(d-inner, d, 1.0-smoothclamp(pw, -0.1-inner, 1.0+inner));
	
	gl_FragColor = vec4(mix(color, (progress < 0.5) ? col_tex2.rgb : col_tex.rgb, col_circ), 1.0);
}

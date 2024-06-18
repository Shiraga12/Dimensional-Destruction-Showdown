
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
uniform vec2 center;
uniform bool invert;
uniform float scale_max;
uniform sampler2D mask_tex;
uniform vec2 mask_res;

float smoothclamp(float x, float a, float b) {
	return smoothstep(0.0, 1.0, (x - a)/(b - a))*(b - a) + a;
}

void main() {
	vec2 vPos = (v_vPosition - pos_res.zw);
	vec2 uv = v_vTexcoord;
	
	vec2 ratio = vec2(pos_res.z/mask_res.x, pos_res.w/mask_res.y);
	float p = smoothclamp(progress, 0.0, 1.0);
	vec2 uv2 = ratio * (uv - center) / (scale_max - (p * scale_max)) + center;
	
	vec3 msk = vec3(0.0);
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec4 col_mask = texture2D(mask_tex, uv2);
	msk += col_mask.a;
	if (invert) col_mask = 1.0-col_mask;

	gl_FragColor = vec4(mix(color, col_tex.rgb * col_mask.rgb, msk.r), 1.0);
}

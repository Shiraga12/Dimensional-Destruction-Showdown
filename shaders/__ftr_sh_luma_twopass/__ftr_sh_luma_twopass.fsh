
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform float inner;
uniform sampler2D texture2;
uniform sampler2D luma_tex;

void main() {
	vec2 uv = v_vTexcoord;
	
	float pw = min(progress, 1.0 - progress);
	vec4 col_tex = texture2D(texture2, uv);
	vec4 col_tex1 = texture2D(gm_BaseTexture, uv);
	vec4 col_luma = texture2D(luma_tex, uv);
	
	float pg = 1.0-pw*2.0;
	gl_FragColor = vec4(mix(progress < 0.5 ? col_tex.rgb : col_tex1.rgb, color.rgb,
	smoothstep(pg-inner, pg, col_luma.r-inner+pow(pw, 4.0) )), 1.0);
}

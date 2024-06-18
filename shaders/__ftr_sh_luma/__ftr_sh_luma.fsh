
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform float inner;
uniform sampler2D luma_tex;

void main() {
	vec2 uv = v_vTexcoord;
	float pw = 1.0 - progress;
	
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec4 col_luma = texture2D(luma_tex, uv);
	
	gl_FragColor = vec4(mix(col_tex.rgb, color.rgb, smoothstep(pw-inner, pw, col_luma.r-inner+pow(progress, 200.0))), 1.0);
}


/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;

void main() {
	vec2 uv = v_vTexcoord;
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec3 gray = vec3(dot(col_tex.rgb, vec3(0.299, 0.587, 0.114)));
	gl_FragColor = mix(col_tex, (vec4(vec3(1.0), 1.0) + vec4(gray, 1.0)) * vec4(color, 1.0), progress);
}
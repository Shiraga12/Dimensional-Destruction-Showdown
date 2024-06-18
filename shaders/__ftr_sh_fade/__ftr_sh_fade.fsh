
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
	gl_FragColor = mix(texture2D(gm_BaseTexture, uv), vec4(color, 1.0), progress);
}

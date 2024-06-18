
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform sampler2D texture2;

void main() {
	vec2 uv = v_vTexcoord;
	gl_FragColor = mix(texture2D(texture2, uv), texture2D(gm_BaseTexture, uv), progress) * vec4(color, 1.0);
}

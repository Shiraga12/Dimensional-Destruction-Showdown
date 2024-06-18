
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform sampler2D texture2;

const float color_phase = 0.4;

void main() {
	vec2 uv = v_vTexcoord;
	gl_FragColor = mix(mix(vec4(color, 1.0), texture2D(texture2, uv), smoothstep(1.0-color_phase, 0.0, progress)),
	mix(vec4(color, 1.0), texture2D(gm_BaseTexture, uv), smoothstep(color_phase, 1.0, progress)), progress);
}

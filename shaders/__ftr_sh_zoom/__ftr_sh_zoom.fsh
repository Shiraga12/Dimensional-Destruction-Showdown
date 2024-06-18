
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform float zoom_factor;

void main() {
	vec2 uv = v_vTexcoord;
	vec2 uv2 = ((uv-0.5)*(1.0-(progress/zoom_factor)))+0.5;
	gl_FragColor = mix(texture2D(gm_BaseTexture, uv2), vec4(color, 1.0), progress);
}

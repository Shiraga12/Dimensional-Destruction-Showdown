
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform vec2 direction;

void main() {
	vec2 uv = v_vTexcoord;
	vec2 p = uv + progress * sign(direction);
	vec2 f = fract(p);
	float wp = step(0.0, p.y) * step(p.y, 1.0) * step(0.0, p.x) * step(p.x, 1.0);
	gl_FragColor = mix(vec4(color, 1.0), texture2D(gm_BaseTexture, f), wp);
}

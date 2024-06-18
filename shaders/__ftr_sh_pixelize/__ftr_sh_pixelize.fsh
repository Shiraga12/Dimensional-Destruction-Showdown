
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
uniform float squares_max;
uniform float steps;

const float darktime = 1.2;

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = vPos/pos_res.w;
	
	float dist_from_edges = (steps > 0.0) ? ceil(progress * steps)/steps : progress;
	vec2 square_size = 2.0 * dist_from_edges / vec2(squares_max);
	
	vec2 uv2 = (dist_from_edges > 0.0) ? (floor(uv/square_size) + 0.5)*square_size : uv;
	uv2.x /= (pos_res.z/pos_res.w);
	
	gl_FragColor = mix(texture2D(gm_BaseTexture, uv2), vec4(color.rgb, 1.0), progress*darktime);
}

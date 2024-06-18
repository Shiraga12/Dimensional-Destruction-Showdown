
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 pos_res; // x, y | w, h -> (x,y,z,w)
uniform float progress;
uniform vec3 color;
uniform float squares_max;
uniform float steps;
uniform sampler2D texture2;

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = vPos/pos_res.w;
	
	float pw = min(progress, 1.0 - progress);
	float dist_from_edges = (steps > 0.0) ? ceil(pw * steps)/steps : pw;
	vec2 square_size = 2.0 * dist_from_edges / vec2(squares_max);
	
	vec2 uv2 = (dist_from_edges > 0.0) ? (floor(uv/square_size) + 0.5)*square_size : uv;
	uv2.x /= (pos_res.z/pos_res.w);
	
	gl_FragColor = mix(texture2D(texture2, uv2), texture2D(gm_BaseTexture, uv2), progress) * vec4(color, 1.0);
}

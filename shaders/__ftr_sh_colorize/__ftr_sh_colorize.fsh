
varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 pos_res; // x, y | w, h -> (x,y,z,w)
uniform vec3 color;

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = v_vTexcoord;
	gl_FragColor = texture2D(gm_BaseTexture, uv) * vec4(color, 1.0);
}

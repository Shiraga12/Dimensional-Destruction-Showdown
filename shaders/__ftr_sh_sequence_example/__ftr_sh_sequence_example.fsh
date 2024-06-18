
varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 pos_res; // x, y | w, h -> (x,y,z,w)
uniform float progress;
uniform vec3 color;
uniform float time;
uniform sampler2D texture2;

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = v_vTexcoord;
	
	/*vec2 uv2 = vPos/pos_res.w;
	uv2.x -= time/5.0;
	
	vec4 col_tex = texture2D(gm_BaseTexture, uv) * v_vColour;
	vec4 col_pattern = texture2D(texture2, uv2);
	
	gl_FragColor = vec4(mix(col_tex.rgb, col_pattern.rgb, col_pattern.a), 1.0);*/
	
	vec3 col = 0.5 + 0.5*cos((time)+uv.xyx + vec3(0.0, 2.0, 4.0));
	gl_FragColor = texture2D(gm_BaseTexture, uv) * vec4(col, 1.0);
	//gl_FragColor = texture2D(gm_BaseTexture, uv) * vec4(vec3(progress)*color, 1.0);
}

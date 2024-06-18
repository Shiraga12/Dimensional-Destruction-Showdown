
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	vec4 screen_tex = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = vec4(vec3(dot(screen_tex.rgb, vec3(0.299, 0.587, 0.114))), screen_tex.a);
}
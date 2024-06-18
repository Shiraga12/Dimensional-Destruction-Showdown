
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform float bars;
uniform float amplitude;
uniform float frequency;
uniform float drip_scale;
uniform float noise;
uniform float scale;
uniform sampler2D texture2;

float rand(float p) {
	return fract(sin(p * (91.3458)) * 47453.5453);
}
float wave(float num) {
	float fn = num * frequency * bars * 0.1;
	return cos(fn*0.5) * cos(fn*0.13) * sin((fn+10.0) * 0.3)/2.0 + 0.5;
}
float drip(float num) {
	return sin(num / (bars-1.0) * 3.141592) * drip_scale;
}
float pos(float num) {
	return (noise == 0.0 ? wave(num) : mix(wave(num), rand(num), noise)) + (drip_scale == 0.0 ? 0.0 : drip(num));
}

void main() {
	vec2 uv = v_vTexcoord;
	
	float bar = floor(uv.x * (bars));
	float sc = scale + pos(bar) * amplitude;
	float phase = progress * sc;
	float pos_y = uv.y;
	vec3 col = (uv.y-phase > 0.0) ?
	texture2D(texture2, vec2(uv.x, uv.y-phase)).rgb * mix(vec3(1.0), color, progress*3.0) : texture2D(gm_BaseTexture, uv).rgb;
	
	gl_FragColor = vec4(col, 1.0);
}

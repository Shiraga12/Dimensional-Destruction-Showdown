
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

#define Pi 3.1415926

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform sampler2D texture2;

uniform vec2 center;
uniform float strength;
uniform float swirl;

float ease_in_out_sine(float x) {
	return -(cos(Pi * x) - 1.0) / 2.0;
}
float random(float p) {
	return fract(sin(p)*1000.0);
}
float noise(vec2 p) {
	return random(p.x + p.y*1000.0);
}

void main() {
	vec2 uv = v_vTexcoord;
	float progress_way = min(progress, 1.0 - progress);
	
	float pw = min(progress, 1.0 - progress); // variations below:
	//float angle = smoothstep(progress, 1.0, pw * distance(vec2(0.5), uv) * swirl);
	//float angle = pw * distance(vec2(0.5), uv) * swirl;
	float angle = (radians(progress) * 360.0) * smoothstep(progress, 1.0, pw * distance(vec2(0.5), uv) * swirl);
	//float angle = radians(progress) * 360.0;
	//float angle = (radians(progress) * 360.0) * step(progress, pw * distance(vec2(0.5), uv) * swirl);
	
	uv -= 0.5;
	mat2 m = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
	uv *= m;
	uv += 0.5;
	
	float dissolve = ease_in_out_sine(progress);
	float total = 0.0;
	float offset = noise(uv);
	vec2 to_center = center - uv;
	vec4 col = vec4(0.0);
	
	for (float t = 0.0; t <= 20.0; t++) {
		float percent = (t+offset) / strength;
		float weight = 4.0 * (percent-percent*percent);
		vec2 uv2 = uv + to_center*percent*progress_way;
		col += mix(texture2D(texture2, uv2), texture2D(gm_BaseTexture, uv2), dissolve) * weight;
		total += weight;
	}
	
	gl_FragColor = vec4(col / total) * vec4(color, 1.0);
}

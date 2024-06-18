
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform vec3 color_frost;
uniform float frost_multiplier;
uniform float inner;
uniform sampler2D texture2;

const int passes = 6;

float random(inout float rnd) {
	return rnd = (fract(sin(rnd)*9999.0)-0.5)*2.0;
}
float noise(vec2 p, inout float rnd) {
	return rnd = fract(sin(dot(p, vec2(12.9898, 78.233))));
}

void main() {
	vec2 uv = v_vTexcoord;
	
	float circ = smoothstep(inner, inner*10.0, length(uv - 0.5))*progress;
	
	float rand = 0.0;
	vec4 col_blur = vec4(0.0);
	vec2 uv2 = uv;
	noise(uv, rand);
	
	for(int i = 0; i < passes; i++) {
		uv2.x = random(rand);
		uv2.y = random(rand);
		vec2 uv3 = uv+uv2*circ;
		col_blur += texture2D(gm_BaseTexture, uv3) / float(passes);
	}
	
	vec3 frost = mix(vec3(1.0), color_frost, circ+progress*frost_multiplier);
	gl_FragColor = mix(col_blur * vec4(frost /= 1.0-vec3(progress/2.0), 1.0), vec4(color, 1.0), progress);
}

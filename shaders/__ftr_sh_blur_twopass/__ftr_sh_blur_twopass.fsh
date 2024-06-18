
/*------------------------------------------------------------------------
You cannot redistribute this pixel shader source code anywhere.
Made by Foxy Of Jungle. Thanks.
------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;
uniform vec3 color;
uniform float amount;
uniform sampler2D texture2;

const int passes = 8;

float random(inout float rnd) {
	return rnd = (fract(sin(rnd)*9999.0)-0.5)*2.0;
}
float noise(vec2 p, inout float rnd) {
	return rnd = fract(sin(dot(p, vec2(12.9898, 78.233))));
}

void main() {
	vec2 uv = v_vTexcoord;
	
	float pw = min(progress, 1.0 - progress);
	
	float pg = amount*pw/100.0;
	float rand = 0.0;
	vec4 col_blur = vec4(0.0);
	vec2 uv2 = uv;
	noise(uv, rand);
	
	for(int i = 0; i < passes; i++) {
		uv2.x = random(rand);
		uv2.y = random(rand);
		vec2 uv3 = uv + uv2 * pg;
		col_blur += mix(texture2D(texture2, uv3), texture2D(gm_BaseTexture, uv3), progress) / float(passes);
	}
	gl_FragColor = vec4(col_blur.rgb * color, 1.0);
}


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
uniform float inner;
uniform sampler2D luma_tex;
uniform sampler2D bayer_tex;

const float bayer_size = 8.0;

float dither(vec2 ps, float br) {  
	float by = texture2D(bayer_tex, mod(ps, bayer_size)/bayer_size).r;
	return (br > by) ? 1.0 : 0.0;
}

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = v_vTexcoord;
	
	float pw = min(progress, 1.0 - progress);
	
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec4 col_luma = texture2D(luma_tex, uv);
	
	float pg = 1.0-progress;
	vec3 col_circ = vec3(smoothstep(pg-inner, pg, col_luma.r-inner+pow(progress, 200.0) ));
	float col_dither = dither(vPos, col_circ.r);
	
	gl_FragColor = vec4(mix(col_tex.rgb, color.rgb, col_dither), 1.0);
}

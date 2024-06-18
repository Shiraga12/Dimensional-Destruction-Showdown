
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

uniform float fade_delay;
uniform float bar_height;
uniform float bar_dist;
uniform float wave_freq;
uniform float wave_amp;
uniform float wave_spd;
uniform sampler2D texture2;

void main() {
	vec2 vPos = (v_vPosition - pos_res.xy);
	vec2 uv = v_vTexcoord;
	vec2 uv2 = (progress < 0.5) ? 1.0 - uv : uv;
	
	float pw = min(progress, 1.0 - progress)*2.0;
	
	float w = smoothstep(0.0, 1.0, pw-1.0 * ((1.0-pw)-uv2.y));
	float wave = (wave_amp * sin((uv2.y * wave_freq) + pw*wave_spd)) * w;
	uv.x -= mod(floor(vPos.y/bar_height), bar_dist) < 1.0 ? wave : 0.0;
	
	float fade = clamp(0.0, (pw*(fade_delay+1.0)) - fade_delay, 1.0);
	vec4 col_tex = texture2D(gm_BaseTexture, uv);
	vec4 col_tex2 = texture2D(texture2, uv);
	
	gl_FragColor = vec4(mix(((progress < 0.5) ? col_tex2.rgb : col_tex.rgb)+vec3(fade), color, fade)*color, 1.0);
}

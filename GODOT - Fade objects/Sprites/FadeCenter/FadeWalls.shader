shader_type spatial;
render_mode blend_mix, cull_disabled, depth_draw_alpha_prepass;

uniform sampler2D noiseTexture : hint_white;
uniform sampler2D screenFadeTexture : hint_white;
uniform float fadeRange : hint_range(0, 1) = 0.5;
uniform vec4 color : hint_color;

void fragment(){
	float adjustedFade = (fadeRange * 2.0 - 1.0) * 0.25;
	
	float noiseValue = (1.0 - (texture(noiseTexture, UV).r * texture(screenFadeTexture, SCREEN_UV).r )) - adjustedFade;
	ALPHA = round(noiseValue);

	noiseValue = 1.0 - (noiseValue - 0.02);
	EMISSION = round(noiseValue) * color.rgb;
}
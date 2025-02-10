// NOTE: Shader automatically converted from Godot Engine 4.3.stable's CanvasItemMaterial.

shader_type canvas_item;
render_mode blend_mix;

varying vec2 rot;


void vertex() {
	rot = 2.0*(COLOR.rg-vec2(0.5));
	COLOR = vec4(1.0);
}

void fragment() {
	NORMAL_MAP = (texture(NORMAL_TEXTURE, UV).rgb-vec3(0.5)) *
	mat3(
		vec3(rot.y, -rot.x, 0),
		vec3(rot.x, rot.y, 0),
		vec3(0, 0, 1)
	) + vec3(0.5);
	;
}
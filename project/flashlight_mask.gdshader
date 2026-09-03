shader_type canvas_item;

uniform sampler2D mask;
uniform vec2 target = vec2 (0.5f);
uniform float size_mod = 2.5;

void fragment() {
    COLOR = texture(TEXTURE, UV);

    // Position relative to the target.
    vec2 p = UV - target;

    // Adjust for aspect ratio.
    float aspect = TEXTURE_PIXEL_SIZE.y / TEXTURE_PIXEL_SIZE.x;
    p.x *= aspect;

    // Convert from [-0.5, 0.5] around target into [0, 1] mask coordinates.
    vec2 mask_uv = (p + vec2(0.5));

    COLOR.a = texture(mask, mask_uv).r;
	
}


/*shader_type canvas_item;

uniform sampler2D mask;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	
	vec2 muv = UV;
	muv.y = 1.0 - muv.y; //flips mask rightside-up
	COLOR.a = texture(mask, muv).r;
}
*/
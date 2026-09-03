shader_type canvas_item;

uniform vec2 mouse_uv = vec2(0.5, 0.5);
uniform float radius = 0.1; // Size of transparent hole
uniform float softness = 0.02; // Edge fade

void fragment() {
    vec4 col = texture(TEXTURE, UV);
    float dist = distance(UV, mouse_uv);
    float alpha_mask = smoothstep(radius, radius - softness, dist);
    col.a *= alpha_mask;
    COLOR = col;
}
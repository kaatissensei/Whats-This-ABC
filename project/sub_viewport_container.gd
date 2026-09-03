extends SubViewportContainer

var flashlight_size : float = 15

func _ready() -> void:
	_change_size(flashlight_size)

func _process(_delta: float) -> void:
	var t = get_viewport().get_mouse_position()
	t.x /= get_viewport_rect().size.x
	t.y /= get_viewport_rect().size.y
	get_material().set_shader_parameter("target", t)
	#get_material().set_shader_parameter("size", s)


func _change_size(value: float) -> void:
	var new_size : float = 1 + value/10.0
	var mask : GradientTexture2D = get_material().get_shader_parameter("mask")
	mask.fill_to = Vector2(new_size, new_size)

extends Label

func _ready() -> void:
	size = $"..".size
	add_theme_font_size_override("font_size", $"..".size.y / 2)

func _on_health_item_rect_changed() -> void:
	size = $"..".size
	add_theme_font_size_override("font_size", $"..".size.y / 2)

extends Node2D

class_name FloatingDamageText

@export var speed: int
var movement: Vector2

func _ready() -> void:
	movement = Vector2(randf_range(-1, 1), -1).normalized() * speed
	$AnimationPlayer.play("float_and_pop")

func _process(delta: float) -> void:
	position += movement * delta

func init_floating_text(value: int) -> void:
	$Label.text = "%s" % abs(value)
	
	if value < 0:
		$Label.add_theme_color_override("font_color", Color(1, 0, 0))
	if value > 0:
		$Label.add_theme_color_override("font_color", Color(0, 1, 0))

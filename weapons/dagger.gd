extends Node2D

var stabbedEnemies: Dictionary = {}

@export var attack_speed: int

func _ready() -> void:
	$Sprite2D/Area2D/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var cursor_location = get_global_mouse_position()
	look_at(cursor_location)

	if Input.is_action_pressed("click"):
		$AnimationPlayer.play("stab", -1, 10)

func resetDamage() -> void:
	stabbedEnemies.clear()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("hurt") and not body in stabbedEnemies:
		body.hurt()
		stabbedEnemies[body] = null

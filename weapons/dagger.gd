extends Node2D

## The base attack speed for this weapon, expressed in attacks per second.
@export var base_attack_speed: float

## The base damage for this weapon.
@export var base_damage: float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var cursor_location: Vector2 = get_global_mouse_position()
	look_at(cursor_location)

	if Input.is_action_pressed("click"):
		attack(base_attack_speed)

## Activate the attack for this weapon
##
## [param attack_speed]: Attack speed expressed as attacks per second.
func attack(attack_speed: float = 1) -> void:
		$AnimationPlayer.play("stab", -1, attack_speed)

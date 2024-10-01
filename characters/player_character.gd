extends CharacterBody2D

var speed: int = 100
var equipped_weapon: EquippableWeapon

# TODO: Remove in favor of better equipping system
var dagger_scene: PackedScene = preload("res://weapons/dagger.tscn")

## Handle character movement
func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("move_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("move_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		direction += Vector2.LEFT
	
	if direction.x < 0:
		$Sprite2D.flip_h = true
	elif direction.x > 0:
		$Sprite2D.flip_h = false

	move_and_collide(direction * speed * delta)
	
	if equipped_weapon != null:
		var cursor_location: Vector2 = get_global_mouse_position()
		equipped_weapon.look_at(cursor_location)

		if Input.is_action_pressed("click"):
			equipped_weapon.attack(1.0)

## If we attach a weapon to this character, automatically
## equip it.
func _on_child_entered_tree(node: Node) -> void:
	if node.is_in_group("equippable_weapon"):
		equipped_weapon = node

func equip_dagger() -> void:
	var dagger: EquippableWeapon = dagger_scene.instantiate()
	dagger.base_attack_speed = 3
	dagger.base_damage = 10
	add_child(dagger)

func unequip_dagger() -> void:
	equipped_weapon.queue_free()
	equipped_weapon = null

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		equip_dagger()
	else:
		unequip_dagger()

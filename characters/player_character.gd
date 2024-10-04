extends CharacterBody2D

@export var attack_damage: float = 10
@export var attack_speed: float = 1

var speed: int = 100
var equipped_weapon: EquippableWeapon

# TODO: Remove in favor of better equipping system
var dagger_scene: PackedScene = preload("res://weapons/dagger.tscn")
var spear_scene: PackedScene = preload("res://weapons/spear.tscn")
var hammer_scene: PackedScene = preload("res://weapons/hammer.tscn")

## Handle character movement
func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("move_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("move_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		direction += Vector2.LEFT
	
	velocity = direction * speed
	
	look_at(get_global_mouse_position())

	move_and_slide()

	if equipped_weapon != null and Input.is_action_pressed("click"):
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

func equip_spear() -> void:
	var spear: EquippableWeapon = spear_scene.instantiate()
	spear.base_attack_speed = attack_speed
	spear.base_damage = attack_damage
	add_child(spear)

func unequip_spear() -> void:
	equipped_weapon.queue_free()
	equipped_weapon = null

func equip_hammer() -> void:
	var hammer: EquippableWeapon = hammer_scene.instantiate()
	hammer.base_attack_speed = attack_speed
	hammer.base_damage = attack_damage
	add_child(hammer)

func unequip_hammer() -> void:
	equipped_weapon.queue_free()
	equipped_weapon = null

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		equip_hammer()
	else:
		unequip_hammer()

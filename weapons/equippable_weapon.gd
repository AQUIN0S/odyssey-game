extends Node2D

class_name EquippableWeapon

@onready var damage_box: DamageBox = $Sprite2D/DamageBox

## The base attack speed for this weapon, expressed in attacks per second.
@export var base_attack_speed: float = 1

## The base damage for this weapon.
@export var base_damage: float = 1

func _ready() -> void:
	damage_box.damage = base_damage
	damage_box.vulnerable_groups = ["enemy"]

## Activate the attack for this weapon
## TODO: Do something with flat_damage_mod
##
## [param flat_damage_mod] 
## [param attack_speed]: Attack speed expressed as attacks per second.
func attack(flat_damage_mod: float = 0, attack_speed: float = 1) -> void:
		$AnimationPlayer.play("stab", -1, attack_speed * base_attack_speed)

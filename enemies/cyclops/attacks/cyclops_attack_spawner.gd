extends Node2D

class_name CyclopsAttackSpawner

var punch_attack: PackedScene = preload("res://enemies/cyclops/attacks/punch_attack.tscn")

enum AttackType {
	PUNCH
}

func attack(attack_type: AttackType, pos: Vector2, attack_damage: float = 10, attack_speed: float = 1) -> void:
	match attack_type:
		AttackType.PUNCH:
			var punch: PunchAttack = punch_attack.instantiate()
			punch.init_punch(pos, attack_damage, attack_speed)
			get_tree().root.add_child(punch)

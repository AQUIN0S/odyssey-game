extends Node2D

class_name FloatingDamageTextSpawner

var floating_damage_text: PackedScene = preload("res://components/floating_damage_text/floating_damage_text.tscn")

func create_floating_damage_text(amount: float, atPosition: Vector2) -> void:
		var dmgText: FloatingDamageText = floating_damage_text.instantiate()

		dmgText.init_floating_text(amount)
		dmgText.position = atPosition
		get_tree().root.add_child(dmgText)

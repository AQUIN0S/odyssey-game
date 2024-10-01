extends Area2D

class_name DamageBox

var damage: float
var damaged_enemies: Dictionary
var vulnerable_groups: Array[StringName]

func reset_damage() -> void:
	damaged_enemies.clear()

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("deal_damage") and not area in damaged_enemies:
		damaged_enemies[area] = null
		
		var dealt_damage: float = area.deal_damage(damage, vulnerable_groups)
		var floating_dmg_text_spawner: FloatingDamageTextSpawner = get_tree().current_scene.get_node("FloatingDamageTextSpawner")
		
		if floating_dmg_text_spawner != null:
			floating_dmg_text_spawner.create_floating_damage_text(-dealt_damage, area.global_position)

extends Area2D

@export var base_damage: float

var damage_mod: float = 1.0
var damaged_enemies: Dictionary

func wield(wielder_damage_mod: float) -> void:
	damage_mod = wielder_damage_mod

func reset_damage() -> void:
	damaged_enemies.clear()

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("deal_damage") && not area in damaged_enemies:
		damaged_enemies[area] = null
		
		var dealt_damage: float = area.deal_damage(base_damage * damage_mod)
		var floating_dmg_text_spawner: FloatingDamageTextSpawner = get_tree().current_scene.get_node("FloatingDamageTextSpawner")
		
		if floating_dmg_text_spawner != null:
			floating_dmg_text_spawner.create_floating_damage_text(-dealt_damage, area.global_position)

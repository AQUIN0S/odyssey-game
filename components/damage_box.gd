extends Area2D

@export var baseDamage: float

var floating_damage_text = preload("res://components/floating_damage_text.tscn")

var damageMod: float = 1.0
var damagedEnemies: Dictionary

func wield(wielderDamageMod: float) -> void:
	damageMod = wielderDamageMod

func reset_damage() -> void:
	damagedEnemies.clear()

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("deal_damage") && not area in damagedEnemies:
		damagedEnemies[area] = null
		var dealtDamage = area.deal_damage(baseDamage * damageMod)
		var dmgText: FloatingDamageText = floating_damage_text.instantiate()
		
		var color: Color
		if (dealtDamage > 0):
			color = Color(1, 0, 0)
		else:
			color = Color(0.6, 0.6, 0.6)

		dmgText.init_floating_text(-dealtDamage)
		dmgText.position = global_position
		get_tree().root.add_child(dmgText)

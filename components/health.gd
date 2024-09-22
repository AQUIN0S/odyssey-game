extends ProgressBar

class_name Health

@export var resist_percent: float = 0.0
@export var resist_flat: float = 0.0

@export var is_invulnerable: bool = false
@export var is_immortal: bool = false

@export var show_health: bool = false

func _ready() -> void:
	set_health_text()

## Deal damage to the entity. 
func deal_damage(damage: float) -> float:
	if is_invulnerable:
		return 0
	
	damage *= 1 - resist_percent / 100
	damage -= resist_flat
	
	damage = max(damage, 0)
	var actualDamage = update_health(-damage) * -1
	return actualDamage

func check_death() -> void:
	if not is_immortal and value <= 0:
		var parent: Node = get_parent()
		if parent.has_method("die"):
			parent.die()

func update_health(amount: float) -> float:
	var prev_value = value
	value = max(0, amount + value)
	set_health_text()
	return value - prev_value

func set_health_text() -> void:
	$Label.text = "%s / %s" % [value, max_value]

extends Area2D

@export var health: Health

## Attempt to deal damage to this character's health.
func deal_damage(damage: float) -> float:
	return health.deal_damage(damage)

extends Area2D

@export var health: Health

## Attempt to deal damage to this character's health.
##
## [param damage]: Damage to be dealt to the health
## [param damaging_groups]: Array of group names that this attack is affecting.
func deal_damage(damage: float, damaging_groups: Array[String]) -> float:
	if intersects($"..".get_groups() as Array[String], damaging_groups):
		return health.deal_damage(damage)
	
	return 0

func intersects(arr1: Array[String], arr2: Array[String]):
	var arr2_dict = {}
	for v: String in arr2:
		arr2_dict[v] = true

	for v: String in arr1:
		if arr2_dict.get(v, false):
			return true
	return false

extends Area2D

@export var health: Health

## Attempt to deal damage to this character's health.
##
## [param damage]: Damage to be dealt to the health
## [param damaging_groups]: Array of group names that this attack is affecting.
func deal_damage(damage: float, damaging_groups: Array[StringName]) -> float:
	if intersects($"..".get_groups(), damaging_groups):
		return health.deal_damage(damage)
	
	return 0

func intersects(arr1: Array[StringName], arr2: Array[StringName]) -> bool:
	var arr2_dict: Dictionary = {}
	for v: StringName in arr2:
		arr2_dict[v] = true

	for v: StringName in arr1:
		if arr2_dict.get(v, false):
			return true
	return false

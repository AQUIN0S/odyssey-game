extends CharacterBody2D

## Navigation agent to help with pathfinding towards the target "ally".
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

## Spawns Cyclops's attacks.
@onready var attack_spawner: CyclopsAttackSpawner = $CyclopsAttackSpawner

## Speed of Cyclops's movement.
@export var movement_speed: int = 50

## Base damage of Cyclops's punch.
@export var punch_damage: float = 10

## Attacks per second
@export var attack_rate: float = 1

## How quickly the attacks resolve (multiplier)
@export var attack_speed: float = 2

var time_since_last_attack: float = 0

func _process(delta: float) -> void:
	time_since_last_attack += delta
	var attack_period: float = 1 / attack_rate
	
	if in_range() and time_since_last_attack > attack_period:
		attack_spawner.attack(CyclopsAttackSpawner.AttackType.PUNCH, get_closest_ally().global_position, punch_damage, attack_speed)
		time_since_last_attack = 0

func _physics_process(_delta: float) -> void:
	var next_path_pos: Vector2 = nav_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_pos) * movement_speed
	
	velocity = new_velocity
	
	move_and_slide()

func in_range() -> bool:
	return global_position.distance_to(get_closest_ally().global_position) < nav_agent.target_desired_distance

func makepath() -> void:
	if !in_range():
		nav_agent.target_position = get_closest_ally().global_position

func _on_timer_timeout() -> void:
	makepath()

func _on_navigation_agent_2d_target_reached() -> void:
	nav_agent.target_position = Vector2(0, 0)

func get_closest_ally() -> Node2D:
	var closest_ally: Node2D = null
	for member: Node in get_tree().get_nodes_in_group("ally"):
		if closest_ally == null:
			closest_ally = member
		else:
			if global_position.distance_squared_to(closest_ally.global_position) > global_position.distance_squared_to(member.global_position):
				closest_ally = member

	return closest_ally

extends CharacterBody2D

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@export var SPEED: int = 50
@export var player: Node2D

func _physics_process(_delta: float) -> void:
	var next_path_pos: Vector2 = nav_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_pos) * SPEED
	
	velocity = new_velocity
	
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = player.global_position

func _on_timer_timeout() -> void:
	makepath()

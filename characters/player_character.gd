extends CharacterBody2D

var speed: int = 100

@export var weapon: Node2D

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("move_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("move_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		direction += Vector2.LEFT
	
	if direction.x < 0:
		$Sprite2D.flip_h = true
	elif direction.x > 0:
		$Sprite2D.flip_h = false

	move_and_collide(direction * speed * delta)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	weapon.position = position

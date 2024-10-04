extends Node2D

class_name PunchAttack

@onready var damage_box: DamageBox = $PunchRadius/DamageBox
var damage: float = 10

var anim_speed: float = 1
var begin_free_countdown: bool = false
var frames_to_process: int = 2

func _ready() -> void:
	$AnimationPlayer.play("punch", -1, anim_speed)
	damage_box.damage = damage
	damage_box.monitoring = false
	damage_box.vulnerable_groups = ["ally"]

func _physics_process(_delta: float) -> void:
	if begin_free_countdown:
		frames_to_process -= 1
		if frames_to_process == 0:
			queue_free()

func init_punch(pos: Vector2, attack_damage: float, attack_speed: float) -> void:
	position = pos
	anim_speed = attack_speed
	damage = attack_damage

func hit() -> void:
	damage_box.monitoring = true
	begin_free_countdown = true

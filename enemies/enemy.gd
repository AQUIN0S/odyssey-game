extends CharacterBody2D

var health: int
@export var enemy_health: Label

func _ready() -> void:
	health = 10
	enemy_health.text = "%s" % health

func hurt() -> void:
	health -= 1
	enemy_health.text = "%s" % health

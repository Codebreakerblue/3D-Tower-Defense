extends Node


@export var max_health: float
@export var health: float
@export var healthbar: Node
@export var hitbox: Node

func _ready():
	recieve_damage(10)
	
	
func recieve_damage(damage):
	health -= damage
	if healthbar != null:
		healthbar.update_health_bar(health)

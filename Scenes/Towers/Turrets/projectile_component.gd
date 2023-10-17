extends Node

@onready var parent = get_parent()
@onready var aimer = get_parent().get_parent().get_parent()
@export var speed = 10

func move(delta):
	var velocity = aimer.transform.basis.z
	parent.position += velocity * speed * delta


func _physics_process(delta):
	move(delta)
	

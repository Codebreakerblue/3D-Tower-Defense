extends Node

@onready var parent = get_parent()	#gets parent I.E. the root of the projectile
@onready var aimer = get_parent().get_parent().get_parent() #gets the node
@export var speed = 10


func move(delta):
	var forward = -parent.transform.basis.z
	parent.position += forward * speed * delta


func _physics_process(delta):
	move(delta)
	

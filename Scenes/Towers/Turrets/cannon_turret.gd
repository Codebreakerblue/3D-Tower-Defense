extends Node3D

var target

func _ready():
	target = get_node("../TestTarget")

func _process(delta):
	turret_aim()

func turret_aim():
	get_node("TurretHead").look_at(target.position, Vector3(0,1,0), true) ## looks at target position, using the default up vector, and using the model's own "forward" direction

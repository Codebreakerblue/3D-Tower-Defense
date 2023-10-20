extends Node

var target 


@export var target_provider: Node
@onready var parent = get_parent()
var aim_position

func _ready():
	if target_provider == null:
		target_provider = $".."
	aim_position = parent.position
	aim_position.z = parent.position.z + 1
	print(aim_position)


func _physics_process(delta):
	aim()
	
	
func aim():
	if target == null: 
		pass
	
	var target_position = target.global_position
	parent.look_at(target_position, Vector3(0,1,0), true) ## looks at target position, using the default up vector, and using the model's own "forward" direction


func assign_aimed_target():
	target = target_provider.target
	

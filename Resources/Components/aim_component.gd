extends Node

var target 
@export var target_provider: Node
@onready var parent = get_parent()

func _ready():
	if target_provider == null:
		target_provider = $".."
	print(target_provider)
	
	
func _physics_process(delta):
	lerped_aim()
	
	
func lerped_aim():
	if target == null: 
		pass
	
	var aim_tween = create_tween()
	get_parent().look_at(target.global_position, Vector3(0,1,0), true) ## looks at target position, using the default up vector, and using the model's own "forward" direction
	aim_tween.tween_property(parent, target.position, 
	
func assign_aimed_target():
	target = target_provider.target
	

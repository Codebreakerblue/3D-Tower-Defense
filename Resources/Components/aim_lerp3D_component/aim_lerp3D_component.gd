extends Node

var target 

@onready var lerp_aim_point = $LerpAimPoint
@onready var parent = get_parent()

@export var target_provider: Node
@export var lerp_time = .1

func _ready():
	if target_provider == null:
		target_provider = $".."


func _physics_process(delta):
	lerped_aim()
	
	
func lerped_aim():
	if target == null: 
		pass
	
	var target_position = target.global_position
	var aim_tween = create_tween()
	aim_tween.tween_property(lerp_aim_point, "position", target_position, lerp_time)
	parent.look_at(lerp_aim_point.position, Vector3(0,1,0), true) ## looks at target position, using the default up vector, and using the model's own "forward" direction
	
func assign_aimed_target():
	target = target_provider.target
	

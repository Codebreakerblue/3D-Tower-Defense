extends Node3D

var target

func _ready():
	target = $"../SceneElements/TestTargetPath/TestTarget/AimPoint"
	
func _physics_process(delta):
	turret_aim()
	
func turret_aim():
	$TurretHead.look_at(target.global_position, Vector3(0,1,0), true) ## looks at target position, using the default up vector, and using the model's own "forward" direction)

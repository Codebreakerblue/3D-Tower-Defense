extends Node3D

@onready var target = $/root/GameScene/SceneElements/TestTargetPath/TestTarget/AimPoint
@onready var aim_component = $TurretHead/AimLerp3DComponent

func _ready():
	aim_component.assign_aimed_target()
	

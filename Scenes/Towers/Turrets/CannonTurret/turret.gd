extends Node3D

@onready var target = $"../TestMap/EnemyPath/TestEnemy/AimPoint"
@onready var aim_component = $TurretHead/AimLerp3DComponent
@onready var fire_component = $TurretHead/FireComponent

func _ready():
	aim_component.assign_aimed_target()
	fire_component.assign_aimed_target()

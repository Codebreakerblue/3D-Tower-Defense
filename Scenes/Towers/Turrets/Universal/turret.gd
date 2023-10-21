extends Node3D

var turret_type = "Turret"
var target = Node

#@onready var target = $"../TestMap/EnemyPath/TestTank"
@onready var aim_component = $TurretHead/AimLerp3DComponent
@onready var shoot_component = $TurretHead/BarrelEnd/ShootProjectileComponent

func _ready():
	choose_target()
	aim_component.assign_aimed_target()
	#shoot_component.assign_aimed_target()

func choose_target():
	target = $"../TestMap/EnemyPath/TestTank" ## EXTREMELY temporary, TODO fix this garbage code

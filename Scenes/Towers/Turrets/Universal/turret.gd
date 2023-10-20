extends Node3D

var turret_type = "Turret"


@onready var target = $"../TestMap/EnemyPath/TestTank"
@onready var aim_component = $TurretHead/AimLerp3DComponent
@onready var fire_component = $TurretHead/BarrelEnd/ShootProjectileComponent

func _ready():
	aim_component.assign_aimed_target()
	#fire_component.assign_aimed_target()

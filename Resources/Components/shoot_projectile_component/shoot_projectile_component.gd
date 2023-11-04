extends Node

var target 

var ready_to_fire = true

#Set using inspector
# TODO get these variables from game_data.gd

var gamedata = "GameData"

@export var rof = 60
@export var projectile_scene_1 : PackedScene	#what projectile to shoot
@export var target_provider : Node	#what node is sending target information
@export var projectile_life = 1 #how long in seconds projectiles last before despawning
@export var aim_inaccuracy = 0 #degrees of aim randomness

@onready var fire_point = get_parent()	#what point to spawn projectiles on
@onready var turret_type = $"../../..".turret_type

func _ready():
#	print(turret_type)
	pass

func _physics_process(_delta):
	if target == null:
		if target_provider.target != null:
			assign_aimed_target()
	
	fire()


func fire():
	if target == null:
		return
	
	if ready_to_fire:
		ready_to_fire = false
		spawn_projectile(projectile_scene_1)
		await get_tree().create_timer(60.0/rof).timeout
		ready_to_fire = true


func spawn_projectile(projectile_type):
	var projectile = projectile_type.instantiate()
	add_child(projectile)
	
	var random_vector = Vector3(randf_range(-1, 1), randf_range(-1, 1), randf_range(-1, 1)).normalized() # make random normalized vector
	
	projectile.position = fire_point.global_position
	projectile.rotation = fire_point.global_rotation.rotated(random_vector, deg_to_rad(aim_inaccuracy))
	await get_tree().create_timer(1).timeout
	projectile.queue_free()

func assign_aimed_target():
	target = target_provider.target

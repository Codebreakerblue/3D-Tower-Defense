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
@export var aim_inaccuracy: float = 0 #magnitude of aim randomness vector
## TODO why is this not working
## aim_inaccuracy is always what it's set to here, not what it's set to in the editor panel >:(


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
	
	var rand_x = 0
	var rand_y = 0
	var rand_z = 0
	
	print(aim_inaccuracy)
	
	if aim_inaccuracy != 0:
		rand_x = randf_range(0 - aim_inaccuracy, aim_inaccuracy)
		randomize()
		rand_y = randf_range(0 - aim_inaccuracy, aim_inaccuracy)
		randomize()
		rand_z = randf_range(0 - aim_inaccuracy, aim_inaccuracy)
		randomize()
	
	print(rand_x, rand_y, rand_z)
	
	var random_aim_vector = fire_point.global_rotation + Vector3(rand_x, rand_y, rand_z)
	
	projectile.position = fire_point.global_position
	projectile.rotation = random_aim_vector
	
	await get_tree().create_timer(projectile_life).timeout
	projectile.queue_free()

func assign_aimed_target():
	target = target_provider.target

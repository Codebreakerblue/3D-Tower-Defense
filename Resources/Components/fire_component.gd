extends Node

var target #might be useless now

var ready_to_fire = true
var rof = .1

#Set using inspector
@export var projectile_scene_1 : PackedScene	#what projectile to shoot
@export var target_provider : Node	#what node is sending target information
@export var fire_point : Node	#what point to spawn projectiles on
@export var projectile_life = 1 #how long in seconds projectiles last before despawning


func _physics_process(delta):
	fire()


func fire():
	if ready_to_fire:
		ready_to_fire = false
		spawn_projectile(projectile_scene_1)
		await get_tree().create_timer(rof).timeout
		ready_to_fire = true


func spawn_projectile(projectile_type):
	var projectile = projectile_type.instantiate()
	add_child(projectile)
	projectile.position = fire_point.global_position
	projectile.look_at(target.global_position)
	await get_tree().create_timer(1).timeout
	projectile.queue_free()

func assign_aimed_target():	##might be useless now
	target = target_provider.target

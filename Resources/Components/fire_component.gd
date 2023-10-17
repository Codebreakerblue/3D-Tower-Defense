extends Node

var target

var ready_to_fire = true
var rof = .1

@export var projectile_scene_1 : PackedScene
@export var target_provider : Node
@export var projectile_life = 1

func _physics_process(delta):
	fire()


func fire():
	if ready_to_fire:
		ready_to_fire = false
		spawn_projectile(projectile_scene_1)
		await get_tree().create_timer(rof).timeout
		ready_to_fire = true


func spawn_projectile(projectile_type):
	var projectile = projectile_scene_1.instantiate()
	add_child(projectile)
	projectile.position = get_parent().global_position
	projectile.look_at(target.position)
	await get_tree().create_timer(1).timeout
	projectile.queue_free()

func assign_aimed_target():
	target = target_provider.target

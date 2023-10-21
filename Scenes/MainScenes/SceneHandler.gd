extends Node

func _ready():
	var game_scene = load("res://Scenes/MainScenes/game_scene.tscn").instantiate()
	add_child(game_scene)
#	print(game_scene.name + " loaded")


extends Node

func _ready():
	print("ready!")
	var game_scene = load("res://Scenes/MainScenes/game_scene.tscn").instantiate()
	print(game_scene.name + " loaded")
	add_child(game_scene)

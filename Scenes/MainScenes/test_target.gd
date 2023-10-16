extends PathFollow3D

@export var speed : float 

func move(delta):
	set_progress(get_progress() + speed * delta)


func _process(delta):
	move(delta)
	

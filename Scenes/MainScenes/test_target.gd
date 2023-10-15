extends PathFollow3D

var speed = 1
var x = 1
var y = .2
var z = 1

func move(delta):
	set_progress(get_progress() + speed * delta)
	
func _process(delta):
	move(delta)
	

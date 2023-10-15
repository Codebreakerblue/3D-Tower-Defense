extends PathFollow3D

var speed = 1
var x = 1
var y = .2
var z = 1

func move(delta):

##	x += speed * delta
#	z += speed * delta
#	print(x)
#	var new_position = Vector3 (x, y, z)
	set_progress(get_progress() + speed * delta)
#	position = new_position
func _process(delta):
	move(delta)
	

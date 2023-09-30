extends RigidBody2D

var doMove: bool = false
var type = "object"

func _ready():
	var onScreen = VisibleOnScreenNotifier2D.new()
	add_child(onScreen)

func _physics_process(delta):
	if position.y > 0:
		queue_free()
	pass

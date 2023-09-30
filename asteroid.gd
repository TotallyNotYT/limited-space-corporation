extends RigidBody2D

var doMove: bool = false
var type = "object"
@onready var rocket: RigidBody2D = $"/root/LevelFlying/physicsRocket"

func _ready():
	var onScreen = VisibleOnScreenNotifier2D.new()
	add_child(onScreen)

func _physics_process(delta):
	if position.y > (rocket.position.y + 1000):
		Global.asteroidCount -= 1
		queue_free()
	pass

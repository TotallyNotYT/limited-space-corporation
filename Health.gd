extends Label

@onready var physicsRocket = get_node("/root/LevelFlying/physicsRocket")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Health: " + str(physicsRocket.health)
	pass

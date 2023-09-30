extends Timer

@export var objectScene: PackedScene = null
@onready var rocket: Node2D = get_node("/root/LevelFlying/physicsRocket")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
	pass
	
func _on_timeout():
	print("passing 1500", rocket)
	if rocket.position.y > -1500:
		return
		
	var newAsteroid: RigidBody2D = objectScene.instantiate()
	newAsteroid.position = rocket.position * 2
	newAsteroid.position.y -= 1000
	newAsteroid.position.x = randi_range(-1600, 1600)

	var scale = randf_range(0.1, 0.8)	
	newAsteroid.get_node("./CollisionShape2D")
	newAsteroid.get_node("./AnimatedSprite2D")
	print("passing 1500", rocket)
	add_child(newAsteroid)
	pass # Replace with function body.

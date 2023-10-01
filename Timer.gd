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

	if rocket.position.y < -10000:
		print("10000 reached")
		stop()
		
	if rocket.position.y > -500:
		return
		
	if randi() % 2 == 0:
		return
	
	if Global.asteroidCount > 100:
		return
	
	Global.asteroidCount += 1
	var newAsteroid: RigidBody2D = objectScene.instantiate()
	newAsteroid.position = rocket.position * 2
	newAsteroid.position.y -= 1000
	newAsteroid.position.x = randi_range(-1600, 1600)
	newAsteroid.rotation = deg_to_rad(randi_range(0, 360))
	
	var variant = "default"
	if randf_range(0.1, 1) < 0.4:
		variant = "default"
	elif randf_range(0.1, 1) < 0.4:
		variant = "alternative1"
	else: variant = "alternative2"

	newAsteroid.get_node("./CollisionShape2D")
	newAsteroid.get_node("./AnimatedSprite2D").animation = variant
	add_child(newAsteroid)
	pass # Replace with function body.

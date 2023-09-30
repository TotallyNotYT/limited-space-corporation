extends StaticBody2D

@onready var rocket: RigidBody2D = $"../physicsRocket"
@onready var collisionRight: CollisionShape2D = $CollisionShapeRight
@onready var collisionLeft: CollisionShape2D = $CollisionShapeLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	collisionRight.position.y = rocket.position.y
	collisionLeft.position.y = rocket.position.y

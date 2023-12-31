extends RigidBody2D

var doMove: bool = false
var type = "object"
@onready var rocket: RigidBody2D = $"/root/LevelFlying/physicsRocket"
@onready var damageSound: AudioStreamPlayer = $DamageSound
@onready var deathSound: AudioStreamPlayer = $DeathSound

func _ready():
	var onScreen = VisibleOnScreenNotifier2D.new()
	add_child(onScreen)

func _physics_process(delta):
	if position.y > (rocket.position.y + 1000):
		Global.asteroidCount -= 1
		queue_free()
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("physicsRocket"):
		damageSound.play()
		rocket.health -= 1
		
		if rocket.health == 0:
			deathSound.play()
		
	

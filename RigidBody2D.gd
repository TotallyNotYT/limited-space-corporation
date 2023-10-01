extends RigidBody2D
@onready var leftFire: CPUParticles2D = $RocketParticlesLeft
@onready var rightFire: CPUParticles2D = $RocketParticlesRight
@onready var body: CollisionShape2D = $CollisionShape2D
@onready var icon: AnimatedSprite2D = $AnimatedSprite2D

@export var maxFuel: float = 100
@export var fuel: float = 100
@export var isAlive: bool = true
@export var health: int = 3

const SPEED = 300

func _physics_process(delta):
	icon.animation = "default"
	icon.scale.x = 0.249
	icon.scale.y = 0.249
	
	leftFire.emitting = false
	rightFire.emitting = false

	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionY = Input.get_axis("fly forward", "fly backward")
	
	if Input.is_action_pressed("turn left") && fuel > 0:
			leftFire.emitting = true
			rotate(-0.05)
			if not directionY:
				fuel-= 1.0 / 20.0

	if Input.is_action_pressed("turn right") && fuel > 0:
			rightFire.emitting = true
			rotate(0.05)
			if not directionY:
				fuel-= 1.0 / 20.0

	if directionY && fuel > 0:
		leftFire.emitting = true
		rightFire.emitting = true
		if directionY && Input.is_action_pressed("fly forward") && fuel > 0:
			apply_force(Vector2(-1, -1).rotated(rotation + deg_to_rad(45)) * SPEED)
			fuel-= 1.0 / 20.0
		if directionY && Input.is_action_pressed("fly backward") && fuel > 0:
			apply_force(Vector2(0.5, 0.5).rotated(rotation + deg_to_rad(45)) * SPEED)
			fuel-= 1.0 / 20.0
			
	if fuel < 0 or health <= 0:
		isAlive = false
		health = 0
		icon.animation = "dead"
		icon.scale.x = 0.05
		icon.scale.y = 0.05

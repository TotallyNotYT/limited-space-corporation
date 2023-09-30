extends RigidBody2D
@onready var leftFire: CPUParticles2D = $RocketParticlesLeft
@onready var rightFire: CPUParticles2D = $RocketParticlesRight
@onready var body: CollisionShape2D = $CollisionShape2D

const SPEED = 300

func _physics_process(delta):
	leftFire.emitting = false
	rightFire.emitting = false

	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionY = Input.get_axis("fly forward", "fly backward")
	var directionX = Input.get_axis("turn left", "turn right")
	if directionX:
		if directionX && Input.is_action_pressed("turn left"):
			leftFire.emitting = true
			rotate(-0.05)

		if directionX && Input.is_action_pressed("turn right"):
			rightFire.emitting = true
			rotate(0.05)

	if directionY:
		leftFire.emitting = true
		rightFire.emitting = true
		if directionY && Input.is_action_pressed("fly forward"):
			apply_force(Vector2(-1, -1).rotated(rotation + deg_to_rad(45)) * SPEED)
		if directionY && Input.is_action_pressed("fly backward"):
			apply_force(Vector2(0.5, 0.5).rotated(rotation + deg_to_rad(45)) * SPEED)

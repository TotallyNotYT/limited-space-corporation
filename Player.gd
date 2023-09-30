extends CharacterBody2D
@onready var leftFire: CPUParticles2D = $RocketParticlesLeft
@onready var rightFire: CPUParticles2D = $RocketParticlesRight
@onready var body: CollisionShape2D = $CollisionShape2D





const SPEED = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.



#math.clamp



func _physics_process(delta):
	leftFire.emitting = false
	rightFire.emitting = false
#	var screensize = get_viewport().get_visible_rect().size

	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionY = Input.get_axis("fly forward", "fly backward")
	var direction = Input.get_axis("turn left", "turn right")
	if direction:
		#velocity.x = direction * SPEED
		if direction && Input.is_action_pressed("turn left"):
			#get_node("CollisionShape2D/RocketParticlesLeft")
			leftFire.emitting = true
			rotate(0.05)

		if direction && Input.is_action_pressed("turn right"):
			#get_node("CollisionShape2D/RocketParticlesLeft")
			rightFire.emitting = true
			rotate(-0.05)

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionY:
		#velocity.y = directionY * SPEED
		move_local_y(directionY * SPEED)
		
		leftFire.emitting = true
		rightFire.emitting = true
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

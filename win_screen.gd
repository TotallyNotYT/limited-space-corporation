extends Node2D

@onready var rocketParticleLeft: CPUParticles2D = $physicsRocket/RocketParticlesLeft
@onready var rocketParticleRight: CPUParticles2D = $physicsRocket/RocketParticlesRight
@onready var physicsRocket: RigidBody2D = $physicsRocket


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rocketParticleLeft.emitting = true
	rocketParticleRight.emitting = true
	
	rocketParticleLeft.direction.x = -1
	rocketParticleRight.direction.x = 1
	
	rocketParticleLeft.direction.y = 1
	
	physicsRocket.fuel = 1000


func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://homescreen.tscn")


func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://space.tscn")

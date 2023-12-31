extends Node2D
@onready var confirmationRestart: ConfirmationDialog = $ConfirmationDialog
@onready var canvasLayerRestart: CanvasLayer = $CanvasLayerRestart
@onready var endPlanet: Area2D = $AreaEndPlanet
@onready var collisionTop: CollisionShape2D = $Border/CollisionShapeTop
@onready var physicsRocket: RigidBody2D = $physicsRocket
@onready var startingPlanet: AnimatedSprite2D = $StartPlanet/StaticBodyStartPlanet/CollisionShape2D/PlanetSprite2D
@onready var endingPlanet: AnimatedSprite2D = $AreaEndPlanet/CollisionShape2D/PlanetSprite2d


# Called when the node enters the scene tree for the first time.
func _ready():
	endPlanet.position.y = -12000
	collisionTop.position.y = -12000
	Global.asteroidCount = 0
	startingPlanet.animation = Global.startingPlanet
	endingPlanet.animation = Global.endingPlanet
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not physicsRocket.isAlive:
		canvasLayerRestart.visible = true

	if Input.is_action_pressed("restart"):
		confirmationRestart.visible = true
	


func _on_confirmation_dialog_confirmed():
	get_tree().reload_current_scene()


func _on_confirmation_dialog_canceled():
	confirmationRestart.visible = false


func _on_area_end_planet_body_entered(body):
	if body.is_in_group("physicsRocket"):
		get_tree().change_scene_to_file("res://win_screen.tscn")
		

func _on_button_restart_pressed():
	get_tree().reload_current_scene()


func _on_button_home_pressed():
	get_tree().change_scene_to_file("res://homescreen.tscn")

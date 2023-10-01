extends Node2D

@onready var startingPlanet: AnimatedSprite2D = $StartPlanetSprite2D
@onready var endingPlanet: AnimatedSprite2D = $EndPlanetSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var randStartPlanet = randi_range(1, 6)
	var randEndPlanet = randi_range(1, 6)
	
	print(randStartPlanet)
	print(randEndPlanet)
	
	match(randStartPlanet):
		1: 
			Global.startingPlanet = "earth"
		2:
			Global.startingPlanet = "mars"
		3:
			Global.startingPlanet = "radio"
		4:
			Global.startingPlanet = "saturn"
		5:
			Global.startingPlanet = "venus"
		6:
			Global.startingPlanet = "yellow"
			
	match(randEndPlanet):
		1: 
			Global.endingPlanet = "earth"
		2:
			Global.endingPlanet = "mars"
		3:
			Global.endingPlanet = "radio"
		4:
			Global.endingPlanet = "saturn"
		5:
			Global.endingPlanet = "venus"
		6:
			Global.endingPlanet = "yellow"
	
	if Global.startingPlanet == Global.endingPlanet:
		Global.endingPlanet = "earth"
			
	startingPlanet.animation = Global.startingPlanet
	endingPlanet.animation = Global.endingPlanet


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_the_space_button_pressed():
	get_tree().change_scene_to_file("res://level_flying.tscn")

extends Node2D
@onready var confirmationRestart: ConfirmationDialog = $ConfirmationDialog


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("restart"):
		confirmationRestart.visible = true
	


func _on_confirmation_dialog_confirmed():
	get_tree().reload_current_scene()


func _on_confirmation_dialog_canceled():
	confirmationRestart.visible = false

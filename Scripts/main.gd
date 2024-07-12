extends Node



func _input(event):
	if event.is_action_pressed("my_action"):
		$HUD/Label.visible = true 
	if event.is_action_released("my_action"):
		$HUD/Label.visible = false

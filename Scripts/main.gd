extends Node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("my_action"):
		$HUD/Label.visible = true 
	if event.is_action_released("my_action"):
		$HUD/Label.visible = false

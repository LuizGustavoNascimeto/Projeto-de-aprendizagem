extends Area3D

var current_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene = get_tree().get_current_scene()
	

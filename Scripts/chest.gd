extends StaticBody3D

var isOpen = false
@onready var interact_area = $Area3D
@onready var animation_player = $AnimationPlayer

func start_animation(interact_value):
	var animation
	animation = "close" if isOpen else "open"
	animation_player.play(animation)
	isOpen = not isOpen


extends Node3D

func _on_area_3d_1_body_entered(body):
	if body == $"../CharacterBody3D":

		$Camera3D1.current = true

func _on_area_3d_2_body_entered(body):
	if body == $"../CharacterBody3D":

		$Camera3D2.current = true

func _on_area_3d_3_body_entered(body):
	if body == $"../CharacterBody3D":

		$Camera3D3.current = true


func _on_area_3d_4_body_entered(body):
	if body == $"../CharacterBody3D":

		$Camera3D4.current = true


extends Node3D

var camArea
func _ready():
	camArea = get_tree().get_nodes_in_group("camArea")
	for area:Area3D in camArea:
		area.body_entered.connect(switchCam.bind(area.name))
	
func switchCam(body: Node3D, areaName):
	if body == $"../CharacterBody3D":
		var cam:Camera3D = findCam(areaName)
		cam.current = true

func findCam(areaName: String):
	var numCam = areaName.get_slice("3D", 1)
	var camName = "Camera3D" + numCam
	return get_node(camName)
		


extends Node

@onready var all_interactions = []
@onready var interactLabel:Label = $HUD/interactLabel
@onready var character_interaction: Area3D = $CharacterBody3D.get_child(2)

func _ready():
	character_interaction.area_entered.connect(_on_area_3d_area_entered)
	character_interaction.area_exited.connect(_on_area_3d_area_exited)
	
	update_interactions()

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("interact"):
		execute_interactions()
		
func _on_area_3d_area_entered(area):
	all_interactions.insert(0, area)
	update_interactions()

func _on_area_3d_area_exited(area):
	all_interactions.erase(area)
	update_interactions()
	
func update_interactions():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""

func execute_interactions():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		match cur_interaction.interact_type:
			"text":
				print("funciona")
			"animation":
				var animated_body = cur_interaction.owner
				animated_body.start_animation(cur_interaction.interact_value)

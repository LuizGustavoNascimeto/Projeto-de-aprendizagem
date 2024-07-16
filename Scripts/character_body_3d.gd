extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const rotation_speed = 10
@onready var body: MeshInstance3D = $MeshInstance3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("turn_right", "turn_left", "move_backward", "move_forward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction.x:
		body.rotate_y(direction.x * rotation_speed * delta)
	if direction.z:
		var vector_forward = Vector3.FORWARD.rotated(Vector3.UP, body.rotation.y)
		velocity = vector_forward * SPEED * direction.z

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

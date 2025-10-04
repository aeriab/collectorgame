extends Node2D

const ROT_SPEED = 160.0
const FRICTION = 600.0
var current_rot_speed = 0.0

var direction = Input.get_axis("rotate_clockwise", "rotate_counter")

func _physics_process(delta):
	# Get input axis every frame. I swapped the order to be more standard
	# (counter-clockwise is negative, clockwise is positive).
	var direction = Input.get_axis("rotate_counter", "rotate_clockwise")

	if direction:
		# If there's input, set the speed directly
		current_rot_speed = direction * ROT_SPEED
	else:
		# Otherwise, slow down to a stop (move toward zero)
		current_rot_speed = move_toward(current_rot_speed, 0, FRICTION * delta)

	# Apply the rotation to the Node2D itself
	rotation_degrees += current_rot_speed * delta
	rotation_degrees = clamp(rotation_degrees, -60, 60)

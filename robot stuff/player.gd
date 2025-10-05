extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var pixel_robot = $RobotSprites/PixelRobot


func _physics_process(delta):
	scale = Vector2(Global.robot_size,Global.robot_size)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		pixel_robot.flip_h = true
	elif direction < 0:
		pixel_robot.flip_h = false
	
	# Apply movement
	if direction:
		velocity.x = direction * Global.move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, Global.move_speed)
	
	move_and_slide()

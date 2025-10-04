extends CharacterBody2D

const SPEED = 160.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var pixel_robot_sprite = $PixelRobotSprite

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		pixel_robot_sprite.flip_h = true
	elif direction < 0:
		pixel_robot_sprite.flip_h = false
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

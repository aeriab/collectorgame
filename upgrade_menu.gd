extends CanvasLayer

signal upgrade_selected(upgrade_name)
signal rerolled
signal round_advanced

# Link to the nodes we need to access
@onready var animation_player = $AnimationPlayer
@onready var next_round_button: Button = $PanelContainer/VBoxContainer/HBoxContainerShop/NextRoundButton

func _ready():
	hide()
	next_round_button.pressed.connect(_on_next_round_pressed)
	animation_player.animation_finished.connect(_on_animation_finished)

func show_menu():
	show() # Make the CanvasLayer visible
	animation_player.play("slide_in")

# This function is called when the "Next Round" button is pressed
func _on_next_round_pressed():
	animation_player.play("slide_out")
	round_advanced.emit() # Let the main game know the round is over

# This runs when either animation finishes
func _on_animation_finished(anim_name):
	# If the 'slide_out' animation just finished, hide the whole node
	# This prevents it from capturing mouse clicks when it's invisible
	if anim_name == "slide_out":
		hide()

func _on_upgrade_pressed(upgrade_name):
	print("Player chose upgrade: ", upgrade_name)
	upgrade_selected.emit(upgrade_name)

func _on_reroll_pressed():
	print("Player rerolled upgrades.")
	rerolled.emit()

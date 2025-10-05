extends Node2D
@onready var game_going_stuff = $GameGoingStuff
@onready var game_over_stuff = $GameOverStuff
@onready var upgrade_menu = $GameGoingStuff/UpgradeMenu
@onready var victory_stuff = $VictoryStuff

@onready var instruction_1 = $NextRoundStuff/Instruction1
@onready var instruction_2 = $NextRoundStuff/Instruction2
@onready var instruction_3 = $NextRoundStuff/Instruction3
@onready var instruction_4 = $NextRoundStuff/Instruction4

func play_instructions():
	if (Global.round == 1):
		# First, ensure all instructions start as invisible
		instruction_1.modulate.a = 0
		instruction_2.modulate.a = 0
		instruction_3.modulate.a = 0
		instruction_4.modulate.a = 0

		# Create a tween to handle the animation sequence
		var tween = create_tween()
		
		# Chain all animations together. They will play in this order.
		
		# --- Instruction 1 ---
		tween.tween_property(instruction_1, "modulate:a", 1.0, 1.5) # Fade in
		tween.tween_interval(3.5)                                  # Wait
		tween.tween_property(instruction_1, "modulate:a", 0.0, 1.5) # Fade out
		
		# --- Instruction 2 ---
		tween.tween_property(instruction_2, "modulate:a", 1.0, 1.5) # Fade in
		tween.tween_interval(3.5)                                  # Wait
		tween.tween_property(instruction_2, "modulate:a", 0.0, 1.5) # Fade out
		
		# --- Instruction 3 ---
		tween.tween_property(instruction_3, "modulate:a", 1.0, 1.5) # Fade in
		tween.tween_interval(3.5)                                  # Wait
		tween.tween_property(instruction_3, "modulate:a", 0.0, 1.5) # Fade out
		
		# --- Instruction 4 ---
		tween.tween_property(instruction_4, "modulate:a", 1.0, 1.5) # Fade in
		tween.tween_interval(3.5)                                  # Wait
		tween.tween_property(instruction_4, "modulate:a", 0.0, 1.5) # Fade out

func _ready():
	Global.stop_round.connect(_on_stop_round)
	Global.game_over.connect(_on_game_over)

func _on_stop_round():
	if Global.round == 16:
		victory_stuff.visible = true
		game_going_stuff.visible = false
	else:
		upgrade_menu.show_menu()

func _on_game_over():
	game_going_stuff.visible = false
	game_over_stuff.visible = true


func _on_endless_button_pressed():
	victory_stuff.visible = false
	game_going_stuff.visible = true
	upgrade_menu.show_menu()

extends Node2D
@onready var game_going_stuff = $GameGoingStuff
@onready var game_over_stuff = $GameOverStuff
@onready var upgrade_menu = $GameGoingStuff/UpgradeMenu
@onready var victory_stuff = $VictoryStuff

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

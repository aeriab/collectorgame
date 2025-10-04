extends Node2D
@onready var upgrade_menu: CanvasLayer = $UpgradeMenu

func _ready():
	Global.stop_round.connect(_on_stop_round)

func _on_stop_round():
	upgrade_menu.show_menu()

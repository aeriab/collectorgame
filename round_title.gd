extends Label

func _process(delta):
	text = "Round " + str(Global.round)
	if Global.round == 16:
		text = "Round 16\nFinal Round!"
	if Global.round == 1:
		text = "Welcome to\nWeather Collector"


func _ready():
	_on_round_start()
	Global.start_round.connect(_on_round_start)

@onready var game = $"../.."

func _on_round_start():
	print("made hererereer")
	# Set the initial state to fully transparent
	modulate.a = 0
	
	# Create a new tween to handle the animation sequence
	var tween = create_tween()
	
	# Chain the animations together in the order you want them to run:
	# 1. Fade in over 0.5 seconds
	tween.tween_property(self, "modulate:a", 1.0, 3.5)
	
	# 2. Wait for 2 seconds while the label is visible
	tween.tween_interval(3.0)
	
	# 3. Fade out over 1.0 second
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	
	tween.finished.connect(game.play_instructions)

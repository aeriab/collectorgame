# loading_bar.gd

extends ProgressBar

signal bar_full

func _ready():
	bar_full.connect(Global.on_bar_full)


func _process(delta: float) -> void:
	if Global.round_going:
		value += Global.round_progression_rate * delta
	if value >= max_value:
		value = 0
		bar_full.emit()

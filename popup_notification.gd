extends Node2D

func _ready():
	var tween = create_tween()
	modulate.a = 0.0
	position.y += 10
	tween.tween_property(self, "modulate:a", 1.0, 0.3).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "position:y", position.y - 50, 0.4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.tween_interval(0.5)
	tween.tween_property(self, "modulate:a", 0.0, 0.4)
	tween.finished.connect(queue_free)

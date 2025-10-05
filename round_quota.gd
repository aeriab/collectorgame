extends Label

func _process(delta):
	text = "Round Quota: $" + str(int(Global.round_quota))

extends Label

func show_value(value, travel, duration, spread, crit=false):
	text = value
	var movement = travel.rotated(randi_range(-spread/2, spread/2))
	pivot_offset = size / 2
	
	var tween : Tween = get_tree().create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT).set_parallel()
	
	tween.tween_property(self, "position", position + movement, duration).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "modulate:a", 0, duration).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	
	if crit:
		modulate = Color(1, 0, 0)
		tween.tween_property(self, "scale", scale, 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	await tween.finished
	queue_free()
	#tween.chain().tween_callback(self.queue_free)

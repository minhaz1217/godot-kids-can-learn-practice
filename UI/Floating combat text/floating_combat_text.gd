extends Label

func show_value(value, travel, duration, spread, crit=false):
	text = value
	var movement = travel.rotated(randi_range(-spread/2, spread/2))
	pivot_offset = size / 2
	
	$Tween.interpolate_property(self, "position", 
		position, position + movement, duration, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.interpolate_property(self, "modulate:a",
			1.0, 0.0, duration,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	if crit:
		modulate = Color(1, 0, 0)
		$Tween.interpolate_property(self, "scale",
			scale*2, scale,
			0.4, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.tween
	$Tween.start()
	
	#yield($Tween, "tween_all_completed")
	#queue_free()

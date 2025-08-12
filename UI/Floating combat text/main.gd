extends Node2D



var FCT = preload("res://UI/Floating combat text/Floating combat text.tscn")

@export var travel = Vector2(0, -80)
@export var duration = 1
@export var spread = PI/2

func show_value(value, crit=false):
	var fct = FCT.instantiate()
	fct.position = Vector2i(124, 124)
	add_child(fct)
	fct.show_value(str(value), travel, duration, spread, crit)

func _on_texture_button_pressed() -> void:
	show_value(randi_range(100, 1000), randi_range(1,4) == 1)

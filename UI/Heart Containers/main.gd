extends HBoxContainer

@onready var simple = $HeartContainers/HBoxContainer/simple
@onready var empty = $HeartContainers/HBoxContainer2/empty
@onready var partial = $HeartContainers/HBoxContainer3/partial
@onready var text_label: Label = $HeartContainers/Score

var health = 10

func _on_increase_button_pressed() -> void:
	health += 1
	health = min(10, health)
	update_things()


func _on_decrease_button_pressed() -> void:
	health -= 1
	health = max(0, health)
	update_things()



func update_things():
	simple.update_simple(health)
	empty.update_empty(health)
	partial.update_partial(health)
	text_label.set_text("Health: " + str(health))

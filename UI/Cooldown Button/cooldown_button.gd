extends TextureButton

@onready var time_label = $Counter/Value

@export var cooldown = 1.0

func _ready() -> void:
	time_label.hide()
	$Sweep.value = 0
	$Sweep.texture_progress = texture_normal
	$Sweep/Timer.wait_time = cooldown
	set_process(false)
	_on_ability_pressed()

func _process(delta: float) -> void:
	time_label.text = "%3.1f" % $Sweep/Timer.time_left
	$Sweep.value = int(($Sweep/Timer.time_left/cooldown) *100)

func _on_ability_pressed():
	disabled = true
	set_process(true)
	$Sweep/Timer.start()
	time_label.show()
	
func _on_timer_timeout() -> void:
	print("Ability ready")
	$Sweep.value = 0
	disabled = false
	time_label.hide()
	set_process(false)

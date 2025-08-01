extends CharacterBody2D


var run_speed := 80.0
var attacks := ["attack1", "attack2"]

@onready var state_machine: AnimationNodeStateMachinePlayback = $AnimationTree["parameters/playback"]

func _physics_process(delta: float) -> void:
	get_input()

func hurt():
	state_machine.travel("hurt")
	
func die():
	state_machine.travel("die")
	set_physics_process(false)

func get_input():
	var current = state_machine.get_current_node()
	velocity = Input.get_vector("ui_left", "ui_right" , "ui_up", "ui_down") * run_speed	
	
	#print("Velocity", velocity)
	
	
	if Input.is_action_just_pressed("attack"):
		state_machine.stop()
		state_machine.travel(attacks.pick_random())
		return
	
	if velocity.x != 0:
		$Sprite2D.scale.x = sign(velocity.x)*4
	
	if velocity.length() > 0:
		state_machine.travel("run")
	else:
		state_machine.travel("idle")
	move_and_slide()

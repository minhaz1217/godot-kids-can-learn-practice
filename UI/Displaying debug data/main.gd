extends Node2D
@onready var debug_overlay: MarginContainer = $DebugOverlay
@onready var spritesheet_animation: CharacterBody2D = $SpritesheetAnimation


func _ready() -> void:
	DebugOverlay.setup_debugger($DebugOverlay)
	DebugOverlay.add_property(spritesheet_animation, "transform:origin", "round")

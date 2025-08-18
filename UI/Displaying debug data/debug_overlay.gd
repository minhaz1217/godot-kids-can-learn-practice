extends MarginContainer

@export var enabled : bool = true

class Property:
	var num_format = "%4.2f"
	var object
	var property
	var label_ref
	var display
	var enabled = true
	
	func _init(_object, _property, _label, _display, _enabled=true):
		object = _object
		property = _property
		label_ref = _label
		display = _display
		enabled = _enabled
		
		
	func set_label():
		if(not enabled): return
		var s = object.name + "/" + property + " : "
		var p = object.get_indexed(property)
		
		match display:
			"":
				s += str(p)
			"length": 
				s += num_format % p.length()
			"round":
				match typeof(p):
					TYPE_INT, TYPE_FLOAT:
						s += num_format % p
					TYPE_VECTOR2, TYPE_VECTOR3:
						s += str(p.round())
		label_ref.text = s

var props: Array[Property] = []
var debug_overlay: Node

func _process(delta: float) -> void:
	if not visible or not enabled:
		return 
	
	for prop in props:
		prop.set_label()

func add_property(object, property, display):
	if(not debug_overlay):
		print("Debug Overlay not found")
		return
	var label = Label.new()
	print("Enabled: ", enabled)
	debug_overlay.get_node("VBoxContainer").add_child(label)
	props.append(Property.new(object, property, label, display, enabled))

func remove_property(object, property):
	for prop in props:
		if(prop.object == object and prop.property == property):
			props.erase(prop)

func setup_debugger(node):
	debug_overlay = node
	

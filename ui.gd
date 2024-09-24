extends SubViewportContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	UI.setHungerRect(get_node("Viewport/HungerRect"))

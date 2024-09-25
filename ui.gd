extends SubViewportContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	UI.setHungerRect(get_node("Viewport/HungerRect"))
	UI.setSpeedLabel(get_node("Viewport/SpeedLabel"))
	UI.weinerLabel = get_node("Viewport/BigWiener")
	UI.weinerLabel.hide()
	UI.ripLabel = get_node("Viewport/RIP")
	UI.ripLabel.hide()
